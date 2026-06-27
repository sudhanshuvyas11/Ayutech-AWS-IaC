# Ayutech AWS Infrastructure as Code (IaC) 🚀

## Overview
This repository contains the foundational Terraform Infrastructure as Code (IaC) for **Ayutech IT Infrastructure**. It provisions a secure, enterprise-grade base network architecture on Amazon Web Services (AWS) using industry best practices.

## Architecture Components
The current deployment sets up the following resources in the `ap-south-1` (Mumbai) region:
* **Foundation VPC:** Enterprise Virtual Private Cloud (`10.0.0.0/16`)
* **Public Subnet:** Accessible from the internet, designed for Load Balancers and Web Servers (`10.0.1.0/24`)
* **Private Subnet:** Highly secure, isolated zone intended for backend databases and Private AI Models (`10.0.2.0/24`)
* **Internet Gateway (IGW):** Connects the VPC to the outside world
* **Route Tables:** Custom routing to allow internet access strictly for the Public Subnet

## Prerequisites
Before executing this code, ensure you have the following installed and configured on your local workstation:
* [Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.15 or higher)
* [AWS CLI v2](https://aws.amazon.com/cli/)
* AWS IAM Credentials configured locally (`aws configure`) with the appropriate Administrator access.

## Execution Guide

**1. Initialize the working directory**
Downloads the necessary AWS provider plugins.
```bash
terraform init
**2. Review the execution plan**
Validates the configuration and displays the exact resources that will be deployed or modified.
Bash
terraform plan

3. Deploy the infrastructure
Applies the code to your live AWS account.
Bash
terraform apply

### Final Step: Push to GitHub

File ko save karne ke baad, is nayi documentation ko apne remote repository par push karne ke liye apne terminal par yeh commands chalayen:

```bash
git add README.md
git commit -m "docs: Added comprehensive project README"
git push origin main
