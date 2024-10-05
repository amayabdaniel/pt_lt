from fastapi import FastAPI, HTTPException
from google.cloud import bigquery
import os

app = FastAPI()

PROJECT_ID = os.getenv("PROJECT_ID")
BIGQUERY_DATASET = os.getenv("BIGQUERY_DATASET")
BIGQUERY_TABLE = os.getenv("BIGQUERY_TABLE")

client = bigquery.Client(project=PROJECT_ID)

@app.get("/")
def read_root():
    return {"message": "Welcome to the Data Exposure API"}

@app.get("/data")
def get_data():
    query = f"""
        SELECT *
        FROM `{PROJECT_ID}.{BIGQUERY_DATASET}.{BIGQUERY_TABLE}`
        LIMIT 100
    """
    query_job = client.query(query)
    results = query_job.result()
    data = [dict(row) for row in results]
    if not data:
        raise HTTPException(status_code=404, detail="No data found.")
    return {"data": data}

if __name__ == "__main__":
    import uvicorn
    port = int(os.getenv("PORT", 8080))
    uvicorn.run(app, host="0.0.0.0", port=port)
