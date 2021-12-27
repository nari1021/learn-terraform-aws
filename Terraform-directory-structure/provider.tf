provider "aws" {
  access_key = "<AWS_ACCESS_KEY>"
  secret_key = "<AWS_SECRET_KEY>"
  region     = "ap-northeast-1"
}

##### Terraform Configuration Block #####
# 테라폼의 공작과 관련된 여러 설정이 포함된다.
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
