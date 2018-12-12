
# Rosetta pipeline: A showcase and characterisation of pipeline frameworks

[A lot of pipeline frameworks
exist](https://github.com/pditommaso/awesome-pipeline), each containing
a different (and sometimes exotic) syntax. Because of this, it can be
confusing to select the appropriate framework for a particular use case.

Here we try to create:

  - **[Example workflows for each framework on some common workflow
    patterns](tasks)**, similar as done by the [Rosetta
    code](http://www.rosettacode.org/wiki/Rosetta_Code) project. They
    showcase how each workflow manager is used, and where the
    similarities and differences lie.
  - **[A working document on the similarities and differences between
    pipeline frameworks](frameworks.md)**.
  - **[A characterisation of the features of each
    framework](characterisation)**, structured in the same way as the
    working document.

## Frameworks

## Running the tasks

We install and run each framework inside a [docker
container](containers). The complete set of examples can be run by:

1.  Installing conda and docker
2.  Clone this repo
3.  Installing the conda environment: `conda env create -f
    environment.yml`
4.  Running snakemake: `snakemake`

## Contributing

We welcome contributions of any kind. See
[contributing.md](contributing.md).

A contribution implies that you agree with the [Code of
conduct](code_of_conduct.md).

## Further reading

### Opinions

  - [Sam Minot on how an ideal workflow manager looks
    like](https://www.minot.bio/home/2018/9/22/the-rise-of-the-machines-workflow-managers-for-bioinformatics)
  - [Experiences when creating an RNA-seq
    pipeline](https://github.com/NCBI-Hackathons/SPeW)

### Lists and rankings

  - [An awesome list of
    frameworks](https://github.com/pditommaso/awesome-pipeline)
  - [Popularity ranking of tools
    based](https://docs.google.com/spreadsheets/d/1plkAsT_S3CzSeb7ivxyjRnHyrK3JclUCXeUMf_azraY/edit#gid=0)

### Reviews

  - [“A review of bioinformatic pipeline frameworks” by Jeremy
    Leipzig](https://doi.org/10.1093/bib/bbw020)
    \[@leipzig\](<https://github.com/leipzig>)
