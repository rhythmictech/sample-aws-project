# Account Settings

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

No provider.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
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

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
