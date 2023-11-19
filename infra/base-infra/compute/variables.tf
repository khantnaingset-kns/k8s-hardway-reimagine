variable "controller_instances_prefix" {
  type        = string
  description = "Controller instances prefix"
}

variable "worker_instances_prefix" {
  type        = string
  description = "Worker instances prefix"
}

variable "zone" {
  type        = string
  description = "GCP zone"
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "subnetwork_id" {
  type        = string
  description = "ID of the subnet"
}
