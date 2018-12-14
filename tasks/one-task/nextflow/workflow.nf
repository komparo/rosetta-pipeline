#!/usr/bin/env nextflow

process write {
    publishDir './', mode: 'copy'

    output:
    file 'hello-world.md' into output_file

    """
    echo 'Hello world' > 'hello-world.md'
    """
}