provider "aws" {
  region = var.region
}

module "backend" {
  source = "git::ssh://git@github.com/rhythmictech/terraform-aws-backend?ref=v1.2.0"
  bucket = var.tfstate_bucket
  table  = var.tfstate_dynamodb_table
  region = var.region
  tags   = var.tags
}

