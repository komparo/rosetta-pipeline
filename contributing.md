# Contributing

## Add a framework

To add a framework you need to:

1. Create a Dockerfile in the containers folder
2. Create (in the very least) a write-file example in the [tasks/write-file](tasks/write-file) folder. See ["Add a new example"](#add-a-new-example) on how to add an example.
3. Add a characterisation in [characterisation/frameworks](characterisation/frameworks), and when applicable, in [characterisation/specifications](characterisation/specifications).
4. Add the framework to [.travis.yml](.travis.yml).

## Add a new example

Each example should contain a run.sh file which contains the command(s) that will be executed inside the container of the framework.

Add the example in [Snakefile](Snakefile).