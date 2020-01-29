#!/usr/bin/env bash -e

#
# this script is used for bootstraping a new project in your AWS account
#

new_folder=$1
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# authoritative backend file
backend_file="account/backend.auto.tfvars"

# remote state variables
tfstate_bucket=""
region="us-east-1"
dynamodb_table="tf-locktable"


function usage() {
    cat <<EOF
Usage: bin/new-project.sh FOLDER_NAME

Creates new folder with common files for another cloud component defined in terraform.

EOF
}

function check_for_errors() {
    if [ -z $new_folder ]; then
        echo "ERROR: no new folder specified"
        usage
        exit 1
    fi
    if [ -d $new_folder ]; then
        echo "ERROR: $new_folder already exits"
        usage
        exit 1
    fi
}

function get_backend_variables() {
    echo "Getting backend variables from $backend_file"
    while read line; do
        key=$(echo $line | sed -E 's/([a-zAZ_]*)([ =]*)(.*)/\1/')
        value=$(echo $line | sed -E 's/([a-zAZ_]*)([ =]*)(.*)/\3/')
        case $key in
            bucket)
                tfstate_bucket=$value
                ;;
            region)
                region=$value
                ;;
            dynamodb_table)
                dynamodb_table=$value
                ;;
            *)
                ;;
        esac

    done <$backend_file
}

function create_new_folder() {
    echo "creating new folder, $new_folder"
    mkdir $new_folder

    cd $new_folder

    echo "symlinking common files"
    ln -s ../common/* .
    echo "done creating new folder"
}

function create_backend_file() {
    new_backend="backend.auto.tfvars"
    touch $new_backend
    echo "bucket         = $tfstate_bucket" >> $new_backend
    echo "key            = \"$new_folder.tfstate\"" >> $new_backend
    echo "dynamodb_table = $dynamodb_table" >> $new_backend
    echo "region         = $region" >> $new_backend
}

function create_readme() {
    echo "# $new_folder" > README.md
cat <<EOT >> README.md

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|

## Outputs

| Name | Description |
|------|-------------|

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
EOT

}

function create_terraform_files() {
    create_readme

    echo "include ../Makefile" > Makefile

    touch main.tf
    touch variables.tf
    touch outputs.tf

    create_backend_file
}

function main() {
    check_for_errors
    get_backend_variables
    create_new_folder
    create_terraform_files

    echo 'done'
}

main "$@"
