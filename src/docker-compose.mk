# docker compose

DKR_COMPOSE_FILE ?= -f docker-compose.yaml

ifeq ($(wildcard $(DKR_COMPOSE_FILE)),)
$(error "DKR_COMPOSE_FILE is not defined or vould not be detected")
endif

dkr_compose_%: DKR_COMPOSE_CMD = docker compose $(DKR_COMPOSE_FILE)

# main commands

# attach - attach local standard input, output, and error streams to a service's running container
dkr_compose_attach:
	@echo "$@ is not implemented yet"

# build - build or rebuild services
dkr_compose_build:
	$(DKR_COMPOSE_CMD) build --force-rm --pull

# commit - create a new image from a service container's changes
dkr_compose_commit:
	@echo "$@ is not implemented yet"

# config - parse, resolve and render compose file in canonical format
dkr_compose_config:
	@echo "$@ is not implemented yet"

# cp - copy files/folders between a service container and the local filesystem
dkr_compose_cp:
	@echo "$@ is not implemented yet"

# create - creates containers for a service
dkr_compose_create:
	@echo "$@ is not implemented yet"

# down - stop and remove containers, networks
dkr_compose_down:
	$(DKR_COMPOSE_CMD) down --remove-orphans --volumes

# events - receive real time events from containers
dkr_compose_events:
	@echo "$@ is not implemented yet"

# exec - execute a command in a running container
dkr_compose_exec:
	@echo "$@ is not implemented yet"

# export - export a service container's filesystem as a tar archive
dkr_compose_export:
	@echo "$@ is not implemented yet"

# images - list images used by the created containers
dkr_compose_images:
	@echo "$@ is not implemented yet"

# kill - force stop service containers
dkr_compose_kill:
	@echo "$@ is not implemented yet"

# logs - view output from containers
dkr_compose_logs:
	@echo "$@ is not implemented yet"

# ls - list running compose projects
dkr_compose_ls:
	@echo "$@ is not implemented yet"

# pause - pause services
dkr_compose_pause:
	@echo "$@ is not implemented yet"

# port - print the public port for a port binding
dkr_compose_port:
	@echo "$@ is not implemented yet"

# ps - list containers
dkr_compose_ps:
	@echo "$@ is not implemented yet"

# publish - publish compose application
dkr_compose_publish:
	@echo "$@ is not implemented yet"

# pull - pull service images
dkr_compose_pull:
	$(DKR_COMPOSE_CMD) pull

# push - push service images
dkr_compose_push:
	@echo "$@ is not implemented yet"

# restart - restart service containers
dkr_compose_restart:
	@echo "$@ is not implemented yet"

# rm - removes stopped service containers
dkr_compose_rm:
	@echo "$@ is not implemented yet"

# run - run a one-off command on a service
dkr_compose_run:
	$(DKR_COMPOSE_CMD) run --rm $(CONTAINER) $(COMMAND)

# scale - scale services 
dkr_compose_scale:
	@echo "$@ is not implemented yet"

# start - start services
dkr_compose_start:
	@echo "$@ is not implemented yet"

# stats - display a live stream of container(s) resource usage statistics
dkr_compose_stats:
	@echo "$@ is not implemented yet"

# stop - top services
dkr_compose_stop:
	@echo "$@ is not implemented yet"

# top - display the running processes
dkr_compose_top:
	@echo "$@ is not implemented yet"

# unpause - unpause services
dkr_compose_unpause:
	@echo "$@ is not implemented yet"

# up - create and start containers
dkr_compose_up:
	$(DKR_COMPOSE_CMD) up --abort-on-container-exit --remove-orphans

# version - show the docker compose version information
dkr_compose_version:
	$(DKR_COMPOSE_CMD) version

# volumes - list volumes
dkr_compose_volumes:
	@echo "$@ is not implemented yet"

# wait - block until containers of all (or specified) services stop.
dkr_compose_wait:
	@echo "$@ is not implemented yet"

# watch - watch build context for service and rebuild/refresh containers when files are updated
dkr_compose_watch:
	@echo "$@ is not implemented yet"
