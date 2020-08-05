module "tags" {
  source = "git::https://github.com/rhythmictech/terraform-terraform-tags.git?ref=v1.1.0"

  names = [
    "account",
    var.env,
    var.namespace
  ]

  tags = {
    "Env"       = var.env,
    "Namespace" = var.namespace,
    "Owner"     = var.owner
  }
}

module "rhythmic_iam_roles" {
  source         = "git::https://github.com/rhythmictech/terraform-aws-rhythmic-iam-roles.git?ref=v1.1.0"
  role_prefix    = var.iam_role_prefix
  master_account = var.iam_master_account
}

module "s3logging_bucket" {
  source        = "git::https://github.com/rhythmictech/terraform-aws-s3logging-bucket?ref=v1.0.1"
  bucket_suffix = "account"
  region        = var.region
  tags          = module.tags.tags_no_name
}

module "cloudtrail_bucket" {
  source         = "git::https://github.com/rhythmictech/terraform-aws-cloudtrail-bucket?ref=v1.2.0"
  logging_bucket = module.s3logging_bucket.s3logging_bucket_name
  region         = var.region
  tags           = module.tags.tags_no_name
}

module "cloudtrail_logging" {
  source            = "git::https://github.com/rhythmictech/terraform-aws-cloudtrail-logging?ref=v1.1.0"
  region            = var.region
  cloudtrail_bucket = module.cloudtrail_bucket.s3_bucket_name
  kms_key_id        = module.cloudtrail_bucket.kms_key_id
}

module "iam_password_policy" {
  source = "git::https://github.com/rhythmictech/terraform-aws-iam-password-policy?ref=v1.0.0"
}
