# tflint

TFLINT_DIRECTORY ?= $(CURDIR)

ifeq ($(TFLINT_VERSION),)
$(error "TFLINT_VERSION is not defined")
endif

TFLINT_IMAGE ?= ghcr.io/terraform-linters/tflint:$(TFLINT_VERSION)

TFLINT_DOCKER_CMD = docker run --rm -it \
	--entrypoint /bin/sh \
	-v $(TFLINT_DIRECTORY):/data \
	$(TFLINT_IMAGE) \
	-c "tflint --init && tflint"

.PHONY: tflint

tflint:
	$(TFLINT_DOCKER_CMD)
