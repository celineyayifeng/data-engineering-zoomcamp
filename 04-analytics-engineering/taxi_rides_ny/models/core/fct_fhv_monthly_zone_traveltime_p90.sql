{{ config(
    materialized='table'
) }}

with trip_durations as (
    select
        pickup_locationid,
        dropoff_locationid,
        pickup_zone,
        dropoff_zone,
        pickup_datetime,
        timestamp_diff(dropoff_datetime, pickup_datetime, second) as trip_duration_seconds
    from {{ ref('fact_trips_fhv') }}
    where dropoff_datetime > pickup_datetime  -- filter out invalid records
),

monthly_zone_stats as (
    select
        pickup_locationid,
        dropoff_locationid,
        pickup_zone,
        dropoff_zone,
        date_trunc(pickup_datetime, month) as year_month,
        extract(year from pickup_datetime) as year,
        extract(month from pickup_datetime) as month,
        percentile_cont(trip_duration_seconds, 0.90) over (
            partition by 
                pickup_locationid,
                dropoff_locationid,
                extract(year from pickup_datetime),
                extract(month from pickup_datetime)
        ) as trip_duration_p90
    from trip_durations
)

select distinct
    pickup_zone,
    dropoff_zone,
    year_month,
    year,
    month,
    trip_duration_p90
from monthly_zone_stats
order by 
    year_month,
    pickup_zone, 
    dropoff_zone
