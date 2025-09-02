terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# OPTIONAL (future): remote state (S3 + DynamoDB)
# backend "s3" {
#   bucket         = "your-unique-terraform-state-bucket"
#   key            = "iac-ec2-vpc/terraform.tfstate"
#   region         = "ap-south-1"
#   dynamodb_table = "terraform-state-locks"
#   encrypt        = true
# }
