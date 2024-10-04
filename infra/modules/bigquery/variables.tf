# infra/modules/bigquery/variables.tf

variable "project_id" {
  description = "El ID del proyecto de GCP."
  type        = string
}

variable "region" {
  description = "La región de GCP."
  type        = string
}

variable "bigquery_dataset_id" {
  description = "ID del dataset de BigQuery."
  type        = string
}

variable "bigquery_table_id" {
  description = "ID de la tabla de BigQuery."
  type        = string
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
