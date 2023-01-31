# 1. Create VPC by Terraform

## 1. Directory Structure

✅ Terraform workspace는 하나의 디렉토리로 관리되므로 다음의 기본 구조를 가진다.

|파일명|설명|비고|
|-----|------|------|
|init.tf|해당 Terraform workspace 에서 사용될 지역변수 설정||
|provider.tf|aws provider 정보, Terraform workspace 정보 설정|aws alias 설정 등 multi account 전략에 따른 multi provider 설정|
|main.tf|Terraform resources 설정|특정 Resource Type으로 분리 가능, 작은 단위의 경우 main 사용|
|variables.tf|Terraform variables 설정||
|outputs.tf|Terraform output으로 나와야 할 값 설정|Workspace간의 output 값을 공유하여 사용할 수 있음. (ex. terraform_remote_state)|
|README.md|해당 모듈, workspace에 대한 설명, 주의사항, 버전 작성||


## 2. provider

[AWS Provider 사용 시 IAM User 설정](https://github.com/nari1021/learn-terraform-aws/tree/main/0.%20Terraform%20init%20settings#aws-provider-%EC%82%AC%EC%9A%A9-%EC%8B%9C-iam-user-%EC%84%A4%EC%A0%95)

