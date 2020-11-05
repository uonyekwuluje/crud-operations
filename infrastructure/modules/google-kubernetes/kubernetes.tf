variable "cluster_name" {}
variable "project_id" {}
variable "kubernetes_version" {}

resource "google_container_cluster" "demo_cluster" {
  project  = var.project_id 
  name     = var.cluster_name
  location = "us-east1-b"

  min_master_version = var.kubernetes_version

  # Enable Alias IPs to allow Windows Server networking.
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/14"
    services_ipv4_cidr_block = "/20"
  }

  # Removes the implicit default node pool, recommended when using
  # google_container_node_pool.
  remove_default_node_pool = true
  initial_node_count = 1
}

# Small Linux node pool to run some Linux-only Kubernetes Pods.
resource "google_container_node_pool" "linux_pool" {
  name               = "linux-pool"
  project            = google_container_cluster.demo_cluster.project
  cluster            = google_container_cluster.demo_cluster.name
  location           = google_container_cluster.demo_cluster.location
  node_count         = 2

  node_config {
    #machine_type = "e2-standard-4"
    machine_type = "n1-standard-1"
    image_type   = "COS_CONTAINERD"
  }
}
