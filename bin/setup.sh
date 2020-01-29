#!/usr/bin/env bash -e

#
# this script is used for bootstraping the project base infrastructure
#


# get custom provider
echo "Downloading error checking provider"
cd common
curl -sSL https://raw.githubusercontent.com/rhythmictech/terraform-provider-errorcheck/master/update-provider.sh | bash
cd ..

echo "Symlinking custom provider to account project"
cd account
ln -s ../common/terraform.d .
cd ..

# create base infra
echo "Initializing tfstate"
cd account/setup
terraform init
terraform apply -auto-approve
cd ../..

# migrate local state to the remote with the s3 bucket and dynamodb table
echo "Migrating tfstate to bucket"
cd account
cp setup/terraform.tfstate .
terraform init -backend-config=backend.auto.tfvars
rm terraform.tfstate
cd ..
