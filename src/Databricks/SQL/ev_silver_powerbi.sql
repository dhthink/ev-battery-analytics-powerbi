-- use CATALOG workspace;
-- use SCHEMA onedrive;

-- Create or replace table ev_silver_powerbi
-- using DELTA
-- AS

-- SELECT
--   brand,
--   brand_id,
--   model,
--   vehicle_type,
--   release_year,
--   usable_battery_size,
--   CAST(
--     regexp_extract(energy_consumption, '([0-9]+\\.?[0-9]*)', 1)
--     AS DOUBLE
--   ) AS average_consumption_num,
--   round(usable_battery_size / (average_consumption_num / 100), 0) AS kw_range,
--   round(usable_battery_size / (average_consumption_num / 100) * 0.621, 0) AS range_miles,
--   range,
--   try_cast(
--     regexp_extract(ac_charger, 'max_power[^0-9]*([0-9]+)', 1)
--     AS DOUBLE
--   ) AS ac_max_power_kw,
--   try_cast(
--     regexp_extract(dc_charger, 'max_power[^0-9]*([0-9]+)', 1)
--     AS DOUBLE
--   ) AS dc_max_power_kw, battery_size
-- FROM workspace.onedrive.ev_raw_csv
-- WHERE release_year IS NOT NULL
--   AND range IS NOT NULL
--   AND release_year > 2018
-- ORDER BY release_year ASC

-- select * from ev_silver_powerbi;
-- SELECT
--   AVG(usable_battery_size - battery_size) AS avg_diff_signed,
--   AVG(ABS(usable_battery_size - battery_size)) AS avg_diff_absolute
-- FROM ev_silver_powerbi
-- WHERE battery_size IS NOT NULL
--   AND usable_battery_size IS NOT NULL
--   AND usable_battery_size <> battery_size;
-- SELECT 4.03829787 / 4.34468085 AS result; --~.93

-- use CATALOG workspace;
-- use SCHEMA onedrive;

-- Create or replace table ev_silver_powerbi
-- using DELTA
-- AS

-- SELECT
--   brand,
--   brand_id,
--   model,
--   vehicle_type,
--   release_year,
--   usable_battery_size,
--   CAST(
--     regexp_extract(energy_consumption, '([0-9]+\\.?[0-9]*)', 1)
--     AS DOUBLE
--   ) AS average_consumption_num,
--   round(usable_battery_size / (average_consumption_num / 100), 0) AS kw_range,
--   round(usable_battery_size / (average_consumption_num / 100) * 0.621, 0) AS range_miles,
--   range,
--   try_cast(
--     regexp_extract(ac_charger, 'max_power[^0-9]*([0-9]+)', 1)
--     AS DOUBLE
--   ) AS ac_max_power_kw,
--   try_cast(
--     regexp_extract(dc_charger, 'max_power[^0-9]*([0-9]+)', 1)
--     AS DOUBLE
--   ) AS dc_max_power_kw, int(usable_battery_size / .93) as est_battery_size
-- FROM workspace.onedrive.ev_raw_csv
-- WHERE release_year IS NOT NULL
--   AND range IS NOT NULL
--   AND release_year > 2018
-- ORDER BY release_year ASC

select *
from ev_silver_powerbi