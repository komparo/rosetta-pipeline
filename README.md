
# Comparing pipeline frameworks

[A lot of pipeline frameworks (aka workflow managers)
exist](https://github.com/pditommaso/awesome-pipeline), each containing
a different (and sometimes exotic) syntax.

This repo includes:

  - [Example workflows for each framework](/examples), similar as done
    by the [Rosetta code](http://www.rosettacode.org/wiki/Rosetta_Code)
    project.
  - [A working document on the similarities and differences between
    pipeline frameworks.](frameworks.md).
  - [A characterisation of the features of each
    framework.](characterisation). It is structured in the same way as
    the working document.

We install and run each framework inside a [docker
container](containers). The complete set of examples can be run by
installing snakemake and by running `snakemake`. Make sure docker is
installed.

## Frameworks

## Contributing

We welcome contributions of any kind. Some possibilities:

  - Add a new example which highlights the advantage of a particular
    framework. Each example should contain a “run.sh” file which
    contains the command that will be run inside the container of the
    framework.
  - Update or expand the working document.

A contribution implies that you agree with the [Code of
conduct](CODE_OF_CONDUCT.md).

## Further reading

  - [Sam Minot on how an ideal workflow manager looks
    like](https://www.minot.bio/home/2018/9/22/the-rise-of-the-machines-workflow-managers-for-bioinformatics)
