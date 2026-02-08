from azure.storage.blob import BlobClient  # pip install azure-storage-blob

# 1. Local CSV path
local_path = r"C:\Users\daveh\project\ev-battery-analytics\data\ev_data_sql.csv"

# 2. Full blob URL including SAS – you already have this
blob_url = (
    "https://entdatalake01ev.blob.core.windows.net/"
    "ev-raw/curated/ev_batteries/ev_batteries_clean.csv"
    "?sp=rcwdl&st=2026-01-15T20:09:42Z&se=2026-05-16T03:24:42Z"
    "&spr=https&sv=2024-11-04&sr=c"
    "&sig=MsTbYEuB%2F%2FQB3ZOEys7SDBSsaWLMidaMiJx9NJc9Cs4%3D"
)

blob_client = BlobClient.from_blob_url(blob_url)

with open(local_path, "rb") as data:
    blob_client.upload_blob(data, overwrite=True)

print("Upload complete.")

