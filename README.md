# BITS-CloudReady-
BITS CloudReady™ is a fully simulated business network on AWS. Built with secure VPC architecture, public/private subnets, compute, databases, IAM, monitoring, and failover, it demonstrates how Brooks IT Services delivers scalable, cost-optimized, and reliable cloud solutions for clients.

Project Overview

This project simulates the cloud migration of a fictional mid-sized business.  
It implements real-world AWS architecture patterns for public web hosting, private backend systems, secure connectivity, monitoring, and failover.

## Architecture

**Key Features:**
- Multi-tier **VPC architecture** with public/private subnets
- **Public-facing web tier** (S3 + CloudFront + Route 53)
- **Private compute tier** (EC2/Lambda)
- **Relational Database** (Amazon RDS) with encryption
- **Secure access controls** (IAM roles/policies, security groups)
- **Monitoring & logging** (CloudWatch, VPC Flow Logs)
- **Failover** using Route 53 health checks
- **Cost optimization** with AWS Budgets and tagging

![Architecture Diagram](docs/architecture-diagram.png)

---

## 🛠 AWS Services Used

| Service        | Purpose |
|----------------|---------|
| Amazon VPC     | Network isolation & routing |
| EC2 / Lambda   | Compute for backend |
| S3 + CloudFront| Static site hosting & caching |
| Amazon RDS     | Database tier |
| IAM            | Secure access control |
| Route 53       | DNS + failover |
| CloudWatch     | Monitoring & alarms |
| AWS Budgets    | Cost control |
