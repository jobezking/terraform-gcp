provider "google" {
	credentials = file("testprep-terraform.json")
	project = var.project_id
    region = var.region
    zone =  var.zone
}