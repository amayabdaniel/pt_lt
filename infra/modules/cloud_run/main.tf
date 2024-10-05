resource "google_cloud_run_service" "api_service" {
  name     = var.api_service_name
  location = var.region
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.api_docker_image
        ports {
          container_port = 8080
        }
        env {
          name  = "PROJECT_ID"
          value = var.project_id
        }
        env {
          name  = "BIGQUERY_DATASET"
          value = var.bigquery_dataset
        }
        env {
          name  = "BIGQUERY_TABLE"
          value = var.bigquery_table
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service" "subscriber_service" {
  name     = var.subscriber_service_name
  location = var.region
  project  = var.project_id

  template {
    spec {
      containers {
        image = var.subscriber_docker_image
        env {
          name  = "PROJECT_ID"
          value = var.project_id
        }
        env {
          name  = "SUBSCRIPTION_NAME"
          value = var.pubsub_subscription_name
        }
        env {
          name  = "BIGQUERY_DATASET"
          value = var.bigquery_dataset
        }
        env {
          name  = "BIGQUERY_TABLE"
          value = var.bigquery_table
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_binding" "api_allow_all" {
  service  = google_cloud_run_service.api_service.name
  location = var.region
  role     = "roles/run.invoker"

  members = ["allUsers"]
}