# Comparing pipeline frameworks

[A lot of pipeline frameworks (aka workflow managers) exist](https://github.com/pditommaso/awesome-pipeline), each containing a variaible (and sometimes exotic) syntax.

Here we try to:

- Create example workflows for each framework, similar as done by the [Rosetta code](http://www.rosettacode.org/wiki/Rosetta_Code) project. See the [examples folder](/examples). These are useful as a cookbook to compare workflow framework, and highlight their good aspects. All examples can be run using a snakemake workflow (see the [Snakefile](Snakefile)).
- Create an unambiguous definition of features that different workflow managers can possess. See [frameworks.md](frameworks.md).
- List the features of each framework in a consistent way. See the [characterisation folder](characterisation).

Docker files to install each workflow manager are provided in the [containers](containers) folder. These are used for continuous integration of the example workflows.
