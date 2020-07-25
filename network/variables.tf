
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

variable "private_subnets" {
  default = []
  type    = list(string)
}

variable "public_subnets" {
  default = []
  type    = list(string)
}
