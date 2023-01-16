terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }
  backend "s3" {
    bucket = "carpenter-s3-carpenter-00126xx"
    key    = "aws-vpc-splat-expressions/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "leandro"
      managed-by = "terraform"
    }
  }
}