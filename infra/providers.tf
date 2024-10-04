terraform {
  backend "gcs" {
    bucket = "tfstate_pt_lt"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.5.0"
    }
  }
}
