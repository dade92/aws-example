#TODO once I will have a proper docker image I can remove the associate_public_ip_address flag
#If you want to deploy single app, just use server_FE, changing the user_data properly

resource "aws_instance" "server_BE" {
  ami                         = "ami-09e647bf7a368e505"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnets[0].id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.security_be.id]
  key_name                    = "example-1"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  user_data = var.user_data_BE

  tags = {
    Name = "ec2-BE"
  }
}

resource "aws_instance" "server_FE" {
  ami                         = "ami-09e647bf7a368e505"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnets[1].id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.security_fe.id]
  key_name                    = "example-1"
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile.name

  user_data = var.user_data_single_app

  tags = {
    Name = "ec2-FE"
  }
}