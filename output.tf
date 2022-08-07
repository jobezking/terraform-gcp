<<<<<<< HEAD
output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "project_id" {
  value       = var.project_id
  description = "GCloud Project ID"
}

output "ip" {
  value = google_compute_address.vm_static_ip.address
}
=======
output "ip" {
  value = google_compute_address.vm_static_ip.address
}
>>>>>>> 0c336ed2e9eb072df7108fa10549dd372945463b
