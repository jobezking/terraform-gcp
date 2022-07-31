# Create Google App Engine

resource "google_project"  "my_project" {
	name = var.project_name
	project_id = var.project_id
	#org_id = "1234567"
}
resource "google_app_engine_application"  "app" {
	project = google_project.my_project.project_id
	location_id = var.location
}
