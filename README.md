## Overview
Tinker with infrastructure-as-code (Terraform with Ansible playbooks) for a basic "hacking APIs" virtual lab.

Initially tried plain old dev container and got far with Docker-in-Docker, but did not work quite well enough for our use case.

## Quick Start
1. Provision resources.
```sh
$ cd terraform/
$ terraform version
Terraform v1.7.5
on linux_amd64
+ provider registry.terraform.io/hashicorp/google v4.51.0
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of hashicorp/google from the dependency lock file
- Installing hashicorp/google v4.51.0...
- Installed hashicorp/google v4.51.0 (signed by HashiCorp)

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_compute_firewall.hapinet-allow-icmp will be created
  + resource "google_compute_firewall" "hapinet-allow-icmp" {
      + creation_timestamp = (known after apply)
      + destination_ranges = (known after apply)
      + direction          = (known after apply)
      + enable_logging     = (known after apply)
      + id                 = (known after apply)
      + name               = "hapinet-allow-icmp"
      + network            = "hapinet"
      + priority           = 1000
      + project            = (known after apply)
      + self_link          = (known after apply)
      + source_ranges      = [

--- SNIP ---

  # google_compute_network.hapinet will be created
  + resource "google_compute_network" "hapinet" {
      + auto_create_subnetworks         = true
      + delete_default_routes_on_create = false
      + gateway_ipv4                    = (known after apply)
      + id                              = (known after apply)
      + internal_ipv6_range             = (known after apply)
      + mtu                             = (known after apply)
      + name                            = "hapinet"
      + project                         = (known after apply)
      + routing_mode                    = (known after apply)
      + self_link                       = (known after apply)
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + kali_ip        = (known after apply)
  + vulnweb_int_ip = (known after apply)
  + vulnweb_ip     = (known after apply)

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_compute_network.hapinet: Creating...
google_compute_network.hapinet: Still creating... [10s elapsed]
google_compute_network.hapinet: Still creating... [20s elapsed]
google_compute_network.hapinet: Still creating... [30s elapsed]
google_compute_network.hapinet: Still creating... [40s elapsed]
google_compute_network.hapinet: Still creating... [50s elapsed]
google_compute_network.hapinet: Creation complete after 53s [id=projects/hapi-lab/global/networks/hapinet]
google_compute_firewall.hapinet-allow-icmp: Creating...
google_compute_instance.kali: Creating...
google_compute_instance.vulnweb: Creating...
google_compute_firewall.hapinet-allow-internal: Creating...
google_compute_firewall.hapinet-allow-ssh: Creating...
google_compute_firewall.hapinet-allow-icmp: Still creating... [10s elapsed]
google_compute_firewall.hapinet-allow-internal: Still creating... [10s elapsed]
google_compute_instance.vulnweb: Still creating... [10s elapsed]
google_compute_instance.kali: Still creating... [10s elapsed]
google_compute_firewall.hapinet-allow-ssh: Still creating... [10s elapsed]
google_compute_firewall.hapinet-allow-icmp: Creation complete after 11s [id=projects/hapi-lab/global/firewalls/hapinet-allow-icmp]
google_compute_firewall.hapinet-allow-internal: Creation complete after 11s [id=projects/hapi-lab/global/firewalls/hapinet-allow-internal]
google_compute_firewall.hapinet-allow-ssh: Creation complete after 11s [id=projects/hapi-lab/global/firewalls/hapinet-allow-ssh]
google_compute_instance.vulnweb: Creation complete after 14s [id=projects/hapi-lab/zones/us-central1-c/instances/vulnweb]
google_compute_instance.kali: Still creating... [20s elapsed]
google_compute_instance.kali: Still creating... [30s elapsed]
google_compute_instance.kali: Still creating... [40s elapsed]
google_compute_instance.kali: Still creating... [50s elapsed]
google_compute_instance.kali: Still creating... [1m0s elapsed]
google_compute_instance.kali: Still creating... [1m10s elapsed]
google_compute_instance.kali: Still creating... [1m20s elapsed]
google_compute_instance.kali: Still creating... [1m30s elapsed]
google_compute_instance.kali: Still creating... [1m40s elapsed]
google_compute_instance.kali: Still creating... [1m50s elapsed]
google_compute_instance.kali: Still creating... [2m0s elapsed]
google_compute_instance.kali: Creation complete after 2m5s [id=projects/hapi-lab/zones/us-central1-c/instances/kali]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:

kali_ip = "35.192.220.160"
vulnweb_int_ip = "10.128.0.3"
vulnweb_ip = "34.69.86.9"
$
```

2. Verify expected configuration.
```sh
$ cd ansible/
$ ./update-inventory.sh 
/workspaces/hapi-lab/ansible
$ ansible -m ping -i hosts all
vulnweb | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
kali | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
$
```

## References
1. "Hacking APIs: Breaking Web Application Programming Interfaces". Ball, CJ. No Starch Press, 2022.
1. Supplementary material. https://github.com/hAPI-hacker/Hacking-APIs.
1. Dev Container specification. https://containers.dev/.
1. GitHub Codespaces documentation. https://docs.github.com/en/codespaces/overview.
1. Terraform documentation. https://developer.hashicorp.com/terraform/docs.
1. Ansible community documentation. https://docs.ansible.com/.
