# network

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| errorcheck | n/a |
| terraform | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | Availability zones to create VPC in | `list(string)` | n/a | yes |
| bucket | Bucket that tfstate is stored in | `string` | n/a | yes |
| cidr\_block | CIDR block for VPC | `string` | n/a | yes |
| dynamodb\_table | DynamoDB table for locking/state management | `string` | n/a | yes |
| env | Environment being deployed to | `string` | n/a | yes |
| key | Key that tfstate is stored in | `string` | n/a | yes |
| namespace | Project name | `string` | n/a | yes |
| owner | Owner of this infrastructure | `string` | n/a | yes |
| private\_subnets | n/a | `list(string)` | `[]` | no |
| public\_subnets | n/a | `list(string)` | `[]` | no |
| region | Region resources are being deployed to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| availability\_zones | A list of availability zones specified as argument to this module |
| private\_subnet\_arns | List of ARNs of private subnets |
| private\_subnets | List of IDs of private subnets |
| private\_subnets\_cidr\_blocks | List of cidr\_blocks of private subnets |
| public\_subnet\_arns | List of ARNs of public subnets |
| public\_subnets | List of IDs of public subnets |
| public\_subnets\_cidr\_blocks | List of cidr\_blocks of public subnets |
| vpc\_arn | The ARN of the VPC |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_id | The ID of the VPC |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
