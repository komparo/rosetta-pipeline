import glob
import os.path

# define all examples and frameworks
FRAMEWORK_EXAMPLES = {
    "make": ["one-task", "one-task-cached"],
    "snakemake": ["one-task", "one-task-cached", "chain", "merge", "split-merge"],
    "nextflow": ["one-task", "one-task-cached", "chain", "merge", "split-merge", "run-in-docker", "alternative-paths"],
    "luigi": ["one-task", "one-task-cached"],
    "airflow": ["one-task"],
    "toil": ["one-task"],
    "cromwell": ["one-task", "one-task-cached", "chain", "run-in-docker"],
    "drake": ["one-task"]
}

# filter frameworks if defined in config
# for example: `snakemake --config framework_id=snakemake` will only run the snakemake workflows
# this is used for continuous integration
if "framework_id" in config:
    FRAMEWORK_EXAMPLES = {key:value for key, value in FRAMEWORK_EXAMPLES.items() if key == config["framework_id"]}

FRAMEWORK_IDS = FRAMEWORK_EXAMPLES.keys()
EXAMPLES = [[framework_id, task_id] for framework_id, task_ids in FRAMEWORK_EXAMPLES.items() for task_id in task_ids]
TASK_IDS = set([example[1] for example in EXAMPLES])

# function to get all files within the example folder & task data folder as input
def list_example_inputs(wildcards):
    example_folder = f"tasks/{wildcards.task_id}/{wildcards.framework_id}/"
    example_run = example_folder + "run.sh"
    example_files = glob.glob(example_folder + "*")

    data_folder = f"tasks/{wildcards.task_id}/data/"
    data_files = glob.glob(data_folder + "*")

    example_container_digest = [f"output/container_digests/{wildcards.framework_id}"]

    if os.path.isfile(f"tasks/{wildcards.task_id}/Dockerfile"):
        task_container_digest =  [f"output/container_digests/{wildcards.task_id}"] 
    else:
        task_container_digest = []

    return example_files + data_files + example_container_digest + task_container_digest

# actual snakemake workflow
rule all:
    input:
        ["README.md", "comparison/README.md"] +
        [f"output/tasks/{task_id}/{framework_id}/result.yml" for framework_id, task_id in EXAMPLES] +
        [f"tasks/{task_id}/README.md" for task_id in TASK_IDS]

rule framework_docker:
    input:
        dockerfile = "containers/{framework_id}/Dockerfile"
    output:
        digest = "output/container_digests/{framework_id}"
    shell:
        """
            docker build -t rosettapipeline/{wildcards.framework_id} - < {input.dockerfile}
            docker inspect rosettapipeline/{wildcards.framework_id} > {output.digest}
        """

rule task_docker:
    input:
        dockerfile = "tasks/{task_id}/Dockerfile"
    output:
        digest = "output/container_digests/{task_id}"
    shell:
        """
            docker build -t rosettapipeline/{wildcards.task_id} - < {input.dockerfile}
            docker inspect rosettapipeline/{wildcards.task_id} > {output.digest}
        """

rule run_example:
    input: list_example_inputs
    output: "output/tasks/{task_id}/{framework_id}/result.yml"
    log: "output/tasks/{task_id}/{framework_id}/log"
    shell:
        """
            rm -r output/tasks/{wildcards.task_id}/{wildcards.framework_id}
            cp -r tasks/{wildcards.task_id}/{wildcards.framework_id} output/tasks/{wildcards.task_id}/
            if [ -d "tasks/{wildcards.task_id}/data/" ]; then
                cp -r tasks/{wildcards.task_id}/data/* output/tasks/{wildcards.task_id}/{wildcards.framework_id}
            fi

            # run docker
            # the working directory is mounted into the exact same location of the docker, so that docker-in-docker can mount subdirectories (necessary for e.g. nextflow)
            # we also set the group id to the "docker" group id, so that the user within the docker can run dockers

            GROUPID=`cut -d: -f3 < <(getent group docker)`
            docker run \
                --mount type=bind,source=$(pwd),target=$(pwd) \
                --rm \
                -w $(pwd)/output/tasks/{wildcards.task_id}/{wildcards.framework_id} \
                -v /var/run/docker.sock:/var/run/docker.sock \
                -u $(id -u):$GROUPID \
                rosettapipeline/{wildcards.framework_id} \
                bash run.sh \
                2>&1 | tee {log}

            echo "true" > {output}
        """

rule aggregate_tasks:
    input: 
        tasks = [f"tasks/{task_id}/task.yml" for task_id in TASK_IDS],
        examples = [f"tasks/{task_id}/{framework_id}/run.sh" for framework_id, task_id in EXAMPLES],
        script = "scripts/aggregate_tasks.R"
    output: "output/tasks.json"
    script: "scripts/aggregate_tasks.R"

rule render_readme:
    output: "README.md"
    input: 
        rmd = "scripts/templates/README.Rmd",
        tasks = "output/tasks.json"
    script: "scripts/templates/README.Rmd"

rule render_task_readmes:
    output: "tasks/{task_id}/README.md"
    input:
        task = "tasks/{task_id}/task.yml",
        task_fig = "tasks/{task_id}/task.svg",
        rmd = "scripts/templates/task.Rmd"
    script: "scripts/templates/task.Rmd"

rule render_comparison:
    output: "comparison/README.md"
    input:
        rmd = "scripts/templates/comparison.Rmd",
        tasks = "output/tasks.json"
    script: "scripts/templates/comparison.Rmd"