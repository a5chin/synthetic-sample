terraform {
  backend "gcs" {
    bucket = "synthetic-tfstate"
  }
}
