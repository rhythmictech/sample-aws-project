variable "env" {
  default     = "default"
  description = "Environment being deployed to"
  type        = string
}

variable "region" {
  description = "Region resources are being deployed to"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to apply to resources that support tagging"
  type        = map(string)
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



