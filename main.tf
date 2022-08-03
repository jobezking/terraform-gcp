# Create Google App Engine

#resource "google_project"  "my_project" {
#	name = var.project_name
#	project_id = var.project_id
#	#org_id = "1234567"
#}
resource "google_app_engine_application"  "app" {
	project = var.project_id
	location_id = var.location
  feature_settings {
    split_health_checks = true
  }
}

#resource "google_service_account" "default" {
 # account_id   = "service_account_id"
 # display_name = "Service Account"
#}

resource "google_compute_instance" "default" {
  name         = "test-arm-2"
  machine_type = "t2a-standard-1"
  zone         = var.arm-zone

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11-bullseye-arm64-v20220719"
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

 # service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
   # email  = google_service_account.default.email
  #  scopes = ["cloud-platform"]
 # }
}