#!/usr/bin/env nextflow

process write {
    publishDir './', mode: 'copy'

    container 'rosettapipeline/run-in-docker'

    output:
    file 'output.txt' into output_file

    """
    cp /file_inside_docker.txt output.txt
    """
}