
<!-- Do not edit this by hand, this is automatically generated based on scripts/templates/task.Rmd -->

# Merge

1.  Split “elatyriaf.txt” into separate files .txt files.

2.  Reverse characters in each file and save

3.  Concatenate the reverse files into “fairytale.txt”

<!-- end list -->

    mkdir split
    split elatyriaf.txt -l 1 split/
    for f in split/*
    do
      rev $f > ${f}2
    done
    cat split/*2 > fairytale.txt

![](task.svg)
