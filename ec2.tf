resource "aws_instance" "example_server" {
  ami           = "ami-09e647bf7a368e505"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnets[0].id
  associate_public_ip_address = true
  security_groups = [ aws_security_group.security.id ]
  key_name = "example-1"

  tags = {
    Name = "ec2-vpc-example"
  }
}