resource "google_compute_firewall" "internal" {
  name    = var.internal_firewall_name
  network = var.vpc_id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  source_ranges = [var.subnet_ipcidr_range]

}


resource "google_compute_firewall" "external" {
  name    = var.external_firewall_name
  network = var.vpc_id

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "6443"]
  }

  source_ranges = ["0.0.0.0/0"]

}
