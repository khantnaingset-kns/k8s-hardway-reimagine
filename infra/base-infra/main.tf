module "vpc_network" {
  source       = "./vpc"
  vpc_name     = var.vpc_name
}

module "subnet_network" {
  source      = "./subnet"
  subnet_name = var.subnet_name
  region      = var.region
  vpc_id      = module.vpc_network.vpc_id
  subnet_ipcidr_range = var.subnet_ipcidr_range
  depends_on  = [module.vpc_network]
}
