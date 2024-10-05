# infra/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}

module "pubsub" {
  source                   = "./modules/pubsub"
  project_id               = var.project_id
  region                   = var.region
  pubsub_topic_name        = var.pubsub_topic_name
  pubsub_subscription_name = var.pubsub_subscription_name
}

module "bigquery" {
  source              = "./modules/bigquery"
  project_id          = var.project_id
  region              = var.region
  bigquery_dataset_id = var.bigquery_dataset_id
  bigquery_table_id   = var.bigquery_table_id
}

module "cloud_run" {
  source                   = "./modules/cloud_run"
  project_id               = var.project_id
  region                   = var.region
  api_service_name         = var.api_service_name
  subscriber_service_name  = var.subscriber_service_name
  api_docker_image         = var.api_docker_image
  subscriber_docker_image  = var.subscriber_docker_image
  pubsub_subscription_name = var.pubsub_subscription_name
  bigquery_dataset         = var.bigquery_dataset_id
  bigquery_table           = var.bigquery_table_id
}
