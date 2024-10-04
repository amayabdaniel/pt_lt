# infra/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}

# Módulo: Pub/Sub
module "pubsub" {
  source = "./modules/pubsub"

  project_id               = var.project_id
  region                   = var.region
  pubsub_topic_name        = var.pubsub_topic_name
  pubsub_subscription_name = var.pubsub_subscription_name
}

# Módulo: BigQuery
module "bigquery" {
  source = "./modules/bigquery"

  project_id          = var.project_id
  region              = var.region
  bigquery_dataset_id = var.bigquery_dataset_id
  bigquery_table_id   = var.bigquery_table_id
  bigquery_schema     = var.bigquery_schema
}

# Módulo: Cloud Run
module "cloud_run" {
  source = "./modules/cloud_run"

  project_id             = var.project_id
  region                 = var.region
  cloud_run_service_name = var.cloud_run_service_name
  docker_image           = var.docker_image
  bigquery_dataset       = module.bigquery.bigquery_dataset_id
  bigquery_table         = module.bigquery.bigquery_table_id
  pubsub_topic           = module.pubsub.pubsub_topic_name
  app_secret             = var.app_secret
}