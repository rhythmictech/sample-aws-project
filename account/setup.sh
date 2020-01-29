#!/usr/bin/env bash -e

#
# this script is used for bootstraping the project base infrastructure
#


# create base infra
echo "Initializing tfstate"
cd setup
terraform init
terraform apply -auto-approve
cd ..

# migrate local state to the remote with the s3 bucket and dynamodb table
echo "Migrating tfstate to bucket"
cp setup/terraform.tfstate .
terraform init -backend-config=backend.auto.tfvars
rm terraform.tfstate
