#!/usr/bin/env nextflow

process hello {
    publishDir './', mode: 'copy'

    output:
    file 'hello-world.md' into hello_fiile

    """
    echo 'Hello world' > 'hello-world.md'
    """
}

hello_fiile.subscribe {
}
