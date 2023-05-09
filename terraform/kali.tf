# See https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance.
resource "google_compute_instance" "kali" {
  name         = "kali"
  machine_type = "e2-standard-2"
  metadata = {
    "serial-port-enable" = "false"
    "ssh-keys"           = var.ssh-keys
  }

  boot_disk {
    initialize_params {
      image = "kali-linux-2023-1-cloud-genericcloud-amd64"
      size  = 22
    }
  }

  network_interface {
    network = google_compute_network.hapinet.name
    access_config {
    }
  }
}
