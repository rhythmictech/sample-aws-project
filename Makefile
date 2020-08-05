SHELL := /bin/bash
TF_WORKSPACE := $(shell terraform workspace show)
WORKSPACE ?= $(TF_WORKSPACE)
FOLDER_NAME := $(shell pwd | xargs basename)

.PHONY: setup init list apply destroy help
ALL: help

define _help_message
cat <<EOF
aws-terraform GNUMakefiles - convenience wrapper for terraform
usage:
	make TARGET

Targets:
	help	  this message
	clean	  get rid of .terraform directories
	init	  initialize a new terraform context (.terraform directory)*
	list	  list workspaces
	plan 	  produce a plan
	apply	  apply changes
	destroy   destroy resources

The current workspace is set to: $(WORKSPACE)

* if running init for the first time
specify the workspace you'd like to connect to like so:
WORKSPACE=staging make init

EOF
endef
export help_message = $(_help_message)

apply: init
	@echo applying changes to the $(WORKSPACE) workspace
	terraform workspace select $(WORKSPACE)
	terraform apply

clean:
	@echo WARNING - removing local terraform dirs
	rm -rf .terraform

destroy: init
	@echo applying changes to the $(WORKSPACE) workspace
	terraform workspace select $(WORKSPACE)
	terraform destroy

help:
	@eval "$$help_message"

init:
	@echo Installing correct version of terraform
	tfenv install
	@echo sourcing environmental variables
	terraform init -backend-config backend.auto.tfvars

list:
	@echo listing terraform workspaces:
	terraform workspace list

plan: init
	@echo planning changes to the $(WORKSPACE) workspace
	terraform workspace select $(WORKSPACE)
	terraform plan
