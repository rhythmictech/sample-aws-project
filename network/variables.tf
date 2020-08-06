
########################################
# Networking
########################################

variable "availability_zones" {
  description = "Availability zones to create VPC in"
  type        = list(string)
}

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "external_zones" {
  description = "List of External Zones to register in R53"
  type        = set(string)
}

variable "private_subnets" {
  default = []
  type    = list(string)
}

variable "public_subnets" {
  default = []
  type    = list(string)
}

########################################
# General
########################################

variable "namespace" {
  description = "Project name"
  type        = string
}

variable "owner" {
  description = "Owner of this infrastructure"
  type        = string
}
