-- select current_catalog(), current_schema(); 
-- USE CATALOG workspace;
-- USE SCHEMA onedrive;
--108 cars from 2015 and earlier

-- CREATE OR REPLACE TABLE ev_silver AS
-- SELECT brand, model, vehicle_type, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,  
--         battery_type
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null 

-- 108 cars for 2015 and earlier
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year <= 2015
-- order by release_year ASC;

-- 46 cars for 2016
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2016
-- order by release_year ASC;

-- 64 cars for 2017
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2017
-- order by release_year ASC;

-- 44 cars for 2018
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2018
-- order by release_year ASC;

-- 164 cars for 2019
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2019
-- order by release_year ASC;

-- 304 cars for 2020
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2020
-- order by release_year ASC;

-- 386 cars for 2021
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2021
-- order by release_year ASC;

-- 442 cars for 2022
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2022
-- order by release_year ASC;

-- 590 cars for 2023
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2023
-- order by release_year ASC;

-- 430 cars for 2024
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2024
-- order by release_year ASC;

-- 82 cars for 2025
-- SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
--         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
--         range, consumption,_model_hash, url, status, error, updated_at,
--         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
--         battery_type, type,_rescued_data
-- FROM workspace.onedrive.ev_raw_csv
-- where release_year is not null and release_year = 2025
-- order by release_year ASC;

-- SELECT *
-- FROM ev_silver
-- ORDER BY release_year ASC
-- LIMIT 5;

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


-- select * FROM
-- workspace.onedrive.ev_raw_csv
-- where battery_type is not null

