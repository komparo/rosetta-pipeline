
<!-- Do not edit this by hand, this is automatically generated based on scripts/templates/task.Rmd -->

# Merge

*Merge an unknown number of inputs using one task*

-----

Concatenate all .txt files in the lines folder and write to
“merged.txt”. Then add ‘And they lived happily ever after.’ to the
end into “fairytale.txt”

    cat lines/*.txt > merged.txt
    echo 'And they lived happily ever after.' | cat merged.txt - > fairytale.txt

![](task.svg)
