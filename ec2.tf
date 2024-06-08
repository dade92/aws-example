resource "aws_instance" "example_server" {
  ami                         = "ami-09e647bf7a368e505"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnets[0].id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.security.id]
  key_name                    = "example-1"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 166222693886.dkr.ecr.eu-central-1.amazonaws.com
  EOF

  tags = {
    Name = "ec2-vpc-example"
  }
}