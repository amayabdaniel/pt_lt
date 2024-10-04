# infra/modules/pubsub/variables.tf

variable "project_id" {
  description = "El ID del proyecto de GCP."
  type        = string
}

variable "region" {
  description = "La región de GCP."
  type        = string
}

variable "pubsub_topic_name" {
  description = "Nombre del tópico de Pub/Sub."
  type        = string
}

variable "pubsub_subscription_name" {
  description = "Nombre de la suscripción de Pub/Sub."
  type        = string
}
