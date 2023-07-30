variable "project" {
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "codespaces_ip" {
  type = string
  description = "The GitHub-issued IP address for this dev container."
}
