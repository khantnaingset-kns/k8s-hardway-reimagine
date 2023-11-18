resource "google_compute_subnetwork" "main_subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ipcidr_range
  region        = var.region
  network       = var.vpc_id
}
