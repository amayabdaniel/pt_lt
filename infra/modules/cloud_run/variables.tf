variable "project_id" {
  description = "El ID del proyecto de GCP."
  type        = string
}

variable "region" {
  description = "La región de GCP."
  type        = string
}

variable "cloud_run_service_name" {
  description = "Nombre del servicio de Cloud Run."
  type        = string
}

variable "docker_image" {
  description = "Imagen de Docker para el servicio de Cloud Run."
  type        = string
}

variable "bigquery_dataset" {
  description = "ID del dataset de BigQuery."
  type        = string
}

variable "bigquery_table" {
  description = "ID de la tabla de BigQuery."
  type        = string
}

variable "pubsub_topic" {
  description = "Nombre del tópico de Pub/Sub."
  type        = string
}

variable "app_secret" {
  description = "Clave secreta para la aplicación."
  type        = string
  sensitive   = true
}
