# Pipeline frameworks

Briefly, a pipeline framework specifies a set of tasks (**specification**), each with some **inputs** and **outputs**. It can also keep track of how tasks are run (**execution**), track which tasks were used to produce a particular output (**provenance**), and where input and output data is stored (**storage**).

## Specification

> Specifying the tasks, how they need to be executed, and in what order

### Language

There are different ways to specify a workflow:

- Flat: Flat JSON or YAML files. Directly interpretable because what you see is what you get, but has limited flexibility. <!--- Examples? --->
- Domain specific language (DSL): A language specifically created for defining workflows. The specification is completely interpreted by the framework. Because such a language is tuned towards workflows, it can be very concise, but at the expense of requiring users to learn a new language or syntax to define workflows. Examples: WDL
- Programming language: A multi-purpose language in which the workflow is specified, by using existing object-oriented or functional features.  Examples: Luigi
- Hybrid: A combination of a DSL and a multi-purpose programming language. While the specification is still interpreted using the framework, parts of it are evaluated within the programming language. It combines the conciseness of a DSL with the familiarity and flexibility of a multi-purpose language. Examples: CWL, Snakemake, Nextflow

While the hybrid method is the most common among existing frameworks, the extent to which a DSL and multi-purpose language are intermixed can vary considerably. For example, CWL only allows the use of javascript in parts of the workflow, while the use of python is allowed almost anywhere in the case of snakemake.

### Constructing the DAG

Dependencies between tasks can be directly specified between tasks themselves (examples: luigi) or between output and input data (examples: snakemake, nextflow, cwl).

Connecting tasks through their data is a requirement for proper [caching](#caching), but also . In the 'push' idea (also known as data flow), a task is ran for every input 

## Inputs

> What is consumed by a task

A task and workflow can only be reproducible when all possible inputs are defined.

### Types

There are different types of inputs

#### Files

Any data file, which can be present locally, on a shared files system, on the cloud or on some other web server.

#### Command

The code or command that is run by the task.

Most frameworks run a command by default inside the default shell of the environment. Others, such as drake and toil, specifiy the code to be run within the specification language.

Some frameworks provide wrappers for some common shell commands:

* Direct rendering of R Markdown files: snakemake
* Running a script: snakemake (R and python)

#### Parameters

Values defined directly inside the workflow specification.

Not all frameworks allow this kind of input. It can be easily mimicked by specifying the parameters inside data files.

#### Environments

Where the code is run. Environments can be constrained at different levels:

- Nothing: Execute everything in an existing environment, without defining how this environment can be created. Example: the local environment on which the pipeline is executed
- Package manager: Specifying the libraries/packages and their versions which are installed on the system. Examples: conda
- OS: Specifying the full operating system and its libraries. Examples: virtual machines, docker containers, singularity containers

#### Random state

The random state of the environment. For example, the seed of the pseudorandom number generator.

This type of input is ignored by nearly every framework.

### Reproducibility

The reproducibility of a pipeline is determined by how much of the inputs are specified

## Outputs

> What is produced by a task

- files
- objects which are used as parameters of subsequent tasks

### Static vs dynamic

Things such as conditionality depending on some outputs, on failure

### Pull vs push

Some specifications use 



## Caching

> Tasks are not needlessly rerun

Also known as **caching**

Related examples: _bye-world_

### Levels of caching

Each type of input can be cached at different levels:

- version (e.g. a docker tag)
- modification date
- file size
- content (such as a digest)

Only the latter provides full reproducibility and can be used for any type of input. However, for large data it can be time consuming to compare the content.

## Provenance

> Keeping track of how an output was created

Provenance is a prerequisite for

- **reproducibility**: if you know how an output was produced, you can try to recreate the same conditions on another system.
- **incrementality**: if you know how an output was produced, you can also know whether it is outdated.

Provenance can be defined for different types of input.

## Execution

### Scheduling

> Where are the tasks ran?

- Local
- Batch system
- Container orchestration
- Cloud systems

Tightly linked with data storage.

### Resources

> 

### Usability

## Storage