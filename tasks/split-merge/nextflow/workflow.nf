#!/usr/bin/env nextflow

/* Split lines into "lines" channel */
Channel
     .fromPath("elatyriaf.txt")
     .splitText(by: 1)
     .set {lines}


/* Reverse each line into the "reversed" channel */
process reverse {
    input:
    file 'line' from lines

    output:
    file 'reversed' into reversed

    """
    rev line > reversed
    """
}

/* Collect all reversed files into the "reversed_collection" channel */
reversed
    .collect()
    .set { reversed_collection }

/* Merge all reversed lines */
process fairytale {
    publishDir './', mode: 'copy'

    input:
    file 'reversed*' from reversed_collection

    output:
    file 'fairytale.txt'

    """
    cat reversed* > fairytale.txt
    """
}