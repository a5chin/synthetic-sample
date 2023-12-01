variable "project_id" {
  description = "The ID of Google Cloud Platform"
  type        = string
}

variable "location" {
  description = "The location of the resource"
  type        = string
}

variable "synthetic_settings" {
  description = "Settings for Synthetic Monitoring"
}

variable "run_info" {
  description = "Infomation of the Cloud Run"
  type = object({
    name    = string
    invoker = string
    uri     = string
  })
}
