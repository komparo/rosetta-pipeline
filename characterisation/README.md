
<!-- Do not edit this by hand, this is automatically generated based on scripts/templates/characterisation.Rmd -->

# Pipeline frameworks

Briefly, a pipeline framework specifies a set of jobs
(**specification**), each with some **inputs** and **outputs**, and
executes theses jobs (**execution**). It also provides a user interface
to develop, run and explore pipelines (**usability**), and can also keep
track of which jobs were used to produce a particular output
(**provenance**).

*Pipeline frameworks* are also known as: *workflow managers*, *workflow
frameworks*

## Specification

> Specifying the jobs, what inputs and outputs they use, and in what
> order they are executed

### Rules

When jobs share some inputs and/or output, for example the same command,
they are often grouped into a set of *rules*.

Rules are also known as processes (nextflow), tools (CWL) and tasks
(WDL).

There are several ways to create individual jobs based on the
specification of a rule:

  - Wildcards. Examples:

### Language

There are different ways to specify a workflow:

  - Flat: Flat JSON or YAML files. Directly interpretable because what
    you see is what you get, but has limited flexibility.
    <!-- Examples? -->
  - Domain specific language (DSL): A language specifically created for
    defining workflows, which is interpreted by the framework. Because
    such a language is tuned towards workflows, it can be very concise,
    but at the expense of requiring users to learn a new language or
    syntax. Examples: WDL
  - Programming language: A multi-purpose language in which the workflow
    is specified, by using existing object-oriented or functional
    features. Examples: Luigi
  - Hybrid: A combination of a DSL and a multi-purpose programming
    language. While the specification is still interpreted using the
    framework, parts of it are evaluated within the programming
    language. It combines the conciseness of a DSL with the familiarity
    and flexibility of a multi-purpose language. Examples: CWL,
    Snakemake, Nextflow

While the hybrid method is the most common among existing frameworks,
the extent to which a DSL and multi-purpose language are intermixed can
vary considerably. For example, CWL only allows the use of javascript in
parts of the workflow, while the use of python is allowed almost
anywhere in the case of snakemake.

### Constructing the DAG

Dependencies between jobs can be directly specified between jobs
(examples: luigi) or between output and input data (examples: snakemake,
nextflow, cwl). In the end, this produces a directed acyclic graph
(DAG), which is executed starting from those jobs without any ingoing
edges, and ends with those jobs without any outgoing edges.

#### Pull vs push

There are two main models to create a DAG from a specification: push and
pull.

In the *push* model (also known as *data flow*), a job is ran once
inputs are available. The workflow starts from those jobs for which all
inputs are available, and uses the output of these jobs to run other
jobs which depend on these outputs. Examples: nextflow, WDL

In the *pull* model, the final outputs are specified, and the framework
will look for those jobs that can provide these outputs. If not all
inputs of these jobs are available, it will try to iteratively resolve
the inputs using the outputs of other jobs. Examples: snakemake

#### Static vs dynamic

Some frameworks construct the complete DAG before executing any jobs
(*static*), while others allow some changes in the DAG depending on the
output of jobs (*dynamic*). A DAG can be dynamic at different levels:

  - Number of inputs and outputs not known from the start: snakemake,
    nextflow. Related jobs: [Split merge](/tasks/split-merge)
  - Alternative paths based on the output of previous jobs: nextflow.
    Related jobs: [Alternative paths](/tasks/alternative-paths)

### Modularity

When dealing with large workflows or in a collaborative fashion, it can
be useful to isolate parts of the workflow as modules. This modularity
can work at different levels:

  - The module is integrated in the pipeline as-is. Examples: snakemake
    (include)
  - The module is included as a job within the pipeline, with its own
    input and output. Examples: snakemake (subworkflows), WDL
    (subworkflows).

If the pipeline is specified in a multi-purpose programming language,
modularity of the pipeline is also possible within the language itself.
Examples: airflow

<!---- Extend discussion ------->

## Inputs

> What is consumed by a job

A job and workflow can only be reproducible when all possible inputs are
defined.

### Types

There are different types of inputs

#### File

Any data file, which can be present locally, on a shared files system,
on the cloud or on some other web server.

#### Command

The code or command that is run by the job.

Most frameworks run a command by default inside the default shell of the
environment. Others, such as drake and toil, specifiy the code to be run
within the programming language of the [specification](#specification).

Some frameworks provide wrappers for some common shell commands:

  - Direct rendering of R Markdown files: snakemake
  - Running a script: snakemake

#### Parameter

Values defined directly inside the workflow specification.

Not all frameworks allow this kind of input. It can be easily mimicked
by specifying the parameters as files.

#### Environment

Where the code is run. Environments can be constrained at different
levels:

  - Nothing: Execute everything in an existing environment, without
    defining how this environment can be created. This is the default
    environment for most frameworks. Example: the local environment on
    which the pipeline is executed
  - Package manager: Specifying the libraries/packages and their
    versions that are installed on the system. Examples: conda
  - OS: Specifying the full operating system and its libraries.
    Examples: virtual machines, docker containers, singularity
    containers

Related jobs: [Run in docker](/tasks/run-in-docker)

#### Random state

The random state of the environment. For example, the seed of the
pseudorandom number generator.

This type of input is rarely handled by a framework.

### Reproducibility

The reproducibility of a pipeline hinges on how much of the inputs are
specified.

Some frameworks enforce reproducibility by prohibiting the command to
load any inputs which are not specified as such. Examples:

  - Only make specified input files available to the job: Cromwell,
    nextflow
  - Require an environment to be specified: Argo

## Outputs

> What is produced by a job

## Caching

> jobs are not needlessly rerun when output is already available

Also known as *incrementality*

Related jobs: [One task cached](/tasks/one-task-cached)

### Levels of caching

Each type of input can be cached at different levels:

  - Version (e.g. a docker tag)
  - Modification date: snakemake (for data files), make, nextflow
  - File size: nextflow
  - Content: Cromwell, snakemake (for scripts, when specified), nextflow
    (when specified)

Only the latter ensures full reproducibility and can be used for any
type of input. However, for large data it can be computationally
expensive to compare the content.

Caching can be enabled by default (for example: snakemake), or enabled
through the user interface (for example: nextflow).

While developing, it can be useful to cache outputs even if some of the
inputs have changed. For example, snakemake will by default not rerun a
job if a command has changed.

## Provenance

> Keeping track of how an output was created

Provenance can be useful for

  - [reproducibility](#reproducibility): if you know how an output was
    produced, you can try to recreate the same conditions on another
    system.
  - [caching](#caching): if you know how an output was produced, you can
    also know whether it is outdated.

Provenance can be defined for different types of input.

## Execution

### Scheduling

> Where are the jobs ran?

  - Local
  - Batch system
  - Container orchestration
  - Cloud systems

Tightly linked with data storage.

### Server vs on-demand

### Resources

> How many resources can a job consume?

  - Number of cpus
  - User time
  - Memory
  - Disk space

### Storage

File storage is tightly interlinked with scheduling, because some data
may not be easily available on some systems.

## Usability

### Development

During development, it can be useful to enter the workflow
interactively, with the complete environment and inputs available.

### Debugging

To debug a particular job, it can be useful to enter the workflow with a
shell at a particular point, with the complete environment and inputs
available.

<!----- snakemake python debug ------>

<!----- nextflow `bash .command.run` ----->

### Graphical user interface
