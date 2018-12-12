import glob

EXAMPLES = {
    "make": ["hello-world", "bye-world"],
    "snakemake": ["hello-world", "bye-world"],
    "nextflow": ["hello-world", "bye-world"],
    "luigi": ["hello-world", "bye-world"],
    "airflow": ["hello-world"],
    "toil": ["hello-world"],
    "cromwell": ["hello-world"],
    "drake": ["hello-world"]
}

FRAMEWORK_IDS = EXAMPLES.keys()
EXAMPLES = [[framework_id, example_id] for framework_id, examples in EXAMPLES.items() for example_id in examples]

rule all:
    input:
        ["output/index.html", "README.md"] +
        [f"output/examples/{example_id}/{framework_id}/result.yml" for framework_id, example_id in EXAMPLES]

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

rule site:
    input:
        digests = ["output/container_digests/{framework_id}".format(framework_id = framework_id) for framework_id in FRAMEWORK_IDS]
    output:
        "output/index.html"
    shell:
        "echo {input} > {output}"

# function to get all files within the example folder as input
def list_example_inputs(wildcards):
    example_folder = f"examples/{wildcards.example_id}/{wildcards.framework_id}/"
    example_run = example_folder + "run.sh"
    example_files = glob.glob(example_folder + "*")

    example_container_digest = f"output/container_digests/{wildcards.framework_id}"

    return example_files + [example_container_digest]

rule run_example:
    input: list_example_inputs
    output:
        "output/examples/{example_id}/{framework_id}/result.yml"
    log:
        "output/examples/{example_id}/{framework_id}/log"
    shell:
        """
            rm -r output/examples/{wildcards.example_id}/{wildcards.framework_id}
            cp -r examples/{wildcards.example_id}/{wildcards.framework_id} output/examples/{wildcards.example_id}/

            docker run \
                --mount type=bind,source="$(pwd)"/output/examples/{wildcards.example_id}/{wildcards.framework_id},target=/output \
                --rm \
                -w /output \
                -u 1000 \
                rosettapipeline/{wildcards.framework_id} \
                bash /output/run.sh \
                &>> {log}

            echo "true" > {output}
        """

rule aggregate_examples:
    input: expand("output/examples/*/result.yml")
    output: "output/examples.tsv"
    script: "aggregate_examples.R"

rule render_readme:
    output: "README.md"
    input: "README.Rmd"
    params: EXAMPLES
    script: "README.Rmd"