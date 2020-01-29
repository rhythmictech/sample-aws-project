# sample-aws-project

A sample AWS project managed by Terraform

## Initial Setup

There is a handy setup script at `bin/setup.sh` which will create a
[terraform s3 backend](https://www.terraform.io/docs/backends/types/s3.html)
with locking via DynamoDB and add it's resources to your remote state.

To clone this repo and get started just
[provide authentication for the aws provider](https://www.terraform.io/docs/providers/aws/index.html#authentication)
and run these commands:
```
> git clone https://github.com/rhythmictech/sample-aws-project.git terraform-aws-rhythmictech
> cd terraform-aws-rhythmictech
> ./bin/setup.sh
```
