variable "region" {
  type        = string
  description = "GCP region"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "zone" {
  type        = string
  description = "GCP zone"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "subnet_name" {
  type        = string
  description = "Name of the subnet"
}

variable "subnet_ipcidr_range" {
  type        = string
  description = "IP CIDR range of the subnet"
}

variable "internal_firewall_name" {
  type        = string
  description = "Name of the internal firewall"
}

variable "external_firewall_name" {
  type        = string
  description = "Name of the external firewall"
}

variable "controller_instances_prefix" {
  type        = string
  description = "Controller instances prefix"
}

variable "worker_instances_prefix" {
  type        = string
  description = "Worker instances prefix"
}
