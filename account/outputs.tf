
########################################
# Security Outputs
########################################

output "cloudtrail_log_group" {
  description = "CloudTrail CloudWatch log group"
  value       = module.cloudtrail_logging.cloudwatch_loggroup_name
}

output "s3_bucket_access_logging_bucket" {
  description = "S3 bucket to receive S3 bucket access logs"
  value       = module.s3logging_bucket.s3_bucket_name
}

output "s3_bucket_access_logging_domain_name" {
  description = "S3 bucket to receive S3 bucket access logs"
  value       = module.s3logging_bucket.s3_bucket_domain_name
}
