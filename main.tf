terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

locals {
  project_name = "Terraform Homework – VPC & EC2"
}

output "project_info" {
  value = "Deploying: ${local.project_name}"
}
