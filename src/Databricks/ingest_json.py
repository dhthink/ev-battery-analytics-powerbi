import json
import pandas as pd

json_path = r"C:\Users\daveh\project\ev-battery-analytics\open-ev-data\data\ev-data.json"

print("Using JSON path:", json_path)

# Load raw JSON
with open(json_path, "r", encoding="utf-8") as f:
    raw = json.load(f)

# Inspect top-level keys
print("Top-level keys:", list(raw.keys()))

# The actual vehicle rows are under the 'data' key in this dataset
rows = raw["data"]          # list of dicts

# df = pd.DataFrame(rows)     # now lengths match
# print(df.head())
# print("Rows:", len(df), "Columns:", len(df.columns))

print("First raw row:")
print(rows[0])

print("Keys in one row:", rows[0].keys())

