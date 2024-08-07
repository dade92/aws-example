variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "user_data_FE" {
  type        = string
  description = "Initialization script"
  default     = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 166222693886.dkr.ecr.eu-central-1.amazonaws.com
    docker run -p 80:80 --rm -d public.ecr.aws/j9p4t0r0/upload-ui:latest
  EOF
}

variable "user_data_BE" {
  type        = string
  description = "Initialization script"
  default     = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 166222693886.dkr.ecr.eu-central-1.amazonaws.com
    TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`  && curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/iam/security-credentials/ec2_role > permissions.json
    docker run -p 8080:8080 --rm -d -e ACCESS_KEY=$(jq -r '.AccessKeyId' permissions.json) -e SECRET_ACCESS_KEY=$(jq -r '.SecretAccessKey' permissions.json) -e SESSION_TOKEN=$(jq -r '.Token' permissions.json) public.ecr.aws/j9p4t0r0/spring-example2:latest
    rm permissions.json
  EOF
}

variable "user_data_FE_2" {
  type        = string
  description = "Initialization script"
  default     = <<-EOF
    #!/bin/bash
    set -ex
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 166222693886.dkr.ecr.eu-central-1.amazonaws.com
    docker run -p 80:80 --rm -d 166222693886.dkr.ecr.eu-central-1.amazonaws.com/react-example2:latest
  EOF
}