variable "system" {
  description = "system code"
  type        = string
  default     = "sandbox"
}
variable "env" {
  description = "배포 환경 이름"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "리소스 관리 주체"
  type        = string
  default     = "sye2112"
}

variable "region" {
  description = "사용하는 리전"
  type        = string
  default     = "ap-northeast-1"
}

variable "service_name" {
  description = "리소스에 의해 운영되는 서비스"
  type        = string
  default     = "VPC"
}

variable "tags" {
  description = "리소스 태그"
  type        = map(string)
  default = {
    "terraform" = "maked"
  }
}
