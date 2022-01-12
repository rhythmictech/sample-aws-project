
########################################
# Misc
########################################

data "terraform_remote_state" "account" {
  backend   = "s3"
  workspace = terraform.workspace
  config = {
    bucket = var.bucket
    key    = "account.tfstate"
    region = var.region
  }
}

module "tags" {
  source  = "rhythmictech/tags/terraform"
  version = "~> 1.1.0"

  names = [
    "network",
    var.env,
    var.namespace
  ]

  tags = {
    "Env"       = var.env,
    "Namespace" = var.namespace,
    "Owner"     = var.owner
  }
}

########################################
# Networking
########################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.11.0"

  name               = module.tags.name
  azs                = var.availability_zones
  cidr               = var.cidr_block
  enable_nat_gateway = true
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  tags               = module.tags.tags

  # cost savings > performance
  single_nat_gateway = true
}

#tfsec:ignore:aws-iam-no-policy-wildcards
module "vpcflowlogs" {
  source  = "rhythmictech/vpcflowlogs/aws"
  version = "~> 1.1.2"

  create_bucket  = true
  create_kms_key = true
  logging_bucket = data.terraform_remote_state.account.outputs.s3_bucket_access_logging_bucket
  region         = var.region
  tags           = module.tags.tags
  vpc_ids        = [module.vpc.vpc_id]
}
