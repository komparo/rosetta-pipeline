#!/usr/bin/env nextflow

process hello {
    publishDir './', mode: 'copy'

    output:
    file 'hello-world.md' into hello_fiile

    """
    echo 'Hello world' > 'hello-world.md'
    """
}

process bye {
    publishDir './', mode: 'copy'

    output:
    file 'bye-world.md' into bye_file

    """
    echo 'Bye world' > 'bye-world.md'
    """
}