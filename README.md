# AWS EXAMPLE

This is a terraform POC that provisions different useful resources in a AWS cluster.

It provisions a VPC with 2 public subnets and 2 private subnets, an ec2 micro instance (free tier eligible)
with a proper security group, an internet gateway for the VPC. The ec2 instance has a specific role assigned,
that can be used to pull a docker image from the private ECR.

Moreover, it creates a mysql database that can be used by the ec2 instance to fetch data and a simple load balancer
that forward HTTP requests to the ec2.

On the instance you can deploy something like: [https://github.com/dade92/nexts-example] to have a complete
app with FE and BE, connected to a mysql database, all inside the AWS cluster.