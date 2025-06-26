THIS_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
ROOT_DIR := $(dir $(abspath $(THIS_DIR)/../../))

TF_VERSION = latest

include $(ROOT_DIR)/src/terraform.mk

tf_%_dev: TF_ENVIRONMENT = dev
tf_%_prod: TF_ENVIRONMENT = prod

tf_init_%: ARGS = -backend-config=./backend/$(TF_ENVIRONMENT).tfbackend
tf_plan_% tf_apply_% tf_destroy_%: ARGS = -var-file=./params/$(TF_ENVIRONMENT).tfvars
