output "kali_ip" {
  value = google_compute_instance.kali.network_interface[0].access_config[0].nat_ip
}

output "vulnweb_ip" {
  value = google_compute_instance.vulnweb.network_interface[0].access_config[0].nat_ip
}
