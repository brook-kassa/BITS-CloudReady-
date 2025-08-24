resource "aws_route53_zone" "main" {
  name = "bitscloudready.com"
}

resource "aws_route53_record" "root" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "bitscloudready.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.bits_site.domain_name
    zone_id                = "Z2FDTNDATAQYW2" 
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.bitscloudready.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.bits_site.domain_name
    zone_id                = "Z2FDTNDATAQYW2" 
    evaluate_target_health = false
  }
}

resource "aws_route53_health_check" "site_health" {
  fqdn              = "bitscloudready.com"
  type              = "HTTP"
  resource_path     = "/healthcheck.html"
  port              = 80
  failure_threshold = 3
  request_interval  = 30
}
