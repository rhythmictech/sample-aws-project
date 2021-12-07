# Account Settings

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_backend"></a> [backend](#module\_backend) | rhythmictech/backend/aws | 2.1.0 |
| <a name="module_cloudtrail_bucket"></a> [cloudtrail\_bucket](#module\_cloudtrail\_bucket) | rhythmictech/cloudtrail-bucket/aws | 1.2.0 |
| <a name="module_cloudtrail_logging"></a> [cloudtrail\_logging](#module\_cloudtrail\_logging) | rhythmictech/cloudtrail-logging/aws | 1.1.0 |
| <a name="module_does_workspace_match_env"></a> [does\_workspace\_match\_env](#module\_does\_workspace\_match\_env) | rhythmictech/errorcheck/terraform | ~> 1.0.0 |
| <a name="module_iam_password_policy"></a> [iam\_password\_policy](#module\_iam\_password\_policy) | rhythmictech/iam-password-policy/aws | 1.0.0 |
| <a name="module_rhythmic_iam_roles"></a> [rhythmic\_iam\_roles](#module\_rhythmic\_iam\_roles) | rhythmictech/rhythmic-iam-roles/aws | 1.1.0 |
| <a name="module_s3logging_bucket"></a> [s3logging\_bucket](#module\_s3logging\_bucket) | rhythmictech/s3logging-bucket/aws | 1.0.1 |
| <a name="module_tags"></a> [tags](#module\_tags) | rhythmictech/tags/terraform | 1.1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | Bucket that tfstate is stored in | `string` | n/a | yes |
| <a name="input_dynamodb_table"></a> [dynamodb\_table](#input\_dynamodb\_table) | DynamoDB table for locking/state management | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment being deployed to | `string` | n/a | yes |
| <a name="input_iam_master_account"></a> [iam\_master\_account](#input\_iam\_master\_account) | n/a | `string` | n/a | yes |
| <a name="input_iam_role_prefix"></a> [iam\_role\_prefix](#input\_iam\_role\_prefix) | n/a | `string` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | Key that tfstate is stored in | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Project name | `string` | n/a | yes |
| <a name="input_owner"></a> [owner](#input\_owner) | Owner of this infrastructure | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region resources are being deployed to | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudtrail_log_group"></a> [cloudtrail\_log\_group](#output\_cloudtrail\_log\_group) | CloudTrail CloudWatch log group |
| <a name="output_s3_bucket_access_logging"></a> [s3\_bucket\_access\_logging](#output\_s3\_bucket\_access\_logging) | S3 bucket to receive S3 bucket access logs |
| <a name="output_s3_bucket_access_logging_domain_name"></a> [s3\_bucket\_access\_logging\_domain\_name](#output\_s3\_bucket\_access\_logging\_domain\_name) | S3 bucket to receive S3 bucket access logs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
