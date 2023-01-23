terraform {
  required_version = ">= 1.1.5"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.14.0"
    }
  }
}

provider "aws" {
  profile                  = "terraform-sandbox"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
