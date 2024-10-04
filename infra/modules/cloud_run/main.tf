# infra/modules/cloud_run/main.tf

resource "google_cloud_run_service" "service" {
  name     = var.cloud_run_service_name
  location = var.region
  project  = var.project_id

  metadata {
    labels = {
      environment = "production"
    }
  }

  template {
    spec {
      containers {
        image = var.docker_image

        ports {
          container_port = 8080
        }

        env {
          name  = "BIGQUERY_DATASET"
          value = var.bigquery_dataset
        }

        env {
          name  = "BIGQUERY_TABLE"
          value = var.bigquery_table
        }

        env {
          name  = "PUBSUB_TOPIC"
          value = var.pubsub_topic
        }

        env {
          name  = "APP_SECRET"
          value = var.app_secret
        }

        #límites de recursos, sondas de liveness/readiness, etc.
      }
    }
  }

  autogenerate_revision_name = true

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_binding" "allow_all" {
  service  = google_cloud_run_service.service.name
  location = google_cloud_run_service.service.location
  project  = google_cloud_run_service.service.project
  role     = "roles/run.invoker"

  members = ["allUsers"]
}