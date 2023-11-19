variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "subnet_ipcidr_range" {
  type        = string
  description = "IP CIDR range of the subnet"
}