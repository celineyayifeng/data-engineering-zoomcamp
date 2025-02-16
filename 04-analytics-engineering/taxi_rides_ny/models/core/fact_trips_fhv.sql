{{
    config(
        materialized='table'
    )
}}

WITH dim_zones AS (
    SELECT * 
    FROM {{ ref('dim_zones') }}
    WHERE borough != 'Unknown'
),
fhv_tripdata AS (
    SELECT * 
    FROM {{ ref('stg_fhv_tripdata') }}
)

SELECT 
    a.*,
    pickup_zone.borough AS pickup_borough, 
    pickup_zone.zone AS pickup_zone, 
    dropoff_zone.borough AS dropoff_borough, 
    dropoff_zone.zone AS dropoff_zone 
FROM fhv_tripdata AS a
INNER JOIN dim_zones AS pickup_zone
ON a.pickup_locationid = pickup_zone.locationid
INNER JOIN dim_zones AS dropoff_zone
ON a.dropoff_locationid = dropoff_zone.locationid 
