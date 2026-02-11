# Done via databricks free addition due to azure databricks limitations. 

import requests
from azure.storage.blob import BlobServiceClient

# Azure storage
DATABRICKS_FILE_URL = "https://dbc-a20fb33f-459f.cloud.databricks.com/explore/data/workspace/onedrive/ev_raw_csv?o=875246317280872"  # your full URL
STORAGE_ACCOUNT_NAME = "entdatalake01ev"  # or your exact account name
STORAGE_ACCOUNT_KEY = "Uour key code"
CONTAINER_NAME = "ev_raw_csvev-data"
BLOB_NAME = "ev_data.csv"  # or "raw/ev_data.csv" if you want a folder-like path
# ========================

# 1. Grab CSV 
resp = requests.get(DATABRICKS_FILE_URL)
resp.raise_for_status()
file_bytes = resp.content  # keep in memory for this small file

# 2. Connection string

connection_str = (
    f"DefaultEndpointsProtocol=https;"
    f"AccountName={STORAGE_ACCOUNT_NAME};"
    f"AccountKey={STORAGE_ACCOUNT_KEY};"
    f"EndpointSuffix=core.windows.net"
)


# 3. Upload to Azure Blob Storage
blob_service_client = BlobServiceClient.from_connection_string(connection_str)
blob_client = blob_service_client.get_blob_client(container=CONTAINER_NAME, blob=BLOB_NAME)

blob_client.upload_blob(file_bytes, overwrite=True)

print("Upload complete.")
