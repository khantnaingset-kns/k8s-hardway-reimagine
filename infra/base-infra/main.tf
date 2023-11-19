module "vpc_network" {
  source   = "./vpc"
  vpc_name = var.vpc_name
}

module "subnet_network" {
  source              = "./subnet"
  subnet_name         = var.subnet_name
  region              = var.region
  vpc_id              = module.vpc_network.vpc_id
  subnet_ipcidr_range = var.subnet_ipcidr_range
  depends_on          = [module.vpc_network]
}

module "firewall" {
  source                 = "./firewall"
  external_firewall_name = var.external_firewall_name
  internal_firewall_name = var.internal_firewall_name
  vpc_id                 = module.vpc_network.vpc_id
  subnet_ipcidr_range    = var.subnet_ipcidr_range
  depends_on             = [module.vpc_network]
}

module "compute" {
  source                      = "./compute"
  controller_instances_prefix = var.controller_instances_prefix
  worker_instances_prefix     = var.worker_instances_prefix
  vpc_id                      = module.vpc_network.vpc_id
  subnetwork_id               = module.subnet_network.subnetwork_id
  zone                        = var.zone
  depends_on                  = [module.firewall]
}
