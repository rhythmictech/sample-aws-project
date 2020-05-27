provider "aws" {
  region = var.region
}

module "backend" {
  source = "git::ssh://git@github.com/rhythmictech/terraform-aws-backend?ref=v2.0.0"
  bucket = var.bucket
  table  = var.dynamodb_table
  region = var.region
  tags   = var.tags
}
