resource "google_monitoring_dashboard" "synthetic_monitoring" {
  dashboard_json = <<EOF
{
  "displayName": "Failure of uptime ${var.run_info.name}",
  "gridLayout": {
    "columns": "1",
    "widgets": [
      {
        "title": "Synthetic Monitoring",
        "alertChart": {
          "name": "${google_monitoring_alert_policy.uptime.name}"
        }
      }
    ]
  }
}
EOF
}
