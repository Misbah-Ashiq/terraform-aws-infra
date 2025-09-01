project_name        = "iac-ec2-vpc"
aws_region          = "ap-south-1"     # or "us-east-1"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

# replace with YOUR IP/CIDR for security if possible
allowed_ssh_cidr    = "0.0.0.0/0"
allowed_http_cidr   = "0.0.0.0/0"

instance_type       = "t3.micro"

# If you have an EC2 Key Pair in your region, put its name here, else leave empty
key_pair_name       = "your-ec2-keypair-name"
