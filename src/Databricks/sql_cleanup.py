# from pyspark.sql import SparkSession

# spark = SparkSession.builder.getOrCreate()

# # Direct HTTP read from your SAS URL (Databricks can read CSV via HTTP)
# url = "https://entdatalake01ev.blob.core.windows.net/ev-raw/curated/evbatteries/ev_batteries_clean.csv?sp=rcwdl&st=2026-01-15T20:09:42Z&se=2026-05-16T03:24:42Z&spr=https&sv=2024-11-04&sr=c&sig=MsTbYEuB%2F%2FQB3ZOEys7SDBSsaWLMidaMiJx9NJc9Cs4%3D"

# df = (
#     spark.read
#     .option("header", "true")
#     .option("inferSchema", "true")
#     .csv(url)
# )

# # df.printSchema()
# df.show(5, truncate=False)

from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

df = spark.read.csv(
    "dbfs:/Volumes/workspace/onedrive/ev_data/ev-data-databricks.csv",
    header=True,
    inferSchema=True
)

df.show(5, truncate=False)

# from pyspark.sql import SparkSession

# spark = SparkSession.builder.getOrCreate()

# df = spark.read.csv(
#     "/Volumes/workspace/onedrive/ev_data/ev_batteries_raw.csv",  # your actual path
#     header=True,
#     inferSchema=True
# )

# # show all column names
# print(df.columns)

# # or a nicer schema view
# df.printSchema()
# df.createOrReplaceTempView("ev_batteries_raw")

# spark.sql("DESCRIBE TABLE ev_batteries_raw").show(truncate=False)

# df.createOrReplaceTempView("ev_batteries_raw")

# result = spark.sql("""
# SELECT
#   id,
#   brand,
#   model,
#   vehicle_type,
#   type,
#   release_year
# FROM ev_batteries_raw
# LIMIT 10
# """)

# result.show(truncate=False)

cleaned = spark.sql("""
SELECT
  id,
  brand,
  model,
  vehicle_type,
  release_year,
  usable_battery_size,
  range,
  energy_consumption,
  battery_type,
  status
FROM ev_batteries_raw
LIMIT 20
""")

cleaned.show(truncate=False)
