output "pubsub_topic_name" {
  description = "El nombre del tópico de Pub/Sub."
  value       = google_pubsub_topic.topic.name
}

output "pubsub_subscription_name" {
  description = "El nombre de la suscripción de Pub/Sub."
  value       = google_pubsub_subscription.subscription.name
}
