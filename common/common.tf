# =============================================
# Provider/Backend/Workspace Check
# =============================================
provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = var.tfstate_bucket
    key    = var.tfstate_key
    region = var.region
  }

  required_version = ">= 0.12.0"

}

# Intentionally throws an error if the workspace doesn't match the env
# from https://github.com/rhythmictech/terraform-provider-errorcheck
resource "errorcheck_is_valid" "workspace_should_match_env" {
  name = "terraform workspace should match env variable"
  test = {
    assert        = terraform.workspace == var.env
    error_message = "Change workspace to match env. Workspace: ${terraform.workspace}, env: ${var.env}"
  }
}

# =============================================
# Variables
# =============================================
variable "env" {
  description = "Environment being deployed to"
  type        = string
}

variable "region" {
  description = "Region resources are being deployed to"
  type        = string
}

variable "tfstate_bucket" {
  description = "Bucket that tfstate is stored in"
  type        = string
}

variable "tfstate_dynamodb_table" {
  description = "DynamoDB table for locking/state management"
  type        = string
}

variable "tfstate_key" {
  description = "Key that tfstate is stored in"
  type        = string
}