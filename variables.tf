variable "aws_region" {
  description = "AWS region"
  default     = "eu-west-3" # Set your preferred default region
}

variable "ec2_ami" {
  description = "AMI for EC2 instance"
  default     = "ami-00a4e06732205ac29" # Specify your desired AMI ID
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro" # Set your desired instance type
}

variable "ec2_key_name" {
  description = "EC2 key pair name"
  default     = "CI" # Set the name of your key pair
}

variable "docker_image_version" {
  description = "Version of the Docker image to deploy"
  default     = "latest" # Set a default or initial version
}
