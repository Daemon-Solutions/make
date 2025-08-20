# TFLint

This makefile provides a clean way to run the TFLint linter in a Docker container.
It ensures a consistent linting environment without requiring you to install TFLint locally.

## Purpose

This makefile is designed to provide a portable and consistent way to run the TFLint linter for Terraform.
By using a Docker image, it eliminates the need for developers to manage specific versions of TFLint or its dependencies on their local machines.
This ensures that linting results are consistent across all environments, from local development to CI/CD pipelines.

## Usage

### Configuration

You can customise the behavior of the Terraform operations using the following environment variables:

- `TFLINT_VERSION` **(Required)**: The version of the TFLint Docker image to use. This is a required variable.
- `TFLINT_IMAGE` **(Optional)**: The full Docker image name to use (default: `ghcr.io/terraform-linters/tflint:$(TFLINT_VERSION)`). Useful if you have a custom image name or a private registry.
- `TFLINT_DIRECTORY` **(Optional)**: The local directory containing your Terraform configuration to lint (default: `$(CURDIR)`, the current working directory).

### Core Commands

- `make tflint`: Runs TFLint against the Terraform configuration in the specified directory.
