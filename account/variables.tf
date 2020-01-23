variable "iam_master_account" {
  type = string
}

variable "iam_role_prefix" {
  type = string
}

variable "namespace" {
  description = "Project name"
  type        = string
}

variable "owner" {
  description = "Owner of this infrastructure"
  type        = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
