resource "aws_instance" "example_server" {
  ami                         = "ami-09e647bf7a368e505"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnets[0].id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.security.id]
  key_name                    = "example-1"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  user_data = var.user_data

  tags = {
    Name = "ec2-vpc-example"
  }
}