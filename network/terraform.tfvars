
########################################
# General
########################################

env  = "default"
name = "network"

########################################
# Networking
########################################

cidr_block = "10.89.0.0/16"

external_zones = [
  "sblack.rocks"
]

availability_zones = [
  "us-east-1a",
  "us-east-1b",
  "us-east-1c"
]

private_subnets = [
  "10.89.4.0/22",
  "10.89.8.0/22",
  "10.89.12.0/22",
]

public_subnets = [
  "10.89.0.0/24",
  "10.89.1.0/24",
  "10.89.2.0/24",
]
