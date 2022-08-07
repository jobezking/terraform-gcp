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

variable "arm-location" {
    type = string
    default = "us-central1"
}

variable "arm-region" {
    type = string
    default = "us-central1"
}

variable "arm-zone" {
    type = string
    default = "us-central1-f"
}

variable "arm-image" {
  default = "debian-cloud/debian-11-bullseye-arm64-v20220719"
}

variable "arm-machine-type" {
  default = "t2a-standard-1"
}