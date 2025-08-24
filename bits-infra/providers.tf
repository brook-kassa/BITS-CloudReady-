provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      Project     = "BITS"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
