SHELL := /bin/bash
TF_WORKSPACE := $(shell terraform workspace show)
WORKSPACE ?= $(TF_WORKSPACE)
NEW= := $(NEW)
FOLDER_NAME := $(shell pwd | xargs basename)

.PHONY: setup init list apply destroy new help
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
	new		  new workspace

The current workspace is set to: $(WORKSPACE)

* if running init for the first time
specify the workspace you'd like to connect to like so:
WORKSPACE=staging make init

EOF
endef
export help_message = $(_help_message)

help:
	@eval "$$help_message"

clean:
	@echo WARNING - removing local terraform dirs
	rm -rf .terraform

init:
	@echo sourcing environmental variables
	terraform init -backend-config backend.auto.tfvars -backend-config "key=$(FOLDER_NAME).tfstate"

list:
	@echo listing terraform workspaces:
	terraform workspace list

plan: init
	@echo planning changes to the $(WORKSPACE) workspace
	terraform workspace select $(WORKSPACE)
	terraform plan -var-file $(WORKSPACE).tfvars

apply: init
	@echo applying changes to the $(WORKSPACE) workspace
	terraform workspace select $(WORKSPACE)
	terraform apply -var-file $(WORKSPACE).tfvars

destroy: init
	@echo applying changes to the $(WORKSPACE) workspace
	terraform workspace select $(WORKSPACE)
	terraform destroy -var-file $(WORKSPACE).tfvars

new: init
	@echo "create a new terraform workspace by running 'make NEW=my-new-name new'"
	$(shell [ -z $(NEW) ] && echo 'please define the NEW env var'; exit 1;)
	terraform workspace new $(NEW)
	echo "env = \"$(NEW)\"" >> $(NEW).tfvars
