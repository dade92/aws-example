# AWS EXAMPLE

As a product engineers we are always focus on building new features using programming languages and
other frameworks, sometimes forgetting about the whole picture, in which cloud and product technologies are equally important.
This project is a personal POC that aims to be a comprehensive guide for the deployment
of a digital product, focusing on the most neglected part by us (product engineers), the platform.

## Detailed Description

This is a terraform POC that provisions different resources in a AWS cluster to produce
a working digital product (an image uploader at the moment).

It provisions: 
- a VPC with 2 public subnets and 2 private subnets
- two ec2 micro instance (free tier eligible) with a proper security group, an internet gateway for the VPC 
- an Application Load Balancer set up to route requests to specific instances
- an S3 bucket
- an A and a CNAME record to map the public ALB and S3 bucket to the domain.

On the two EC2 are deployed a [frontend application](https://github.com/dade92/aws-upload-ui)
for the UI part and a [backend application](https://github.com/dade92/spring-example2) for the business logic,
leveraging docker as a virtualization system. The docker images are
automatically taken from the public ECR registry.

It also provisions a route 53 record attached to a public domain, davidebotti.com.

Here the architecture:

![Alt text](architecture.png)

## How to provision

Inside the main folder, run `terraform init` to initialize and configure the project. Then run `terraform apply`.

## CI/CD

The two aforementioned projects have a pipeline attached (implemented using Github actions) that performs the following
steps:

- build
- test
- docker image build
- push on public distinct ECRs

You can find details on this simple pipelines directly in the linked projects.

## Deploy

The deploy is managed by bash script that at the moment are inside the initialization script of the EC2 instances.
Since at the moment  there is no EKS or ECS (generally speaking no orchestration system)
the re-deploy is managed manually, ssh-ing in the ec2 instance and restarting the
docker container, pulling the updated image from the ECR.