# =============================================
# Provider/Backend/Workspace Check
# =============================================
provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {}

  required_version = ">= 0.12.0"
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

variable "bucket" {
  description = "Bucket that tfstate is stored in"
  type        = string
}

variable "dynamodb_table" {
  description = "DynamoDB table for locking/state management"
  type        = string
}

variable "key" {
  description = "Key that tfstate is stored in"
  type        = string
}
