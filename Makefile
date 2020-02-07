SHELL := /bin/bash
TF_WORKSPACE := $(shell terraform workspace show)
WORKSPACE ?= $(TF_WORKSPACE)
NEW= := $(NEW)
FOLDER_NAME := $(shell pwd | xargs basename)

.PHONY: init list apply destroy new
ALL: apply

setup:
	@echo setting up AWS environment
	bin/setup.sh

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
