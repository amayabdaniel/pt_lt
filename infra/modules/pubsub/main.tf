resource "google_pubsub_topic" "topic" {
  name    = var.pubsub_topic_name
  project = var.project_id
}

resource "google_pubsub_subscription" "subscription" {
  name  = var.pubsub_subscription_name
  topic = google_pubsub_topic.topic.name
  project = var.project_id
}
