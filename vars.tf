variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "aws-cicd-demo"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Update with a valid AMI for your region
}

variable "ec2_key_pair" {
  description = "Name of the EC2 key pair for SSH access"
  type        = string
  default     = "" # Replace with your key pair name
}