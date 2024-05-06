terraform {

  required_providers {
    google = {
      source = "hashicorp/google"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
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