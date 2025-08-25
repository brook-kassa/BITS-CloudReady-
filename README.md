# BITS CloudReady™ – Simulated Business Network on AWS
BITS CloudReady™ is a fully simulated business network I built on AWS to show exactly what I can create for my clients. Using secure VPC architecture, public and private subnets, compute, databases, IAM, monitoring, and failover, it’s a live example of how I deliver scalable, cost-optimized, and reliable cloud solutions through **[Brook's IT Services](https://www.brookkassa.com)**.

## Project Overview

This project simulates the cloud migration of a fictional mid-sized company, using the same AWS patterns and best practices I apply for real clients.

Whether you're migrating to the cloud for the first time or modernizing an existing setup, this environment demonstrates exactly how I can help:

* Host your public-facing applications and websites.

* Keep sensitive data in secure, private backend systems.

* Protect your environment with security best practices and strict access control.

* Monitor performance and costs so your infrastructure stays healthy and efficient.





| Characteristics                    | Specifics                                                                                                                                         | 
| -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------- | 

| **Company name & brand**   | BluePort Cargo _"On Time. Every Time."_    ![favicon](https://github.com/user-attachments/assets/e5a154cc-3a9a-4b0f-893d-0d0017d38691)
                                                                                                         | 
| **Industry**               | Logistics & Freight                                                                                                                                      |
| **Size**                   | 250 employees, 3 main offices (Nairobi, Djibouti City, Cairo) and 1 satellite office (Addis Ababa)                                                       |
| **Locations**              | Offices in Nairobi, Djibouti City, Cairo, and Addis Ababa (satellite)                                                                                    |
| **Business goals**         | Provide a public shipment tracking portal, secure internal business applications, and a hybrid cloud deployment for both on-premise and cloud operations | 
| **Pain points**            | High latency, unreliable hosting, costly IT                                                                                                              | 
| **Technical requirements** | PostgreSQL database for shipment tracking, VPN for office connectivity, IAM roles for regional staff access                                              |
| **Compliance needs**       | GDPR, PCI-DSS, ISO 27001, and data protection best practices                                                                                             | 

## Architecture
<img width="4760" height="3300" alt="BluePort Cargo Diagram (6)" src="https://github.com/user-attachments/assets/b6a71de5-8dd5-42e3-af5a-7a4c67367da5" />


## **Key Features I’ve Implemented:**
- Multi-tier **VPC architecture** with public/private subnets
- **Public-facing web tier** (S3 + CloudFront + Route 53)
- **Private compute tier** (EC2/Lambda)
- **Relational Database** (Amazon RDS) with encryption
- **Secure access controls** (IAM roles/policies, security groups)
- **Monitoring & logging** (CloudWatch, VPC Flow Logs)
- **Failover** using Route 53 health checks
- **Cost optimization** with AWS Budgets and tagging


## AWS Services Used

| Service        | Purpose |
|----------------|---------|
| Amazon VPC     | To isolate resources, control traffic flow, and securely connect services. |
| EC2 / Lambda   | To host backend services in a controlled, private environment. |
| S3 + CloudFront| To serve static website content quickly and securely around the world. |
| Amazon RDS     | To store and manage structured business data with encryption. |
| IAM            | To enforce least-privilege access for users and applications. |
| Route 53       | To manage DNS and enable automated failover. |
| CloudWatch     | To track performance, create alarms, and analyze logs. |
| AWS Budgets    | To keep cloud costs visible and under control. |
