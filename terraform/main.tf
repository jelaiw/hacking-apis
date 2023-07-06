terraform {
  cloud {
    organization = "student88"
    workspaces {
      name = "hapi-lab"
    }
  }

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
  credentials = var.gcp_creds
}

resource "google_compute_network" "hapinet" {
  name = "hapinet"
}
