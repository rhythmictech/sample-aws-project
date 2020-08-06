
resource "aws_route53_zone" "external_zones" {
  for_each = var.external_zones
  name     = each.value

  tags = merge(
    map(
      "Name", each.value
    ),
    module.tags.tags_no_name
  )
}

resource "aws_acm_certificate" "external_zone_cert" {
  for_each                  = var.external_zones
  domain_name               = "*.${each.value}"
  subject_alternative_names = [each.value]
  validation_method         = "DNS"

  tags = merge(
    map(
      "Name", each.value
    ),
    module.tags.tags_no_name
  )

  lifecycle {
    create_before_destroy = true
  }
}
