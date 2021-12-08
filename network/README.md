# network

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.68.0 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_does_workspace_match_env"></a> [does\_workspace\_match\_env](#module\_does\_workspace\_match\_env) | rhythmictech/errorcheck/terraform | ~> 1.0.0 |
| <a name="module_tags"></a> [tags](#module\_tags) | rhythmictech/tags/terraform | ~> 1.1.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.11.0 |
| <a name="module_vpcflowlogs"></a> [vpcflowlogs](#module\_vpcflowlogs) | rhythmictech/vpcflowlogs/aws | ~> 1.1.2 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.external_zone_cert](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_route53_zone.external_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [terraform_remote_state.account](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | Availability zones to create VPC in | `list(string)` | n/a | yes |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Bucket that tfstate is stored in | `string` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | CIDR block for VPC | `string` | n/a | yes |
| <a name="input_dynamodb_table"></a> [dynamodb\_table](#input\_dynamodb\_table) | DynamoDB table for locking/state management | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment being deployed to | `string` | n/a | yes |
| <a name="input_external_zones"></a> [external\_zones](#input\_external\_zones) | List of External Zones to register in R53 | `set(string)` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | Key that tfstate is stored in | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Project name | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of this infrastructure | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | n/a | `list(string)` | `[]` | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | n/a | `list(string)` | `[]` | no |
| <a name="input_region"></a> [region](#input\_region) | Region resources are being deployed to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_availability_zones"></a> [availability\_zones](#output\_availability\_zones) | A list of availability zones specified as argument to this module |
| <a name="output_private_subnet_arns"></a> [private\_subnet\_arns](#output\_private\_subnet\_arns) | List of ARNs of private subnets |
| <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets) | List of IDs of private subnets |
| <a name="output_private_subnets_cidr_blocks"></a> [private\_subnets\_cidr\_blocks](#output\_private\_subnets\_cidr\_blocks) | List of cidr\_blocks of private subnets |
| <a name="output_public_subnet_arns"></a> [public\_subnet\_arns](#output\_public\_subnet\_arns) | List of ARNs of public subnets |
| <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets) | List of IDs of public subnets |
| <a name="output_public_subnets_cidr_blocks"></a> [public\_subnets\_cidr\_blocks](#output\_public\_subnets\_cidr\_blocks) | List of cidr\_blocks of public subnets |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | The ARN of the VPC |
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | The CIDR block of the VPC |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
