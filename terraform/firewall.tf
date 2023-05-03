# See https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall.
resource "google_compute_firewall" "hapinet-allow-ssh" {
  name    = "hapinet-allow-ssh"
  network = google_compute_network.hapinet.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "hapinet-allow-icmp" {
  name    = "hapinet-allow-icmp"
  network = google_compute_network.hapinet.name

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
