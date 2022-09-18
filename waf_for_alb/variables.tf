variable "csp" {
  type = string
}
variable "env" {
  type = string
}
variable "owner" {
  type = string
}
variable "service_name" {
  type = string
}
variable "az" {
  type = list(string)
}
variable "region" {
  type = string
}
variable "region_code" {
  type = string
}

# Tags
variable "tags" {
  type = map(string)
}

variable "alb_subnet_cidr_block" {
  type = list(string)
}
