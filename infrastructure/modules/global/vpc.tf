variable "env_preffix" {}
variable "private_subnet_1" {}
variable "public_subnet_1" {}
variable "region_name" {}

resource "google_compute_network" "vpc" {
  name          =  format("%s","${var.env_preffix}-vpc")
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

resource "google_compute_firewall" "allow-internal" {
  name    = "${var.env_preffix}-fw-allow-internal"
  network = google_compute_network.vpc.name
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
  source_ranges = [
    var.private_subnet_1,
    var.public_subnet_1,
  ]
}

resource "google_compute_firewall" "allow-http" {
  name    = "${var.env_preffix}-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags = ["http"] 
}

resource "google_compute_firewall" "allow-bastion" {
  name    = "${var.env_preffix}-fw-allow-bastion"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh"]
}

resource "google_compute_firewall" "allow-postgres" {
  name    = "${var.env_preffix}-fw-allow-postgres"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["5432"]
  }
  target_tags = ["postgres"]
}




resource "google_compute_subnetwork" "public_subnet1" {
  name          = "${var.env_preffix}-devnetwork-pub1-net"
  ip_cidr_range = var.public_subnet_1
  network       = google_compute_network.vpc.id
  region        = var.region_name
}
resource "google_compute_subnetwork" "private_subnet1" {
  name          = "${var.env_preffix}-devnetwork-priv1-net"
  ip_cidr_range = var.private_subnet_1
  network       = google_compute_network.vpc.id
  region        = var.region_name
}



output "vpc_id" {
  value = google_compute_network.vpc.id
}
output "public_subnet1_id" {
  value = google_compute_subnetwork.public_subnet1.id
}
output "private_subnet1_id" {
  value = google_compute_subnetwork.private_subnet1.id
}
