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