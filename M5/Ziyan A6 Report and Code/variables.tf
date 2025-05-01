variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH Key Name"
  type        = string
  default     = "a6key"
}

variable "instance_name" {
  description = "Instance Name Tag"
  type        = string
  default     = "ziyan-web-server-instance"
}
