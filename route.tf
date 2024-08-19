resource "aws_route53_record" "domain-record" {
  zone_id = "Z01401972E5NVI2LD2MZT"
  name    = "davidebotti.com"
  type    = "A"
  alias {
    name                   = aws_lb.my_alb.dns_name
    zone_id                = aws_lb.my_alb.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "images-record" {
  zone_id = "Z01401972E5NVI2LD2MZT"
  name    = aws_s3_bucket.s3-bucket.bucket
  type    = "CNAME"
  records = [aws_s3_bucket.s3-bucket.bucket_regional_domain_name]
  ttl     = 300
}