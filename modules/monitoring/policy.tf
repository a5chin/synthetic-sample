resource "google_monitoring_alert_policy" "uptime" {
  display_name = "${var.run_info.name} uptime failure"
  user_labels  = {}
  conditions {
    display_name = "Failure of uptime ${var.run_info.name}"
    condition_threshold {
      filter = "resource.type = \"cloud_run_revision\" AND resource.labels.service_name = \"${google_cloudfunctions2_function.synthetic_monitoring.name}\" AND metric.type = \"monitoring.googleapis.com/uptime_check/check_passed\""
      aggregations {
        alignment_period     = var.synthetic_settings.monitoring.period
        cross_series_reducer = "REDUCE_COUNT_FALSE"
        per_series_aligner   = "ALIGN_NEXT_OLDER"
      }
      duration = "0s"
      trigger {
        count = 1
      }
      threshold_value = 1
      comparison      = "COMPARISON_GT"
    }
  }
  alert_strategy {
    auto_close = "604800s"
  }
  combiner = "OR"
  enabled  = "true"
}
