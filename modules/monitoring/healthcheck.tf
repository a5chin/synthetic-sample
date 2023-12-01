resource "google_monitoring_uptime_check_config" "synthetic_monitoring" {
  display_name = var.synthetic_settings.monitoring.name

  period  = var.synthetic_settings.monitoring.period
  timeout = var.synthetic_settings.monitoring.timeout

  synthetic_monitor {
    cloud_function_v2 {
      name = google_cloudfunctions2_function.synthetic_monitoring.id
    }
  }
}
