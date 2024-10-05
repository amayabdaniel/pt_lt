resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.bigquery_dataset_id
  project    = var.project_id
  location   = var.region
}

resource "google_bigquery_table" "table" {
  table_id   = var.bigquery_table_id
  dataset_id = google_bigquery_dataset.dataset.dataset_id
  project    = var.project_id

  schema = <<EOF
[
  {
    "name": "id",
    "type": "STRING",
    "mode": "REQUIRED"
  },
  {
    "name": "timestamp",
    "type": "TIMESTAMP",
    "mode": "REQUIRED"
  },
  {
    "name": "data",
    "type": "STRING",
    "mode": "NULLABLE"
  }
]
EOF
}
