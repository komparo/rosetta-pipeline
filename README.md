# A characterisation of different pipeline frameworks

[A lot of pipeline frameworks (aka workflow managers) exist.](https://github.com/pditommaso/awesome-pipeline). How are they different?

Here we try to:

- Create some example workflows for each framework, similar as done by the [Rosetta code](http://www.rosettacode.org/wiki/Rosetta_Code) project. See the [examples folder](/examples). These are useful as a cookbook to compare workflow framework, and highlight the good aspects. The examples can be run using (ironically) snakemake [Snakefile](Snakefile)
- Create an unambiguous definition of features that different workflow managers can possess. See [frameworks.md](frameworks.md).
- List the features of each framework in a consistent way. See the [characterisation folder](characterisation).

Docker files to install each workflow manager are provided in the [install](install) folder. These are used for continuous integration of the example workflows.
