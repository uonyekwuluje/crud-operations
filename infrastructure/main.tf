provider "google" {
  credentials = file("~/.ssh/CREDENTIALS_FILE.json")
  project     = var.var_project
  region      = "us-east1"
}



module "vpc" {
  source = "./modules/global" 
  env_preffix      = var.env_preffix
  region_name      = var.region_name
  public_subnet_1  = var.public_subnet_1
  private_subnet_1 = var.private_subnet_1
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet1_id" {
  value = module.vpc.public_subnet1_id
}
output "private_subnet1_id" {
  value = module.vpc.private_subnet1_id
}




module "pub_vm" {
  source                = "./modules/google-virtualmachine"
  server_name           = var.public_facing_servers
  network_self_link     = module.vpc.vpc_id
  env_preffix           = var.env_preffix
  username              = var.username
  subnet_id             = module.vpc.public_subnet1_id
}
output "pub_vm_pubip" {
  value = module.pub_vm.public_ip
}



module "kubernetes" {
  source                = "./modules/google-kubernetes"
  project_id            = var.var_project
  cluster_name          = var.kubernetes_cluster_name
  kubernetes_version    = var.kubernetes_version
}





#module "project_db" {
#  source                = "./modules/google-postgres"
#  network_self_link     = module.vpc.vpc_id
#  env_preffix           = var.env_preffix
#  subnet_id             = module.vpc.public_subnet1_id
#  region                = var.region_name
#}

