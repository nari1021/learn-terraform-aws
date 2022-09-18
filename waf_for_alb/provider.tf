provider "aws" {
  region  = var.region
  profile = "terraform"

  default_tags {
    tags = local.tags
  }
}

terraform {
  required_version = ">= 1.1.5"
  required_providers {
    aws = {
      version = ">=4.31.0"
      source  = "hashicorp/aws"
    }
  }
}
