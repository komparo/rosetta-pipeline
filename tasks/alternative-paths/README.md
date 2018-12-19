
<!-- Do not edit this by hand, this is automatically generated based on scripts/templates/task.Rmd -->

# Alternative paths

*Choose a different path depending on the output of previous jobs*

-----

Generate 10 random numbers from 1 to 10 and save to file 1.txt - 10.txt
If the number is 1, write `Happy new year!` to \*\_result.txt Otherwise,
write `Boring!` to \*\_result.txt Choosing between the two paths has to
be done by separate rules.

Generating a random numbers in
    bash:

    awk -v min=1 -v max=10 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'

![](task.svg)
