# ---- VPC ----
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = { Name = "demo-vpc" }
}

# ---- Internet Gateway ----
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "demo-igw" }
}

# ---- Public Subnet ----
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
  tags = { Name = "demo-public-subnet" }
}

# ---- Route Table ----
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = { Name = "demo-public-rt" }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# ---- Security Group ----
resource "aws_security_group" "web_sg" {
  name        = "demo-web-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "demo-sg" }
}

# ---- Latest Amazon Linux 2023 AMI ----
data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["137112412989"] # Amazon

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# ---- EC2 Instance ----
resource "aws_instance" "web" {
  ami                         = data.aws_ami.al2023.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install -y nginx
              systemctl enable nginx

              cat <<EOT > /usr/share/nginx/html/index.html
              <!DOCTYPE html>
              <html lang="en">
              <head>
                  <meta charset="UTF-8">
                  <meta name="viewport" content="width=device-width, initial-scale=1.0">
                  <title>Terraform AWS Infra</title>
                  <style>
                      body {
                          font-family: Arial, sans-serif;
                          margin: 0;
                          padding: 0;
                          background: linear-gradient(to right, #6a11cb, #2575fc);
                          color: white;
                          text-align: center;
                      }
                      .container { padding: 40px; }
                      h1 { font-size: 2.5em; margin-bottom: 10px; }
                      h2 { margin-top: 30px; }
                      ul { list-style: none; padding: 0; }
                      ul li {
                          background: rgba(255,255,255,0.2);
                          margin: 5px;
                          padding: 10px;
                          border-radius: 8px;
                      }
                  </style>
              </head>
              <body>
                  <div class="container">
                      <h1>terraform-aws-infra</h1>
                      <h3>Owner: Misbah</h3>
                      <p><b>Description:</b> This project is deployed successfully using Terraform & AWS.</p>
                      
                      <h2>Skills Used</h2>
                      <ul>
                          <li>Terraform</li>
                          <li>AWS EC2</li>
                          <li>VPC & Subnets</li>
                          <li>Security Groups</li>
                          <li>Infrastructure as Code (IaC)</li>
                      </ul>
                  </div>
              </body>
              </html>
              EOT

              systemctl restart nginx
              EOF

  tags = { Name = "demo-ec2" }
}
