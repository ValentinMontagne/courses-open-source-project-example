# The configuration for the `remote` backend.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"

  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "vm-github-actions-example"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "my-workspace"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# AWS EC2 instance
resource "aws_instance" "example" {
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  key_name      = var.ec2_key_name
  tags = {
    Name = "ExampleInstance"
  }

  # Example: Setting up Docker container during provisioning
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y docker
              sudo service docker start
              # Pull and run your Docker image here
              docker run -d -p 80:80 valentinmontagne/nginx-web-example:${var.docker_image_version}
              EOF
}

# Example: Security Group allowing inbound traffic on port 80 (HTTP)
resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Allow inbound traffic on port 80"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "example-sg"
  }
}
