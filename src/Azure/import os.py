import os
from dotenv import load_dotenv
from azure.storage.blob import BlobServiceClient

# 1) Load variables from .env into process environment
load_dotenv()  # looks for .env in current working directory

# 2) Read the connection string from environment
conn_str = os.environ["AZURE_STORAGE_CONNECTION_STRING"]

# 3) Use it to create a BlobServiceClient
blob_service = BlobServiceClient.from_connection_string(conn_str)

# 4) Example: get a container client
container_client = blob_service.get_container_client("ev-data")

print("Connected to container:", container_client.container_name)
