import glob

# define all examples and frameworks
FRAMEWORK_EXAMPLES = {
    "make": ["write-file", "write-file-incremental"],
    "snakemake": ["write-file", "write-file-incremental"],
    "nextflow": ["write-file", "write-file-incremental"],
    "luigi": ["write-file", "write-file-incremental"],
    "airflow": ["write-file"],
    "toil": ["write-file"],
    "cromwell": ["write-file", "write-file-incremental"],
    "drake": ["write-file"]
}

# filter frameworks if defined in config
# for example: snakemake --config framework_id=snakemake
if "framework_id" in config:
    FRAMEWORK_EXAMPLES = {key:value for key, value in FRAMEWORK_EXAMPLES.items() if key == config["framework_id"]}

FRAMEWORK_IDS = FRAMEWORK_EXAMPLES.keys()
EXAMPLES = [[framework_id, example_id] for framework_id, example_ids in FRAMEWORK_EXAMPLES.items() for example_id in example_ids]

# function to get all files within the example folder as input
def list_example_inputs(wildcards):
    example_folder = f"tasks/{wildcards.example_id}/{wildcards.framework_id}/"
    example_run = example_folder + "run.sh"
    example_files = glob.glob(example_folder + "*")

    example_container_digest = f"output/container_digests/{wildcards.framework_id}"

    return example_files + [example_container_digest]

# actual snakemake workflow
rule all:
    input:
        ["README.md"] +
        [f"output/tasks/{example_id}/{framework_id}/result.yml" for framework_id, example_id in EXAMPLES]

rule docker:
    input:
        dockerfile = "containers/{framework_id}/Dockerfile"
    output:
        digest = "output/container_digests/{framework_id}"
    shell:
        """
            docker build -t rosettapipeline/{wildcards.framework_id} - < {input.dockerfile}
            docker inspect rosettapipeline/{wildcards.framework_id} > {output.digest}
        """

rule run_example:
    input: list_example_inputs
    output:
        "output/tasks/{example_id}/{framework_id}/result.yml"
    log:
        "output/tasks/{example_id}/{framework_id}/log"
    shell:
        """
            rm -r output/tasks/{wildcards.example_id}/{wildcards.framework_id}
            cp -r tasks/{wildcards.example_id}/{wildcards.framework_id} output/tasks/{wildcards.example_id}/

            docker run \
                --mount type=bind,source=$(pwd)/output/tasks/{wildcards.example_id}/{wildcards.framework_id},target=/output \
                --rm \
                -w /output \
                -v /var/run/docker.sock:/var/run/docker.sock \
                -u $(id -u):$(id -g) \
                rosettapipeline/{wildcards.framework_id} \
                bash /output/run.sh \
                2>&1 | tee {log}

            echo "true" > {output}
        """

rule aggregate_examples:
    input: expand("output/tasks/*/result.yml")
    output: "output/examples.tsv"
    script: "aggregate_examples.R"

rule render_readme:
    output: "README.md"
    input: "README.Rmd"
    params: EXAMPLES
    script: "README.Rmd"