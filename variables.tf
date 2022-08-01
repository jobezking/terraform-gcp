variable "project_name" {
    description = "Google Cloud Platform Project Name"
    type = string
    default = "terraform-gcp-77"
}
variable "project_id" {
    description = "Google Cloud Platform Project ID"
    type = string
}

variable "location" {
    type = string
}

variable "region" {
    type = string
}

variable "zone" {
    type = string
    default = "us-east1-c"
}