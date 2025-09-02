# Infrastructure as Code with Terraform (AWS EC2 + VPC)

## 📌 Project Overview

This project demonstrates how to provision AWS infrastructure using **Terraform**.\
We will create a **VPC, Subnets, Internet Gateway, Security Groups, and an EC2 instance** as a complete environment.  

## 🚀 Features

- **Infrastructure as Code (IaC)** with Terraform  
- **Reusable & Scalable** AWS environment  
- **Secure by Design** (IAM roles, Security Groups, VPC isolation)  
- **Cost-optimized** deployment  


## ⚙️ Technologies Used

- **Terraform**  
- **AWS (VPC, EC2, Security Groups, Subnets, IGW)**  
- **GitHub** (Version Control)  

## 📂 Project Structure

terraform-aws-vpc-ec2/\
│-- main.tf\
│-- variables.tf\
│-- outputs.tf\
│-- provider.tf\
│-- README.md


## 📖 Steps to Run

1. **Clone this repository**

```bash
git clone https://github.com/yourusername terraform-aws-vpc-ec2.git
cd terraform-aws-vpc-ec2
```

2. **Initialize Terraform**

```bash
terraform init
```

3. **Validate the configuration**

```bash
terraform validate
```

4. **Plan the infrastructure**

```bash
terraform plan
```

5. **terraform apply -auto-approve**

```bash
terraform apply -auto-approve
```

6. **Destroy resources when not needed**

```bash
terraform destroy -auto-approve
```

## 📊 Outputs

- VPC ID
- Subnet IDs
- Security Group ID
- EC2 Public IP

## 🛡️ Security Best Practices

- Never commit AWS credentials to GitHub.
- Use IAM roles and environment variables for authentication.
- Destroy resources after testing to avoid unnecessary costs.

## Contact me

- **Fiverr:** [https://www.fiverr.com/s/kLZGZvg](https://www.fiverr.com/s/kLZGZvg)\
- **LinkedIn:** [www.linkedin.com/in/misbah-ashiq-14a0aa356](www.linkedin.com/in/misbah-ashiq-14a0aa356)\
- **GitHub:** [https://github.com/Misbah-Ashiq](https://github.com/Misbah-Ashiq)\
- **Email:** [misbahdevops46@gmail.com](misbahdevops46@gmail.com)
