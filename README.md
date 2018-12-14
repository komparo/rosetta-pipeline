
<!-- Do not edit this by hand, this is automatically generated based on scripts/templates/README.Rmd -->

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
    tasks](tasks)**. They showcase how each framework is used, and where
    the similarities and differences lie. This is inspired by [Rosetta
    code](http://www.rosettacode.org/wiki/Rosetta_Code).
  - **[A working document on the similarities and differences between
    pipeline frameworks](characterisation)**. This document introduces a
    consistent terminology of features that a pipeline framework can
    have, while listing alternative terms along the way. The discussion
    is meant to be neutral and objective, in the sense that it simply
    lists possible features of pipeline frameworks, along with some
    advantages and disadvantages of having that particular feature.
  - **[A characterisation of the features of each
    framework](characterisation)**, structured in the same way as the
    working document. It contains the specific characteristics of a
    framework.

## Structure

  - [tasks](tasks) contains the task description and examples for each
    framework.
  - [characterisation](characterisation) contains the [working
    document](characterisation/README.md).
  - [containers](containers) contains the dockerfiles for each
    framework. These are used for executing the example workflows.

## Tasks & examples

— | —  
[Chain](tasks/tasks/chain) | [snakemake](tasks/tasks/chain/snakemake)
[nextflow](tasks/tasks/chain/nextflow)
[cromwell](tasks/tasks/chain/cromwell)  
[Write file](tasks/tasks/write-file) |
[make](tasks/tasks/write-file/make)
[snakemake](tasks/tasks/write-file/snakemake)
[nextflow](tasks/tasks/write-file/nextflow)
[luigi](tasks/tasks/write-file/luigi)
[airflow](tasks/tasks/write-file/airflow)
[toil](tasks/tasks/write-file/toil)
[cromwell](tasks/tasks/write-file/cromwell)
[drake](tasks/tasks/write-file/drake)  
[Write file cached](tasks/tasks/write-file-cached) |
[make](tasks/tasks/write-file-cached/make)
[snakemake](tasks/tasks/write-file-cached/snakemake)
[nextflow](tasks/tasks/write-file-cached/nextflow)
[luigi](tasks/tasks/write-file-cached/luigi)
[cromwell](tasks/tasks/write-file-cached/cromwell)  
[Split merge](tasks/tasks/split-merge) |
[snakemake](tasks/tasks/split-merge/snakemake)
[nextflow](tasks/tasks/split-merge/nextflow)  
[Run in docker](tasks/tasks/run-in-docker) |
[nextflow](tasks/tasks/run-in-docker/nextflow)
[cromwell](tasks/tasks/run-in-docker/cromwell)  
[Merge](tasks/tasks/merge) | [snakemake](tasks/tasks/merge/snakemake)
[nextflow](tasks/tasks/merge/nextflow)  

## Running the examples

1.  Install conda and docker
2.  Clone this repo
3.  Install the conda environment: `conda env create -f
    assets/env/environment.yml`
4.  Run snakemake: `snakemake`. A first build can take a while because
    all docker containers have to be built.

## Contributing

We welcome contributions of any kind. See
[assets/contributing.md](assets/contributing.md).

A contribution implies that you agree with the [Code of
conduct](assets/code_of_conduct.md).

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
