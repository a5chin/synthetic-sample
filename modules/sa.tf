resource "google_service_account" "synthetic_monitoring" {
  project      = var.project_id
  account_id   = "synthetic-monitoring"
  display_name = "Cloud Run Invoker"
}

resource "google_cloud_run_v2_service_iam_member" "synthetic_monitoring" {
  project  = google_cloud_run_v2_service.main.project
  location = google_cloud_run_v2_service.main.location
  name     = google_cloud_run_v2_service.main.name
  role     = "roles/run.invoker"
  member   = "serviceAccount:${google_service_account.synthetic_monitoring.email}"
}
