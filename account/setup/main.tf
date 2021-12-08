
#tfsec:ignore:aws-dynamodb-table-customer-key tfsec:ignore:aws-dynamodb-enable-recovery
module "backend" {
  source  = "rhythmictech/backend/aws"
  version = "2.1.0"

  bucket = var.bucket
  table  = var.dynamodb_table
  region = var.region
  tags   = var.tags
}
