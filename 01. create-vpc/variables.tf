variable "env" {
  description = "배포 환경 이름"
  type        = string
}

variable "region" {
  description = "사용하는 리전"
  type        = string
}

variable "azs" {
  description = "사용하는 가용영역"
  type        = list(string)
}

variable "tags" {
  description = "리소스 태그"
  type        = map(string)
}

# Network
variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
}

variable "public_subnet_cidr_list" {
  description = "VPC의 public subnet cidr 목록"
  type        = list(string)
}

variable "private_subnet_cidr_list" {
  description = "VPC의 private subnet cidr 목록"
  type        = list(string)
}
