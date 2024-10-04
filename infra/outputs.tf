output "pubsub_topic" {
  description = "El nombre del tópico de Pub/Sub."
  value       = module.pubsub.pubsub_topic_name
}

output "pubsub_subscription" {
  description = "El nombre de la suscripción de Pub/Sub."
  value       = module.pubsub.pubsub_subscription_name
}

output "bigquery_dataset" {
  description = "El ID del dataset de BigQuery."
  value       = module.bigquery.bigquery_dataset_id
}

output "bigquery_table" {
  description = "El ID de la tabla de BigQuery."
  value       = module.bigquery.bigquery_table_id
}

output "cloud_run_service_url" {
  description = "La URL del servicio de Cloud Run desplegado."
  value       = module.cloud_run.cloud_run_url
}