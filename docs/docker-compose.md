# Docker Compose

## Purpose

The `Makefile` serves as a wrapper for `docker compose` commands, simplifying their execution. 
It centralises common tasks like starting, stopping, and building services into easy-to-run `make` targets. 
This approach standardises the workflow for developers, ensuring consistent command usage and reducing the need to remember specific command-line flags.

## Usage

This makefile requires `make` and `docker compose` to be installed on your system.
To use it, simply call the desired `make` target from your terminal.

### Configuration

You can customise the behavior of the Docker Compose operations using the following environment variables:

- `DKR_COMPOSE_FILE` **(Optional)**: The Docker Compose YAML file to use.

### Commands

The makefile provides a set of commands for managing your Docker services.

#### Core Commands

- `make dkr_compose_up`: Creates and starts all services defined in the `docker-compose.yaml` file. It includes flags to stop if any container exits (`--abort-on-container-exit`) and to remove orphaned containers (`--remove-orphans`).
- `make dkr_compose_down`: Stops and removes all containers, networks, and named volumes associated with the project.
- `make dkr_compose_build`: Builds or rebuilds service images. It forces the removal of intermediate containers (`--force-rm`) and always pulls newer base images (`--pull`).
- `make dkr_compose_pull`: Pulls the latest images for all services defined in the compose file.
- `make dkr_compose_run`: Runs a one-off command in a specific service container. You must provide the `CONTAINER` and `COMMAND` as environment variables.

#### Other Commands

- `make dkr_compose_version`: Displays the installed `docker compose` version.

#### Not Implemented

The makefile includes placeholders for many other `docker compose` commands that are not yet implemented. 
These are intended for future development.
