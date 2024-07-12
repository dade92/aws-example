# resource "aws_route53_zone" "zone_dev" {
#   name    = "backend-example.com"
#   comment = "Example hosted Zone"
# }

# resource "aws_route53_record" "new-dev" {
#   zone_id = aws_route53_zone.zone_dev.zone_id
#   name    = "backend-example.com"
#   type    = "CNAME"
#   ttl     = 300
#   records = [aws_lb.my_alb.dns_name]
# }