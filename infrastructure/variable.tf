variable "var_project" {}
variable "env_preffix" {}

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
