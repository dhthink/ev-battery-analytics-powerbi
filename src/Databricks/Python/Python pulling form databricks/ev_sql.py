from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

df = spark.read.csv(
    "dbfs:/Volumes/workspace/onedrive/ev_data/ev-data-databricks.csv",
    header=True,
    inferSchema=True
)

df.createOrReplaceTempView("ev_batteries_raw")

summary = spark.sql("""
SELECT
  COUNT(*) AS row_count,
  COUNT(DISTINCT brand) AS distinct_brands,
  MIN(release_year) AS min_year,
  MAX(release_year) AS max_year
FROM ev_batteries_raw
""")

summary.show(truncate=False)
