module "synthetic" {
  source = "../../modules"

  project_id = var.project_id
  location   = var.location

  run                = var.run
  synthetic_settings = var.synthetic_settings
}
