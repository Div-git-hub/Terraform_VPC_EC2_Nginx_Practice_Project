# Terraform AWS VPC + EC2 Nginx Setup

## 📌 Project Overview
This project provisions AWS infrastructure using Terraform, including a custom VPC, public subnet, Internet Gateway, route tables, and an EC2 instance with Nginx installed.

## 🏗️ Architecture
- VPC
- Public Subnet
- Internet Gateway
- Route Table
- EC2 Instance (Nginx installed)

## ⚙️ Technologies Used
- Terraform
- AWS (EC2, VPC)
- Linux (User Data Script)
- Git

## 📂 Project Structure
.
├── Module/
│   ├── vpc/
│   ├── ec2/
├── scripts/
├── main.tf
├── variables.tf
├── output.tf

## 🚀 How to Run
1. terraform init
2. terraform plan
3. terraform apply

## 🌐 Output
- EC2 Public IP
- Access Nginx via browser

