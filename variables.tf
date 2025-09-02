variable "project_name"      { type = string  default = "iac-ec2-vpc" }
variable "aws_region"        { type = string  default = "ap-south-1" }

variable "vpc_cidr"          { type = string  default = "10.0.0.0/16" }
variable "public_subnet_cidr"{ type = string  default = "10.0.1.0/24" }
variable "private_subnet_cidr"{ type = string default = "10.0.2.0/24" }

# Restrict SSH/HTTP to your IP for security; for demo you can use 0.0.0.0/0
variable "allowed_ssh_cidr"  { type = string  default = "0.0.0.0/0" }
variable "allowed_http_cidr" { type = string  default = "0.0.0.0/0" }

variable "instance_type"     { type = string  default = "t3.micro" }

# You can pass an existing EC2 key pair name or create/import later
variable "key_pair_name"     { type = string  default = "" }
