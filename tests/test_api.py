import requests
import json

API_URL = "https://data-exposure-api-<hash>.run.app/data"

def test_get_data():
    response = requests.get(API_URL)
    assert response.status_code == 200
    data = response.json()
    assert "data" in data
    assert isinstance(data["data"], list)
