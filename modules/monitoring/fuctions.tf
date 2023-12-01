resource "google_cloudfunctions2_function" "synthetic_monitoring" {
  name     = var.synthetic_settings.functions.name

  location = var.location
  project  = var.project_id

  build_config {
    runtime     = "nodejs20"
    entry_point = "SyntheticFunction"
    source {
      storage_source {
        bucket = google_storage_bucket_object.main.bucket
        object = google_storage_bucket_object.main.name
      }
    }
  }

  service_config {
    max_instance_count    = var.synthetic_settings.functions.max_instance_count
    available_memory      = var.synthetic_settings.functions.memory
    timeout_seconds       = var.synthetic_settings.functions.timeout
    service_account_email = var.run_info.invoker
    environment_variables = {
      BASE_URL = var.run_info.uri
    }
  }
}
