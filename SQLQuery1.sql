 SELECT brand, brand_id,  model, vehicle_type, variant, release_year,usable_battery_size,
         energy_consumption, ac_charger,dc_charger, charging_voltage, battery_size,
         range, consumption,_model_hash, url, status, error, updated_at,
         isFixingEmptyName,_manually_fixed_fields, nominal_battery_size, 
         battery_type, type,_rescued_data
 FROM dbo.EV_Vehicles
 where vehicle_type = 'car' and release_year_int > 0
 order by release_year ASC;
