
<!-- Do not edit this by hand, this is automatically generated based on scripts/templates/README.Rmd -->

# Rosetta pipeline: A showcase and comparison of pipeline frameworks

[![Build
Status](https://travis-ci.com/komparo/rosetta-pipeline.svg?branch=master)](https://travis-ci.com/komparo/rosetta-pipeline)

[A lot of pipeline frameworks
exist](https://github.com/pditommaso/awesome-pipeline), each containing
a different (and sometimes exotic) syntax. Because of this, it can be
confusing to choose the appropriate framework for a particular use case.
This is further complicated by an inconsistent terminology between
frameworks. For example, rules (make and snakemake), processes
(nextflow), tasks (WDL), jobs (CWL) and stages (martian) all refer to
the exact same concept in different pipeline specifications.

Here we try to create:

  - **[Example workflows for each framework with some common workflow
    tasks](tasks)**. They showcase how each framework is used, and where
    the similarities and differences lie. They are also useful to learn
    a particular framework by example. This is inspired by [Rosetta
    code](http://www.rosettacode.org/wiki/Rosetta_Code).
  - **[A working document on the similarities and differences between
    pipeline frameworks](comparison)**. This document introduces a
    consistent terminology of features that a pipeline framework can
    have, while listing alternative terms along the way. The discussion
    is meant to be neutral and objective, in the sense that it simply
    lists possible features of pipeline frameworks, along with some
    advantages and disadvantages of having that particular feature.
  - **[A comparison of the features of each framework](comparison)**,
    structured in the same way as the working document.

## Structure

  - [tasks](tasks) contains the task description and examples for each
    framework.
  - [comparison](comparison) contains the [working
    document](comparison/README.md) and a comparison of frameworks.
  - [containers](containers) contains the dockerfiles for each
    framework. These are used for executing the example
workflows.

## Tasks & examples

| Task                                         | Frameworks                                                                                                                                                                                                                                                         |
| :------------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [One task](tasks/one-job)                    | [make](tasks/one-job/make), [snakemake](tasks/one-job/snakemake), [nextflow](tasks/one-job/nextflow), [luigi](tasks/one-job/luigi), [airflow](tasks/one-job/airflow), [toil](tasks/one-job/toil), [cromwell](tasks/one-job/cromwell), [drake](tasks/one-job/drake) |
| [One task cached](tasks/one-job-cached)      | [make](tasks/one-job-cached/make), [snakemake](tasks/one-job-cached/snakemake), [nextflow](tasks/one-job-cached/nextflow), [luigi](tasks/one-job-cached/luigi), [cromwell](tasks/one-job-cached/cromwell)                                                          |
| [Chain](tasks/chain)                         | [snakemake](tasks/chain/snakemake), [nextflow](tasks/chain/nextflow), [cromwell](tasks/chain/cromwell)                                                                                                                                                             |
| [Split merge](tasks/split-merge)             | [snakemake](tasks/split-merge/snakemake), [nextflow](tasks/split-merge/nextflow)                                                                                                                                                                                   |
| [Merge](tasks/merge)                         | [snakemake](tasks/merge/snakemake), [nextflow](tasks/merge/nextflow)                                                                                                                                                                                               |
| [Run in docker](tasks/run-in-docker)         | [nextflow](tasks/run-in-docker/nextflow), [cromwell](tasks/run-in-docker/cromwell)                                                                                                                                                                                 |
| [One job](tasks/module-as-is)                | [snakemake](tasks/module-as-is/snakemake)                                                                                                                                                                                                                          |
| [Alternative paths](tasks/alternative-paths) | [nextflow](tasks/alternative-paths/nextflow)                                                                                                                                                                                                                       |

## Running the examples

1.  Install conda and docker
2.  Clone this repo: `git clone
    git@github.com:komparo/rosetta-pipeline.git && cd rosetta-pipeline`
3.  Install the conda environment: `conda env create -f
    assets/env/environment.yml`
4.  Activate the environment: `conda activate rosettapipeline`
5.  Run snakemake: `snakemake`. A first build can take a while because
    all docker containers have to be built. To run only one framework,
    use `snakemake --config framework_id=nextflow`.

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
