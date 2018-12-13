
# Rosetta pipeline: A showcase and characterisation of pipeline frameworks

[![Build
Status](https://travis-ci.com/komparo/rosetta-pipeline.svg?branch=master)](https://travis-ci.com/komparo/rosetta-pipeline)

[A lot of pipeline frameworks
exist](https://github.com/pditommaso/awesome-pipeline), each containing
a different (and sometimes exotic) syntax. Because of this, it can be
confusing to choose the appropriate framework for a particular use case,
which is further complicated by inconsistent terminology usage across
frameworks.

Here we try to create:

  - **[Example workflows for each framework with some common workflow
    tasks](tasks)**. They showcase how each workflow manager is used,
    and where the similarities and differences lie. This is inspired by
    [Rosetta code](http://www.rosettacode.org/wiki/Rosetta_Code).
  - **[A working document on the similarities and differences between
    pipeline frameworks](frameworks.md)**. Terminologies are very
    diverse accross different frameworks, and this document tries to
    introduce a consistent terminology while also listing the possible
    alternatives along the way. This document is meant to be neutral and
    objective, in the sense that it simply lists possible features of
    pipeline frameworks, along with some advantages and disadvantages of
    having that particular feature.
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
  - [Reddit discussion on Toil vs Snakemake vs
    Nextflow](https://www.reddit.com/r/bioinformatics/comments/a4fq4i/given_the_experience_of_others_writing/)

### Lists and rankings

  - [An awesome list of
    frameworks](https://github.com/pditommaso/awesome-pipeline)
  - [Popularity ranking of
    tools](https://docs.google.com/spreadsheets/d/1plkAsT_S3CzSeb7ivxyjRnHyrK3JclUCXeUMf_azraY/edit#gid=0)

### Reviews

  - [“A review of bioinformatic pipeline frameworks” by Jeremy
    Leipzig](https://doi.org/10.1093/bib/bbw020)
    (<https://github.com/leipzig>)
