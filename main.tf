# Create Google App Engine

#resource "google_project"  "my_project" {
#	name = var.project_name
#	project_id = var.project_id
#	#org_id = "1234567"
#}
resource "google_app_engine_application"  "app-arm" {
	project = var.project_id
	#location_id = var.location
  location_id = "us-central"
  feature_settings {
    split_health_checks = true
  }

#resource "google_service_account" "default" {
 # account_id   = "service_account_id"
 # display_name = "Service Account"
#}

resource "google_compute_instance" "default" {
  name         = "test-arm"
  machine_type = "t2a-standard-1"
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
   email  = google_service_account.default.email
   scopes = ["cloud-platform"]
 }

 resource "google_compute_address" "vm_static_ip" {
   name = "terraform-static-ip"
 }
}