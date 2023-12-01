data "archive_file" "main" {
  type        = "zip"
  source_dir  = "${path.module}/src/"
  output_path = "tmp/${var.synthetic_settings.functions.file_name}"
}

resource "google_storage_bucket_object" "main" {
  name   = "${var.synthetic_settings.functions.file_name}"
  source = data.archive_file.main.output_path
  bucket = var.synthetic_settings.functions.bucket_name
}
