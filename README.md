# sample-aws-project
[![tflint](https://github.com/rhythmictech/sample-aws-project/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/sample-aws-project/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![tfsec](https://github.com/rhythmictech/sample-aws-project/workflows/tfsec/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/sample-aws-project/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/rhythmictech/sample-aws-project/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/sample-aws-project/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/rhythmictech/sample-aws-project/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/sample-aws-project/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/rhythmictech/sample-aws-project/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/sample-aws-project/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)


A sample AWS project managed by Terraform

## About
This repo is set up to contain _everything_ in a single AWS account.


### Structure
The top level structure of the repo should look something like the tree below
with each "`project`" containing some application of shared infrastructure.
Besides the project directories there are a few special ones;
- `common`, which houses code that should be common to every project
- `modules`, where client-specific modules kept
- `bin`, where scripts are kept

```
repo
│
└───common
│   │   common.tf
│   │   global.auto.tfvars
│
└───modules
│
└───project
│   │   main.tf
|   |   outputs.tf
│   │   variables.tf
|
|   .gitignore
|   .pre-commit.yml
|   .terraform-version
|   README.md
```


## Initial Setup

There is a handy setup script at `bin/setup.sh` which will create a
[terraform s3 backend](https://www.terraform.io/docs/backends/types/s3.html)
with locking via DynamoDB and add it's resources to your remote state.

To all the DevOps engineers out there with bosses to impress it's easy to do just follow these steps:
1. Install the prerequisites
    - `git`
    - `terraform` (We use [tfenv](https://github.com/tfutils/tfenv) to manage `terraform` versions)
    - `pre-commit`
    - `GNUMake`
1. [provide authentication for the aws provider](https://www.terraform.io/docs/providers/aws/index.html#authentication)
1. Clone the repo: `git clone https://github.com/rhythmictech/sample-aws-project.git terraform-aws-rhythmictech`
1. Update the values for the backend in `account/backend.auto.tfvars`
1. Run the setup with `make setup`


## Creating a new project

To bootsrap the addition of new projects there is a handy shell script,
`bin/new-project.sh` that does everything needed besides write the code;
- gets the backend variables from the backend `account/backend.auto.tfvars` file
- creates the new folder with a backend, readme, and makefile
- symlinks everything in `common` to the new folder


## Applying Changes

Once you've made your changes to the terraform code
and want to make those changes in your actual infrastructure you can use `make apply` to generate
a plan. It will then prompt you to type `yes` to apply the proposed changes or type literally anything other than `yes` to exit without applying.
