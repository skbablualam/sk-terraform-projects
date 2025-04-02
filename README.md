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

# terraform-aws-project/aws-resources

│── main.tf

│── variables.tf

│── provider.tf

│── outputs.tf

│── terraform.tfvars (optional)

│── README.md



1. Customize Variables in terraform.tfvars (optional).

Initialize Terraform:

terraform init

2. Plan and Apply:

terraform plan  

terraform apply  

4. Push to GitHub:

git add .  

git commit -m "Initial AWS Terraform Project"  

git push origin main

# 1. azure-resources #

This Terraform project for Azure includes the following resources:

Resource Group – Defines a logical container for all resources.

Virtual Network (VNet) – Creates a VNet to manage networking.

Subnet – A subnet within the VNet for VM connectivity.

Network Security Group (NSG) – Security rules to allow SSH access.

Public IP – Assigns a dynamic public IP to the VM.

Network Interface (NIC) – Connects the VM to the VNet.

Linux Virtual Machine – Deploys a Linux-based VM with SSH access.

Storage Account – Creates an Azure Storage Account for data storage.

PostgreSQL Database – Sets up a managed PostgreSQL database.

Output Variables – Displays key resource information like VM public IP, storage account name, and database endpoint.




