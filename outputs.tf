output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example_server.id
}

output "instance_arn" {
  description = "arn of the EC2 instance"
  value       = aws_instance.example_server.arn
}

output "instance_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.example_server.public_ip
}

output "db_name" {
  description = "db name"
  value       = aws_db_instance.default.db_name
}

output "db_arn" {
  description = "db arn"
  value       = aws_db_instance.default.arn
}

output "db_address" {
  description = "db address"
  value       = aws_db_instance.default.address
}

output "db_endpoint" {
  description = "db endpoint"
  value       = aws_db_instance.default.endpoint
}