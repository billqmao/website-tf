terraform {
  #Remote backend is disabled temporarily for bootstrap
  #backend "gcs" {
  #  bucket = var.tfstate_bucket
  #  prefix = "terraform/state"
  #}

  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

#TFstate bucket
resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "default" {
  name          = "${random_id.bucket_prefix.hex}-bmao-bucket-tfstate"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }
}