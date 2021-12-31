provider "aws" {
  # AWS Access Key & Secret Key 는 aws configure로 관리하는 것이 보안상 더 적절하다
  # access_key = "<AWS_ACCESS_KEY>"
  # secret_key = "<AWS_SECRET_KEY>"
  region     = var.region

  default_tags {
    tags = local.tags
  }
}

# Terraform cloud 사용하지 않는다면 아래부분 모두 주석처리
##### Terraform Configuration Block #####
# 테라폼의 동작과 관련된 여러 설정이 포함된다.
# Using a single workspace:
terraform {
  # 필수 버전 지정
  required_version = ">= 1.0.0"

  # Backend: Terrform의 상태 스냅샷이 저장되는 위치 정의
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "company"

    workspaces {
      name = "my-app-prod"
    }
  }
}

# Using multiple workspaces:
terraform {
  backend " remote" {
    hostname     = "app.terraform.io"
    organization = "company"

    workspaces {
      prefix = "my-app-"
    }
  }
}

#### get data from Terraform #####
data "terraform_remote_state" "foo" {
  backend = "remote"

  config = {
    organization = "company"

    workspaces = {
      name = "workspace"
    }
  }
}
