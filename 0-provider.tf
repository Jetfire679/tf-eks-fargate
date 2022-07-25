provider "aws" {
  region = "us-east-1"
  profile = "675716041761_AdministratorAccess"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
