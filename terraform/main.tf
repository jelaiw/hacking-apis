terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "hapinet" {
  name = "hapinet"
}

# See https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance.
resource "google_compute_instance" "kali" {
  name         = "kali"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "kali-linux-2023-1-cloud-genericcloud-amd64"
    }
  }

  network_interface {
    network = google_compute_network.hapinet.name
    access_config {
    }
  }
}