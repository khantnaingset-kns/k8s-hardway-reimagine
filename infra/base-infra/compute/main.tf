
resource "google_compute_instance" "k8s_controllers" {
  count          = 3
  name           = "${var.controller_instances_prefix}-${count.index}"
  zone           = var.zone
  machine_type   = "e2-standard-2"
  can_ip_forward = true


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 200
    }
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnetwork_id
  }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }

  tags = ["controller", "control-plane", "k8s-hardway-reimagine"]

}


resource "google_compute_instance" "k8s_workers" {
  count          = 3
  name           = "${var.worker_instances_prefix}-${count.index}"
  zone           = var.zone
  machine_type   = "e2-standard-2"
  can_ip_forward = true


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 200
    }
  }

  network_interface {
    network    = var.vpc_id
    subnetwork = var.subnetwork_id
  }

  service_account {
    scopes = ["compute-rw", "storage-ro", "service-management", "service-control", "logging-write", "monitoring"]
  }

  metadata = {
    pod_cidr = "10.200.${count.index}.0/24"
  }

  tags = ["worker", "worker-node", "k8s-hardway-reimagine"]

}
