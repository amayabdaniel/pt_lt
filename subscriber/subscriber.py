# subscriber/subscriber.py

from google.cloud import pubsub_v1, bigquery
import os
import json
import logging
from fastapi import FastAPI
import uvicorn
import threading

logging.basicConfig(level=logging.INFO)

PROJECT_ID = os.getenv('PROJECT_ID')
SUBSCRIPTION_NAME = os.getenv('SUBSCRIPTION_NAME')
BIGQUERY_DATASET = os.getenv('BIGQUERY_DATASET')
BIGQUERY_TABLE = os.getenv('BIGQUERY_TABLE')
PORT = int(os.getenv('PORT', '8080'))

subscriber = pubsub_v1.SubscriberClient()
subscription_path = subscriber.subscription_path(PROJECT_ID, SUBSCRIPTION_NAME)

bigquery_client = bigquery.Client(project=PROJECT_ID)
table_id = f"{PROJECT_ID}.{BIGQUERY_DATASET}.{BIGQUERY_TABLE}"

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Subscriber is running"}

def callback(message):
    try:
        data = json.loads(message.data.decode('utf-8'))
        errors = bigquery_client.insert_rows_json(table_id, [data])
        if not errors:
            logging.info(f"Fila insertada: {data}")
            message.ack()
        else:
            logging.error(f"Errores al insertar fila: {errors}")
            message.nack()
    except Exception as e:
        logging.error(f"Error al procesar el mensaje: {e}")
        message.nack()

def listen():
    streaming_pull_future = subscriber.subscribe(subscription_path, callback=callback)
    logging.info(f"Escuchando mensajes en {subscription_path}...")
    
    with subscriber:
        try:
            streaming_pull_future.result()
        except Exception as e:
            logging.error(f"Escucha detenida debido a un error: {e}")
            streaming_pull_future.cancel()

def run_subscriber():
    listen()

def run_api():
    uvicorn.run(app, host="0.0.0.0", port=PORT)

if __name__ == "__main__":
    subscriber_thread = threading.Thread(target=run_subscriber, daemon=True)
    subscriber_thread.start()
    
    run_api()
