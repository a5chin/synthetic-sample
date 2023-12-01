variable "project_id" {
  description = "The ID of Google Cloud Platform"
  type        = string
}

variable "location" {
  description = "The location of the resource"
  type        = string
}

variable "run" {
  description = "Settings for Cloud Run"
  type = object({
    name               = string
    image              = string
    max_instance_count = optional(number, 1)
    min_instance_count = optional(number, 1)
    cpu                = optional(string, "1")
    memory             = optional(string, "512Mi")
  })
}

variable "synthetic_settings" {
  description = "Settings for Synthetic Monitoring"
  type = object({
    monitoring = object({
      name    = string
      period  = optional(string, "60s")
      timeout = optional(string, "60s")
    })
    functions = object({
      name               = string
      bucket_name        = string
      file_name          = string
      max_instance_count = optional(number, 1)
      memory             = optional(string, "256M")
      timeout            = optional(number, 60)
    })
  })
}
