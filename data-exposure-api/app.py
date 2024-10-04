# data-exposure-api/app.py

from fastapi import FastAPI
from google.cloud import bigquery
import os

app = FastAPI()

# Configurar variables de entorno
DATASET = os.getenv("BIGQUERY_DATASET")
TABLE = os.getenv("BIGQUERY_TABLE")

# Inicializar el cliente de BigQuery
client = bigquery.Client()

@app.get("/data")
def get_data():
    query = f"SELECT * FROM `{os.getenv('PROJECT_ID')}.{DATASET}.{TABLE}` LIMIT 100"
    query_job = client.query(query)
    results = query_job.result()
    data = [dict(row) for row in results]
    return {"data": data}
