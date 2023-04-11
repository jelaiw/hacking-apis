terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "hapi-lab"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "hapinet" {
  name = "hapinet"
}

resource "google_compute_instance" "kali" {
  name         = "kali"
  machine_type = "f1-micro"

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