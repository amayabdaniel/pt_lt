from fastapi import FastAPI, HTTPException
from google.cloud import bigquery
import os

app = FastAPI()

# Configurar variables de entorno
PROJECT_ID = os.getenv("PROJECT_ID")
DATASET = os.getenv("BIGQUERY_DATASET")
TABLE = os.getenv("BIGQUERY_TABLE")

client = bigquery.Client(project=PROJECT_ID)

@app.get("/data")
def get_data():
    query = f"""
        SELECT *
        FROM `{PROJECT_ID}.{DATASET}.{TABLE}`
        LIMIT 100
    """
    try:
        query_job = client.query(query)
        results = query_job.result()
        data = [dict(row) for row in results]
        return {"data": data}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
