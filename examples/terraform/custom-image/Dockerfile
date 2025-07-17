#checkov:skip=CKV_DOCKER_3: Ensure that a user for the container has been created
#checkov:skip=CKV_DOCKER_2: Ensure that HEALTHCHECK instructions have been added to container images

ARG TF_VERSION=latest

FROM hashicorp/terraform:${TF_VERSION}

RUN apk add --no-cache python3=3.12.11-r0 py3-pip=25.1.1-r0
