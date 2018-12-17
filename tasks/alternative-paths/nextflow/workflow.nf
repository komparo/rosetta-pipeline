#!/usr/bin/env nextflow

process generate_numbers {
  publishDir "./"

  input:
  val x from 1..10
  output:
  file '*.txt' into result

  """
  awk -v min=1 -v max=10 'BEGIN{srand(${x}); print int(min+rand()*(max-min+1))}' > ${x}.txt
  """
}

result = result.map { file -> tuple(file.baseName, file) }


/* Split channel based on the content of the output files */
queue1 = Channel.create()
queue2 = Channel.create()

result.choice( queue1, queue2 ) { result -> result[1].text =~ /^1$/ ? 0 : 1 }

/* Two different tasks */
process happy_newyear {
    publishDir "./"

    input:
    set id, file("output.txt") from queue1

    output:
    set id, file("${id}_result.txt")

    """
    echo 'happy new year!' > ${id}_result.txt
    """
}


process boring {
    publishDir "./"

    input:
    set id, file("output.txt") from queue2

    output:
    set id, file("${id}_result.txt")

    """
    echo 'boring' > ${id}_result.txt
    """
}