
import json
import os
import pandas as pd

# Step 1: Define input and output paths
input_file = os.path.join(os.path.dirname(__file__), "ev-data.json")
output_file = r"c:\Users\daveh\project\ev-data-databricks.csv"  # Save to project root

# Step 2: Load JSON
with open(input_file, 'r') as f:
    data = json.load(f)

# Step 3: Convert to DataFrame
df = pd.DataFrame(data["data"])
print("\nFirst 50 rows of original data:")
print(df.head())
print("\nColumns:")
print(df.columns)

# Step 4: Export to CSV for Databricks
df.to_csv(output_file, index=False)
print(f"\nCSV file exported for Databricks: {output_file}")

# Step 5: Verify export by reading back
if os.path.exists(output_file):
    print("\nVerification: File exists.")
    check_df = pd.read_csv(output_file)
    print("\nPreview of exported file:")
    print(check_df.head())
else:
   print("\nVerification: File does not exist.")
