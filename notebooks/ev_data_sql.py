df = (
    spark.read
    .option("header", "true")
    .option("inferSchema", "true")
    .csv("/Volumes/workspace/onedrive/ev_data")
)
display(df)

df.write.mode("append").saveAsTable("workspace.onedrive.ev_raw_csv")
# List available catalogs
display(
    spark.sql("SHOW CATALOGS")
)

# After identifying your catalog (e.g., 'main'), list schemas in that catalog
catalog_name = "main"  # Use the default catalog
display(
    spark.sql(
        f"SHOW SCHEMAS IN {catalog_name}"
    )
)

# Use a valid catalog and schema in saveAsTable
df.write.mode("append").saveAsTable("main.default.ev_raw_csv")