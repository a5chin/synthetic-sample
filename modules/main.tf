locals {
  run_info = {
    name    = google_cloud_run_v2_service.main.name
    invoker = google_service_account.synthetic_monitoring.email
    uri     = google_cloud_run_v2_service.main.uri
  }
}

module "synthetic_monitoring" {
  source             = "./monitoring"
  project_id         = var.project_id
  location           = var.location

  synthetic_settings = var.synthetic_settings
  run_info           = local.run_info
}
