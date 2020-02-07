# sample-aws-project
[![GH Action Status](https://github.com/rhythmictech/sample-aws-project/workflows/pre-commit-check/badge.svg)](https://github.com/rhythmictech/sample-aws-project/actions)


A sample AWS project managed by Terraform

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
