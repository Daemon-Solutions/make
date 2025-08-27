THIS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
ROOT_DIR := $(dir $(abspath $(THIS_DIR)/../../))

TF_VERSION_DETECT = true

include $(ROOT_DIR)/src/terraform.mk
