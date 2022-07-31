output "id" {
    value = google_app_engine_application.app.id
}

output "app_id" {
    value = google_app_engine_application.app.app_id
}

output "name" {
    value = google_app_engine_application.app.name
}

output "code_bucket" {
    value = google_app_engine_application.app.code_bucket
}

output "default_bucket" {
    value = google_app_engine_application.app.default_bucket
}

output "default_hostname" {
    value = google_app_engine_application.app.default_hostname
    sensitive = false
}