provider "google" {
	credentials = file("/home/jeking/Desktop/terraform-auth/terraform-gcp-77.json")
	project = var.project_id
    region = var.region
    zone =  var.zone
}