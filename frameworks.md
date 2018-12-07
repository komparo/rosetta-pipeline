# Workflow frameworks

## Inputs

> That which is consumed by a task

### Files

Any data file, can also be a script.

### Script

The script that is run by the task. This can be simply a command, or a longer script sometimes provided as a separate file. 

### Parameters

Objects defined directly inside the workflow specification.

### Environments

Where the code is run. Environments can be constrained at different levels:

- Nothing: execute everything locally, without specifying which libraries are installed
- Language packages: the packages available for a particular language (e.g. python or R) are specified. Examples: conda
- OS: the full operating system, its libraries, and any language specific libraries are specified. Examples: virtual machines, docker containers, singularity containers

### Random state

The random state of the environment. For example, the seed of the pseudorandom number generator in python or R

## Outputs

> That which is produced by a task

- files

### Provenance

> How was a particular output produced?

Provenance is a prerequisite for

- **reproducibility**: if you know how an output was produced, you can try to recreate the same conditions on another system.
- **incrementality**: if you know how an output was produced, you can also know whether it is outdated.

Provenance can be defined for different types of input.

## Execution

### Scheduling

> Where are the tasks ran?

- Local
- Grid
- Container orchestration

Some systems are better suited 

### Incrementality

> When I change a part of the workflow, does it only rerun those tasks that need to be rerun?

Also known as **caching**

Related examples: _bye-world_

#### Levels of incrementality

Each type of input can be incremental at different levels:

- version (e.g. a docker tag)
- modification date
- file size
- content (such as a digest)

Only the latter provides full reproducibility and can be used for any type of input. However, for large data it can be time consuming to compare the content.