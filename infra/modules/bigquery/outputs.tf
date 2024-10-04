output "bigquery_dataset_id" {
  description = "El ID del dataset de BigQuery."
  value       = google_bigquery_dataset.dataset.dataset_id
}

output "bigquery_table_id" {
  description = "El ID de la tabla de BigQuery."
  value       = google_bigquery_table.table.table_id
}
