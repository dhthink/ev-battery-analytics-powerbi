select * from EV_Vehicles;
DROP TABLE IF EXISTS dbo.EV_Vehicles;
GO
DROP TABLE IF EXISTS dbo.EV_Vehicles;
GO

CREATE TABLE dbo.EV_Vehicles (
    id                     NVARCHAR(200)     NULL,
    brand                  NVARCHAR(200)     NULL,
    brand_id               NVARCHAR(200)     NULL,
    model                  NVARCHAR(200)     NULL,
    vehicle_type           NVARCHAR(200)     NULL,
    variant                NVARCHAR(200)     NULL,
    release_year           NVARCHAR(50)      NULL,
    usable_battery_size    NVARCHAR(50)      NULL,
    energy_consumption     NVARCHAR(MAX)     NULL,
    ac_charger             NVARCHAR(MAX)     NULL,
    dc_charger             NVARCHAR(MAX)     NULL,
    charging_voltage       NVARCHAR(50)      NULL,
    battery_size           NVARCHAR(50)      NULL,
    range                  NVARCHAR(50)      NULL,
    consumption            NVARCHAR(50)      NULL,
    _model_hash            NVARCHAR(200)     NULL,
    url                    NVARCHAR(500)     NULL,
    status                 NVARCHAR(200)     NULL,
    error                  NVARCHAR(500)     NULL,
    updated_at             NVARCHAR(100)     NULL,
    isFixingEmptyName      NVARCHAR(100)     NULL,
    _manually_fixed_fields NVARCHAR(MAX)     NULL,
    nominal_battery_size   NVARCHAR(100)     NULL,
    battery_type           NVARCHAR(100)     NULL,
    type                   NVARCHAR(200)     NULL,
    _rescued_data          NVARCHAR(MAX)     NULL
);
BULK INSERT dbo.EV_Vehicles
FROM 'C:\Users\daveh\project\ev-battery-analytics\data\ev_data.csv'
WITH (
    FIRSTROW = 2,            -- skip header
    FIELDTERMINATOR = ',',   -- CSV commas
    ROWTERMINATOR   = '0x0d0a',  -- Windows CRLF
    TABLOCK,
    MAXERRORS = 0
);

ALTER TABLE dbo.EV_Vehicles
ADD
    id_guid              UNIQUEIDENTIFIER NULL,
    release_year_int     INT NULL,
    usable_battery_kwh   FLOAT NULL,
    battery_size_kwh     FLOAT NULL,
    range_km             INT NULL,
    consumption_kwh_100  FLOAT NULL,
    updated_at_epoch     BIGINT NULL,
    isFixingEmptyName_bit BIT NULL;

    UPDATE dbo.EV_Vehicles
SET
    id_guid             = TRY_CONVERT(UNIQUEIDENTIFIER, id),
    release_year_int    = TRY_CONVERT(INT, release_year),
    usable_battery_kwh  = TRY_CONVERT(FLOAT, usable_battery_size),
    battery_size_kwh    = TRY_CONVERT(FLOAT, battery_size),
    range_km            = TRY_CONVERT(INT, range),
    consumption_kwh_100 = TRY_CONVERT(FLOAT, consumption),
    updated_at_epoch    = TRY_CONVERT(BIGINT, updated_at),
    isFixingEmptyName_bit =
        CASE WHEN LTRIM(RTRIM(isFixingEmptyName)) = '1' THEN 1
             WHEN LTRIM(RTRIM(isFixingEmptyName)) = '0' THEN 0
             ELSE NULL END;
