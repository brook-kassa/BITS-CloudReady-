resource "aws_route53_health_check" "cloudfront_check" {
  fqdn              = "dxxxxxxxxx.cloudfront.net" # Replace with actual CF domain
  port              = 443
  type              = "HTTPS"
  resource_path     = "/healthcheck.html"
  failure_threshold = 3
  request_interval  = 30

  tags = {
    Name = "CloudFront Health Check"
  }
}


