resource "google_compute_network" "main_vpc_network" {
  name    = var.vpc_name
  auto_create_subnetworks = false
}