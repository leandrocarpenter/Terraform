terraform {

  required_version = ">=1.0.0"

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.94.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "remote-state"
    storage_account_name = "leandrocarpenterremotestate"
    container_name = "remote-state"
    key = "azure-vm/terraform.tfstate"
    }
  }

provider "azurerm" {
  features {}
}

data "terraform_remote_state" "vnet" {
  backend = "azurerm"
  config = {
    resource_group_name = "remote-state"
    storage_account_name = "leandrocarpenterremotestate"
    container_name = "remote-state"
    key = "pipeline-gitlab-ciazure-vnet/terraform.tfstate"
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "carpenter-s3-carpenter-00126xx"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}