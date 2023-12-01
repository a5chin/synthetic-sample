variable "project_id" {
  description = "The ID of Google Cloud Platform"
  type        = string
}

variable "location" {
  description = "The location of the resource"
  type        = string
  default     = "us-central1"
}

variable "run" {
  description = "Settings for Cloud Run"
  default = {
    name  = "hello-sample"
    image = "us-docker.pkg.dev/cloudrun/container/hello"
  }
}

variable "synthetic_settings" {
  description = "Settings for Synthetic Monitoring"
  default = {
    monitoring = {
      name = "healthcheck-monitoring"
    }
    functions = {
      name        = "healthcheck-monitoring"
      bucket_name = "synthetic-sample"
      file_name   = "functions.zip"
    }
  }
}
