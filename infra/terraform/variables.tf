variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name used for tagging and naming"
  type        = string
  default     = "capstone-phoenix"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for all nodes"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "Name of the SSH key pair in AWS"
  type        = string
  default     = "capstone-phoenix"
}

variable "my_ip" {
  description = "Your local IP address for SSH access (CIDR format)"
  type        = string
}

variable "worker_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}
