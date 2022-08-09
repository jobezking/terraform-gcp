resource "google_service_account" "compute" {
    account_id = "terraform-gcp-77-compute0"
    display_name = "Compute Service Account"
}

resource "google_service_account" "gke" {
    account_id = "terraform-gcp-77-gke0"
    display_name = "Compute Service Account"
}