# See https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance.
resource "google_compute_instance" "vulnweb" {
  name         = "vulnweb"
  machine_type = "e2-standard-2"
  metadata = {
    "serial-port-enable" = "false"
    "ssh-keys"           = var.vulnweb-ssh-keys
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.hapinet.name
    access_config {
    }
  }
}
