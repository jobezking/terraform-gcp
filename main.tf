# Create Google App Engine

#resource "google_project"  "my_project" {
#	name = var.project_name
#	project_id = var.project_id
#	#org_id = "1234567"
#}
#resource "google_app_engine_application"  "test-app" {
	#project = var.project_id
	#location_id = var.location
  #feature_settings {
    #split_health_checks = true
  #}
#}

resource "google_compute_instance" "default" {
  name         = "test-arm"
  machine_type = var.arm-machine-type
  zone         = var.arm-zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = var.arm-image
    }
  }

  // Local SSD disk
 # scratch_disk {
   # interface = "SCSI"
  #}

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"

 service_account {
    #Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
   email  = google_service_account.compute.email
   scopes = ["cloud-platform"]
 }
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.zone
  #node_locations = [ var.arm-zone-2, ]  only use for multi-zonal
  
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes

  node_config {
    service_account = google_service_account.gke.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = var.machine-type
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}