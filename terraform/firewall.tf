# See https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall.
resource "google_compute_firewall" "hapinet-allow-ssh" {
  name    = "hapinet-allow-ssh"
  network = google_compute_network.hapinet.name

  allow {
    protocol = "tcp"
    ports    = ["22", "443"]
  }

  source_ranges = ["107.136.159.0/24", "172.177.0.0/16"]
}

resource "google_compute_firewall" "hapinet-allow-icmp" {
  name    = "hapinet-allow-icmp"
  network = google_compute_network.hapinet.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "hapinet-allow-internal" {
  name    = "hapinet-allow-internal"
  network = google_compute_network.hapinet.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = ["10.128.0.0/9"]
}
