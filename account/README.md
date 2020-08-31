# Account Settings

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| errorcheck | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket | Bucket that tfstate is stored in | `string` | n/a | yes |
| dynamodb\_table | DynamoDB table for locking/state management | `string` | n/a | yes |
| env | Environment being deployed to | `string` | n/a | yes |
| iam\_master\_account | n/a | `string` | n/a | yes |
| iam\_role\_prefix | n/a | `string` | n/a | yes |
| key | Key that tfstate is stored in | `string` | n/a | yes |
| namespace | Project name | `string` | n/a | yes |
| owner | Owner of this infrastructure | `string` | n/a | yes |
| region | Region resources are being deployed to | `string` | n/a | yes |
| tags | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| cloudtrail\_log\_group | CloudTrail CloudWatch log group |
| s3\_bucket\_access\_logging | S3 bucket to receive S3 bucket access logs |
| s3\_bucket\_access\_logging\_domain\_name | S3 bucket to receive S3 bucket access logs |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
