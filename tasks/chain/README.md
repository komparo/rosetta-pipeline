
<!-- Do not edit this by hand, this is automatically generated based on scripts/templates/task.Rmd -->

# Chain

*Run a number of tasks, in which the input of one task depends on the
output of another*

-----

Concatenate “A.txt” with “B.txt” and write this to “AB.txt”. Then
concatenate “AB.txt” with “C.txt” and write to “ABC.txt”

    cat A.txt B.txt > AB.txt
    cat AB.txt C.txt > ABC.txt

![](task.svg)
