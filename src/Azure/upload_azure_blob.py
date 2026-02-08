import os
import json
import pandas as pd
from dotenv import load_dotenv
from azure.storage.blob import BlobServiceClient

# ---------- 1. Load env vars ----------
load_dotenv()  # reads .env in project root

conn_str = os.environ["AZURE_STORAGE_CONNECTION_STRING"]

# ---------- 2. Azure Blob config ----------
CONTAINER_NAME = "ev-data"                      # your container
BLOB_NAME = "raw/ev-data-databricks.csv"        # path/name inside container

# ---------- 3. Local JSON path ----------
# Assumes ev-data.json is in the same folder as this script
BASE_DIR = os.path.dirname(__file__)
input_file = os.path.join(BASE_DIR, "open-ev-data", "data", "ev-data.json")
print("Using JSON path:", input_file)


# ---------- 4. Load JSON and create DataFrame ----------
with open(input_file, "r") as f:
    data = json.load(f)

df = pd.DataFrame(data["data"])
print("DataFrame shape:", df.shape)
print(df.head())

# ---------- 5. Convert DataFrame to CSV in memory ----------
csv_string = df.to_csv(index=False)
csv_bytes = csv_string.encode("utf-8")

# ---------- 6. Upload to Azure Blob ----------
blob_service = BlobServiceClient.from_connection_string(conn_str)
container_client = blob_service.get_container_client(CONTAINER_NAME)
blob_client = container_client.get_blob_client(BLOB_NAME)

blob_client.upload_blob(csv_bytes, overwrite=True)
print(f"Uploaded CSV to blob: container='{CONTAINER_NAME}', blob='{BLOB_NAME}'")

