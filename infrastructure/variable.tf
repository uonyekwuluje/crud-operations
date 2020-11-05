variable "var_project" {}
variable "env_preffix" {}
variable "username" {}

variable "region_name" {
   default = "us-east1"
}

variable "public_subnet_1" {
   default = "10.26.2.0/24"
}

variable "private_subnet_1" {
   default = "10.26.1.0/24"
}

variable "public_facing_servers" {}

variable "kubernetes_cluster_name" {
  default = "projectk81"
}

variable "kubernetes_version" {
  default = "1.17"
}
