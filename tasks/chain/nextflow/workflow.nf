#!/usr/bin/env nextflow

A = file("A.txt")
B = file("B.txt")
C = file("C.txt")

process AB {
    publishDir './', mode: 'copy'

    input:
    file A
    file B

    output:
    file "AB.txt" into AB

    """
    cat $A $B > "AB.txt"
    """
}

process ABC {
    publishDir './', mode: 'copy'

    input:
    file AB
    file C

    output:
    file "ABC.txt" into ABC

    """
    cat $AB $C > "ABC.txt"
    """
}
