provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project_id
  region      = var.region
}
resource "google_container_cluster" "myclusternew" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.region

  #remove_default_node_pool = true

  node_pool {
    name               = var.node_pool_name
    initial_node_count = var.node_count

    node_config {
      preemptible  = true
      machine_type = "e2-medium"
      disk_size_gb = 20
    }

    autoscaling {
      min_node_count = var.min_nodes
      max_node_count = var.max_nodes
    }
  }
}

