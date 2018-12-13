#!/usr/bin/env nextflow

lines = Channel.fromPath("lines/*.txt").buffer(size:6)

process merge {
    publishDir './', mode: 'copy'

    input:
    file 'line' from lines

    output:
    file "merged.txt" into merged

    """
    cat line* > merged.txt
    """
}

process fairytale {
    publishDir './', mode: 'copy'

    input:
    file 'merged' from merged

    output:
    file "fairytale.txt" into fairytale

    """
    echo 'And they lived happily ever after.' | cat merged - > fairytale.txt
    """
}
