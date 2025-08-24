variable "aws_region" {
  type        = string
  description = "AWS region to deploy into"
  default     = "eu-west-1"
  validation {
    condition     = length(var.aws_region) > 0
    error_message = "aws_region cannot be empty."
  }
}

variable "environment" {
  type        = string
  description = "Environment name (dev, stage, prod)"
  default     = "dev"
  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "environment must be one of: dev, stage, prod."
  }
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.20.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr must be a valid IPv4 CIDR block(e.g., 10.20.0.0/16)."
  }
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  type        = string
  description = "Apex domain (e.g., bitscloudready.com)"
}



