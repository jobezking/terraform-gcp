#output "region" {
#  value       = var.region
#  description = "GCloud Region"
#}

#output "project_id" {
#  value       = var.project_id
#  description = "GCloud Project ID"
#}

output "ip" {
  value = google_compute_address.vm_static_ip.address
}

output "kubernetes_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}

output "network_ip" {
  value = google_compute_instance.default.network_interface[0].network_ip
}

output "nat_ip" {
  value = google_compute_instance.default.network_interface[0].access_config[0].nat_ip
}

output "email" {
  value = google_compute_instance.default.service_account[0].email
}