variable "network_self_link" {} 
variable "env_preffix" {}
variable "subnet_id" {}
variable "server_name" {}
variable "username" {}


resource "google_compute_instance" "default" {
  for_each      = toset(var.server_name)
  name          = lower(each.key)
  machine_type  = "n1-standard-1"
  zone          = "us-east1-b"
  tags          = ["ssh","http"]
  boot_disk {
    initialize_params {
      image     =  "centos-7-v20180129"     
    }
  }

  metadata = {
    sshKeys = "${var.username}:${file("~/.ssh/id_rsa.pub")}"
  }

  network_interface {
    subnetwork = var.subnet_id 
    access_config {
      // Ephemeral IP
    }
  }
}

output "public_ip" {
   value = [for public_ip in google_compute_instance.default: public_ip.network_interface.0.access_config.0.nat_ip]
}
