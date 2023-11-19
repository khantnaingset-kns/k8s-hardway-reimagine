variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}


variable "internal_firewall_name" {
  type        = string
  description = "Name of the internal firewall"
}

variable "external_firewall_name" {
  type        = string
  description = "Name of the external firewall"
}

variable "subnet_ipcidr_range" {
  type        = string
  description = "IP CIDR range of the subnet"
}