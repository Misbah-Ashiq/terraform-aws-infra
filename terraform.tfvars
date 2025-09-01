project_name        = "terraform-aws-infra"
aws_region          = "us-east-1"   # North Virginia
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

# Only your IP allowed for SSH (secure)
allowed_ssh_cidr    = "204.236.206.26/32"

# HTTP (80) sabke liye allow, taake web server accessible ho
allowed_http_cidr   = "0.0.0.0/0"

# Instance size
instance_type       = "t2.micro"

# EC2 Key Pair name (without .pem extension)
key_pair_name       = "loginkey"

