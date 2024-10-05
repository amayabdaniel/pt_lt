# infra/variables.tf

variable "project_id" {
  type        = string
  description = "ID del proyecto de GCP"
}

variable "region" {
  type        = string
  description = "Región de despliegue"
}

# Pub/Sub Variables
variable "pubsub_topic_name" {
  type        = string
  description = "Nombre del tópico de Pub/Sub"
}

variable "pubsub_subscription_name" {
  type        = string
  description = "Nombre de la suscripción de Pub/Sub"
}

# BigQuery Variables
variable "bigquery_dataset_id" {
  type        = string
  description = "ID del dataset de BigQuery"
}

variable "bigquery_table_id" {
  type        = string
  description = "ID de la tabla de BigQuery"
}

# Cloud Run Variables
variable "api_service_name" {
  type        = string
  description = "Nombre del servicio de Cloud Run para la API"
}

variable "subscriber_service_name" {
  type        = string
  description = "Nombre del servicio de Cloud Run para el suscriptor"
}

variable "api_docker_image" {
  type        = string
  description = "URL de la imagen Docker de la API en Container Registry"
}

variable "subscriber_docker_image" {
  type        = string
  description = "URL de la imagen Docker del suscriptor en Container Registry"
}

variable "app_secret" {
  type        = string
  description = "Clave secreta para la aplicación"
}
