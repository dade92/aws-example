#If you want a single app, remember to comment/remove the related outputs

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.server_BE.id
}

output "instance_arn" {
  description = "arn of the EC2 instance"
  value       = aws_instance.server_BE.arn
}

output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.server_BE.public_ip
}

output "fe_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.server_FE.id
}

output "fe_instance_arn" {
  description = "arn of the EC2 instance"
  value       = aws_instance.server_FE.arn
}

output "fe_instance_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.server_FE.public_ip
}

output "load_balancer_arn" {
  description = "Load balancer arn"
  value       = aws_lb.my_alb.arn
}

output "load_balancer_dns_name" {
  description = "Load balancer dns name"
  value       = aws_lb.my_alb.dns_name
}

output "internet_gateway_id" {
  description = "internet gateway id"
  value       = aws_internet_gateway.gw.id
}

output "security_group_fe_arn" {
  description = "fe security group arn"
  value       = aws_security_group.security_fe.arn
}

output "security_group_be_arn" {
  description = "be security group arn"
  value       = aws_security_group.security_be.arn
}

# output "db_name" {
#   description = "db name"
#   value       = aws_db_instance.default.db_name
# }

# output "db_endpoint" {
#   description = "db endpoint"
#   value       = aws_db_instance.default.endpoint
# }

