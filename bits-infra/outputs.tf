output "vpc_id" {
  description = "THE VPC ID"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "THE VPC CIDR"
  value       = aws_vpc.main.cidr_block
}

output "region" {
  description = "Deployment region"
  value       = var.aws_region
}

output "acm_dns_validations" {
  value = [
    for dvo in aws_acm_certificate.bits_cert.domain_validation_options : {
      domain = dvo.domain_name
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      value  = dvo.resource_record_value
    }
  ]
}
