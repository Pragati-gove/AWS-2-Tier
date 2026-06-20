# AWS 2-Tier Infrastructure using Terraform

## Project Overview

This project provisions a highly available 2-tier AWS architecture using Terraform.

The infrastructure includes:

* Custom VPC
* Public and Private Subnets
* Internet Gateway
* NAT Gateway
* Security Groups
* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* EC2 Instances
* Amazon RDS (MariaDB)
* Remote Terraform State in S3

The project demonstrates Infrastructure as Code (IaC) principles and AWS cloud architecture best practices.

---

## Architecture

```text
Internet
   │
   ▼
Application Load Balancer
   │
   ▼
Auto Scaling Group
 ├── EC2 Instance 1
 └── EC2 Instance 2
   │
   ▼
Amazon RDS (MariaDB)
```

### Components

### Networking

* VPC
* Public Subnets
* Private Database Subnets
* Internet Gateway
* NAT Gateway
* Route Tables

### Security

* ALB Security Group
* EC2 Security Group
* RDS Security Group

### Compute

* Launch Template
* Auto Scaling Group
* EC2 Instances

### Database

* Amazon RDS MariaDB
* Multi-tier network isolation

---

## Technologies Used

* Terraform
* AWS VPC
* AWS EC2
* AWS Auto Scaling
* AWS Application Load Balancer
* AWS RDS (MariaDB)
* AWS S3 Backend
* Git & GitHub

---

## Folder Structure

```text
.
├── backend.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars
├── output.tf
├── main.tf
├── modules
│   ├── vpc
│   ├── sg
│   ├── web
│   └── db
└── README.md
```

---

## Deployment

## Initialize Terraform:
terraform init
## Validate Configuration:
terraform validate
## Execution Plan:
terraform plan
## Deploy Infrastructure:
terraform apply


## Outputs

After deployment:

* ALB DNS Name
* RDS Endpoint

Example:

```bash
terraform output
```

---

## Cleanup

Destroy all resources:

```bash
terraform destroy
```

---

## Skills Demonstrated

* Infrastructure as Code (Terraform)
* AWS Networking
* High Availability Architecture
* Auto Scaling
* Load Balancing
* Security Group Design
* RDS Deployment
* Modular Terraform Design
* Remote State Management
* GitHub Version Control

---

## Future Enhancements

* Route 53 Integration
* HTTPS using ACM
* ERPNext Deployment
* Amazon EFS for shared storage
* CloudWatch Monitoring
* CI/CD Pipeline with GitHub Actions
