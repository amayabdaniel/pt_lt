# infra/variables.tf

variable "project_id" {
  description = "El ID del proyecto de GCP."
  type        = string
}

variable "region" {
  description = "La región de GCP donde se desplegarán los recursos."
  type        = string
  default     = "us-central1"
}

# Variables Pub/Sub
variable "pubsub_topic_name" {
  description = "Nombre del tópico de Pub/Sub."
  type        = string
  default     = "data-ingestion-topic"
}

variable "pubsub_subscription_name" {
  description = "Nombre de la suscripción de Pub/Sub."
  type        = string
  default     = "data-ingestion-subscription"
}

# Variables BigQuery
variable "bigquery_dataset_id" {
  description = "ID del dataset de BigQuery."
  type        = string
  default     = "analytics_dataset"
}

variable "bigquery_table_id" {
  description = "ID de la tabla de BigQuery."
  type        = string
  default     = "analytics_table"
}

variable "bigquery_schema" {
  description = "Esquema de la tabla de BigQuery en formato JSON."
  type        = string
  default     = <<EOF
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

# Variables Cloud Run
variable "cloud_run_service_name" {
  description = "Nombre del servicio de Cloud Run."
  type        = string
}

variable "docker_image" {
  description = "Imagen de Docker para el servicio de Cloud Run."
  type        = string
}

variable "app_secret" {
  description = "Clave secreta para la aplicación."
  type        = string
  sensitive   = true
}
