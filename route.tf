# resource "aws_route53_zone" "zone_dev" {
#   name    = "backend-example.com"
#   comment = "Example hosted Zone"
# }

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