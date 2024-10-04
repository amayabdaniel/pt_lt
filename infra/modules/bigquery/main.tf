# infra/modules/bigquery/main.tf

resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.bigquery_dataset_id
  project    = var.project_id
  location   = var.region
}

resource "google_bigquery_table" "table" {
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  table_id   = var.bigquery_table_id
  project    = var.project_id
  schema = var.bigquery_schema
}
