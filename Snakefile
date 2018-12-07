EXAMPLES = {
    "make": ["hello-world"],
    "snakemake": ["hello-world", "bye-world"],
    "nextflow": ["hello-world"]
}

FRAMEWORK_IDS = EXAMPLES.keys()

rule all:
    input:
        ["output/index.html"] +
        [f"output/examples/{example_id}/{framework_id}/result.yml" for framework_id, examples in EXAMPLES.items() for example_id in examples]
        

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

rule run_example:
    input:
        example_folder = "examples/{example_id}/{framework_id}/",
        example_script = "examples/{example_id}/{framework_id}/run.sh",
        digest = "output/container_digests/{framework_id}"
    output:
        "output/examples/{example_id}/{framework_id}/result.yml"
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
                bash /output/run.sh

            echo "true" > {output}
        """