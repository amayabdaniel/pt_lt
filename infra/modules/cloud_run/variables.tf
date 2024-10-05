variable "project_id" {
  type        = string
  description = "ID del proyecto de GCP"
}

variable "region" {
  type        = string
  description = "Región de despliegue"
}

variable "api_service_name" {
  type        = string
  description = "Nombre del servicio de la API"
}

variable "subscriber_service_name" {
  type        = string
  description = "Nombre del servicio del suscriptor"
}

variable "api_docker_image" {
  type        = string
  description = "URL de la imagen Docker de la API"
}

variable "subscriber_docker_image" {
  type        = string
  description = "URL de la imagen Docker del suscriptor"
}

variable "pubsub_subscription_name" {
  type        = string
  description = "Nombre de la suscripción de Pub/Sub"
}

variable "bigquery_dataset" {
  type        = string
  description = "Dataset de BigQuery"
}

variable "bigquery_table" {
  type        = string
  description = "Tabla de BigQuery"
}
