resource "google_cloud_run_v2_service" "main" {
  name     = var.run.name
  location = var.location

  template {
    scaling {
      max_instance_count = var.run.max_instance_count
      min_instance_count = var.run.min_instance_count
    }

    containers {
      image = var.run.image

      resources {
        limits = {
          cpu    = var.run.cpu
          memory = var.run.memory
        }
      }
    }
  }
}
