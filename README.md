# sk-terraform-projects
terraform script for cloud and devops automation!

# 1. aws-resources #
The project includes:
✅ VPC, Subnets, and Security Groups
✅ EC2 Instances
✅ S3 Bucket
✅ IAM Role & Policy
✅ RDS (MySQL/PostgreSQL)
✅ ALB (Application Load Balancer)

terraform-aws-project/aws-resources
│── main.tf
│── variables.tf
│── provider.tf
│── outputs.tf
│── terraform.tfvars (optional)
│── README.md

# This Terraform project includes:
# A VPC with a public subnet
# EC2 instance with an SSH security group
# S3 bucket
# RDS MySQL database
# Outputs for EC2, S3, and RDS

# 1. Customize Variables in terraform.tfvars (optional).

Initialize Terraform:
terraform init

# 2. Plan and Apply:
terraform plan  
terraform apply  

# 3. Push to GitHub:
git add .  
git commit -m "Initial AWS Terraform Project"  
git push origin main






