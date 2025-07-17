# Terraform

This Makefile provides a streamlined and consistent way to execute Terraform commands within a Docker container. 
It's designed to abstract the underlying Docker complexities, ensuring a standardised environment for your infrastructure-as-code operations.

## Purpose

This Makefile is specifically for managing Terraform projects. 
It leverages Docker to provide a consistent environment, eliminating the need to install Terraform directly on your local machine and managing versioning through Docker images.

## Usage

This Makefile is designed to be integrated into your main repository `Makefile` as described in the [parent Make](../README.md) documentation. 
Once included, you can use the following commands to interact with your Terraform projects.

### Configuration

You can customise the behavior of the Terraform operations using the following environment variables:
* `TF_VERSION` **(Required)**: Specifies the Terraform version to use for the Docker image (e.g., `1.8.0`). This variable **must be set** before running any `tf_*` commands.
* `TF_IMAGE` **(Optional)**: The full Docker image name to use (default: `hashicorp/terraform:$(TF_VERSION)`). Useful if you have a custom image name or a private registry.
* `TF_DIRECTORY` **(Optional)**: The local directory containing your Terraform configuration (default: `$(CURDIR)`, the current working directory).
* `TF_DOCKERFILE` **(Optional)**: Path to a custom Dockerfile to build your Terraform image. If set, the `tf_build` target will be available and used as a dependency for core commands.
* `AWS_PROFILE` **(Optional)**: Your AWS profile to use (default: `default`). Set this if you're using a specific profile from your `~/.aws/credentials` file. This variable is automatically passed into the Docker container.
* `ARGS` **(Optional)**: Generic arguments to pass directly to the Terraform command. This is useful for passing additional flags not explicitly covered by the Makefile's specific variables.
* `TF_ADDITIONAL` **(Optional)**: Additional arguments to pass directly to the `docker run` command (e.g., to add more volume mounts or network settings).

### Available Commands (Makefile Targets)

All Terraform commands are prefixed with `tf_`. Many targets also support a wildcard format (e.g., `tf_init_%`, `tf_plan_%`) which implicitly sets `AWS_PROFILE` to `default`, though you can always override it by explicitly setting `AWS_PROFILE` on the command line.

### Core Commands

* `make tf_init [ARGS='...']`: Initialises the Terraform working directory. This prepares your directory for other commands by downloading necessary providers and modules.
* `make tf_validate`: Validates the Terraform configuration files in the working directory.
* `make tf_plan [ARGS='...'] [REFRESH=true] [TARGET='<resource_address>'] [REPLACE='<resource_address>']`: Generates and shows an execution plan. This command determines what actions Terraform needs to take to achieve the desired state.
	* `REFRESH=true`: Performs a plan in refresh-only mode, updating the state against real infrastructure without proposing changes.
	* `TARGET='<resource_address>'`: Limits the plan to a specific resource instance.
	* `REPLACE='<resource_address>'`: Marks a resource for replacement during the plan.
* `make tf_apply [ARGS='...'] [REFRESH=true] [TARGET='<resource_address>'] [REPLACE='<resource_address>']`: Applies the changes required to reach the desired state of the configuration.
	* `REFRESH=true`: Performs an apply in refresh-only mode.
	* `TARGET='<resource_address>'`: Limits the apply to a specific resource instance.
	* `REPLACE='<resource_address>'`: Replaces a specific resource during the apply.
* `make tf_destroy [ARGS='...']`: Destroys the Terraform-managed infrastructure. **Use with caution!**

### Utility Commands

* `make tf_build`: Builds a custom Terraform Docker image. This target is only effective if TF_DOCKERFILE is set in your environment or Makefile.
* `make tf_console`: Provides an interactive console for evaluating Terraform expressions.
* `make tf_fmt`: Automatically reformats Terraform configuration files to a canonical style.
* `make tf_output`: Extracts and displays output values from your root module.
* `make tf_show`: Inspects a plan file or state file, showing the resources defined in the configuration or state.
* `make tf_version`: Displays the Terraform version being used by the Docker container.

### Advanced Commands

For more advanced operations, such as state manipulation or specific provider actions, you can use the following targets. Note that some require additional variables to be set.
* `make tf_force_unlock LOCK_ID='<lock_id>'`: Forces the release of a stuck lock on the current workspace.
* `make tf_get`: Installs or upgrades remote Terraform modules.
* `make tf_import ADDRESS='<resource_address>' ID='<resource_id>'`: Imports existing infrastructure into Terraform state.
* `make tf_login HOSTNAME='<hostname>'`: Obtains and saves credentials for a remote host.
* `make tf_logout HOSTNAME='<hostname>'`: Removes locally-stored credentials for a remote host.
* `make tf_metadata_functions`: Displays metadata about Terraform functions (JSON output).
* `make tf_modules`: Shows all declared modules in the working directory.
* `make tf_providers`: Shows the providers required for this configuration.
* `make tf_providers_lock`: Manages provider lock files.
* `make tf_providers_mirror DIR='<directory>'`: Mirrors provider plugins to a local directory.
* `make tf_providers_schema`: Displays the schema for providers in the configuration.

### State Management Commands

* `make tf_state_list`: Lists resources within the Terraform state.
* `make tf_state_mv SOURCE='<source_address>' DESTINATION='<destination_address>'`: Moves items within the Terraform state.
* `make tf_state_pull`: Pulls the latest state from the remote backend to the local file system.
* `make tf_state_replace_provider FROM_PROVIDER='<from_provider_address>' TO_PROVIDER='<to_provider_address>'`: Replaces a provider in the state file.
* `make tf_state_rm ADDRESS='<resource_address>'`: Removes resources from the Terraform state.
* `make tf_state_show ADDRESS='<resource_address>'`: Shows the attributes of a resource in the state.

### Taint Commands

* `make tf_taint ADDRESS='<resource_address>'`: Explicitly marks a resource instance as tainted, forcing it to be re-created on the next apply.
* `make tf_untaint ADDRESS='<resource_address>'`: Removes the 'tainted' state from a resource instance.

### Workspace Management Commands

* `make tf_workspace_list`: Lists existing workspaces.
* `make tf_workspace_select WORKSPACE='<workspace_name>'`: Selects an existing workspace.
* `make tf_workspace_new WORKSPACE='<workspace_name>'`: Creates and switches to a new workspace.
* `make tf_workspace_delete WORKSPACE='<workspace_name>'`: Deletes a workspace.
* `make tf_workspace_show`: Displays the name of the current workspace.

### Commands Not Implemented / Deprecated

* `make tf_graph`: Currently not implemented in this Makefile.
* `make tf_refresh`: This command is deprecated. Use make tf_apply REFRESH=true instead for refresh-only operations.
* `make tf_state_push`: Currently not implemented in this Makefile.
