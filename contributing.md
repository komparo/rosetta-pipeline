# Contributing

## Add a framework

To add a framework you need to:

1. Create a Dockerfile in the containers folder. Make sure to install docker or singularity in this dockerfile as well if any examples make use of it.
2. Create (in the very least) a write-file example in the [tasks/write-file](tasks/write-file) folder. See ["Add a new example"](#add-a-new-example) on how to add an example.
3. Add a characterisation in [characterisation/frameworks](characterisation/frameworks), and when applicable, in [characterisation/specifications](characterisation/specifications). See ["Characterizing a framework"](#characterizing-a-framework).
4. Add the framework to [.travis.yml](.travis.yml). This framework and all of its dependencies will then be tested as a separate job on travis.

## Add a new example

Each example should contain a "run.sh" file which contains the command(s) that will be executed inside the container of the framework. You are free to include any other files in this directory.

Add the example in [Snakefile](Snakefile) within the appropriate framework.

## Characterizing a framework

When citing articles, use the style followed by manubot, i.e. `[@doi:10.1101/276907]`.