# Workflow frameworks

## Inputs

> What is consumed by a task

A task and workflow can only be reproducible when all possible inputs are defined.

### Files

Any data file, which can be present locally, on a shared files system, on the cloud or on some other web server.

### Command

The code or command that is run by the task.

Most frameworks run a command by default inside the default shell of the environment. Others, such as drake and toil, specifiy the code to be run within the specification language.

Some frameworks wrap some common commands 

 framework makes it possible to run a command inside the default shell environment. Some frameworks also wrap 

* Snakemake makes it possible to render an RMarkdown file
* 

### Parameters

Values defined directly inside the workflow specification.

Only some frameworks allow this type of input. It can be easily mimicked by specifying the parameters inside data files.

### Environments

Where the code is run. Environments can be constrained at different levels:

- Nothing: execute everything in an existing environment (usually in the same environment on which the framework is installed), without specifying this environment in the workflow specification
- Package manager: the libraries or packages installed by one or more package managers are specified. Examples: conda
- OS: the full operating system, its libraries, and any language specific libraries are specified. Examples: virtual machines, docker containers, singularity containers

### Random state

The random state of the environment. For example, the seed of the pseudorandom number generator.

This type of input is ignored by nearly every framework.

## Outputs

> What is produced by a task

- files
- objects which are used as parameters of subsequent tasks

## Specification

> Specifying how the inputs produce the outputs

### Static vs dynamic

Things such as conditionality depending on some outputs, on failure

### Pull vs push

Some specifications use 



## Incrementality

> Tasks are not needlessly rerun

Also known as **caching**

Related examples: _bye-world_

### Levels of incrementality

Each type of input can be incremental at different levels:

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