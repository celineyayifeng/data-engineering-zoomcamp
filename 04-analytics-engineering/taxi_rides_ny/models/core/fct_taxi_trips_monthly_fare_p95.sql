{{ config(
    materialized='table'
) }}

with valid_trips as (
    select
        service_type,
        fare_amount,
        pickup_datetime,
        payment_type_description
    from {{ ref('fact_trips') }}
    where fare_amount > 0
      and trip_distance > 0
      and payment_type_description in ('Cash', 'Credit Card')
),

monthly_p95 as (
    select
        service_type,
        date_trunc(pickup_datetime, month) as year_month,
        extract(year from pickup_datetime) as year,
        extract(month from pickup_datetime) as month,
        percentile_cont(fare_amount, 0.90) over (
            partition by 
                service_type, 
                extract(year from pickup_datetime),
                extract(month from pickup_datetime)
        ) as fare_amount_p90,
        percentile_cont(fare_amount, 0.95) over (
            partition by 
                service_type, 
                extract(year from pickup_datetime),
                extract(month from pickup_datetime)
        ) as fare_amount_p95,
        percentile_cont(fare_amount, 0.97) over (
            partition by 
                service_type, 
                extract(year from pickup_datetime),
                extract(month from pickup_datetime)
        ) as fare_amount_p97
    from valid_trips
)

select distinct
    service_type,
    year_month,
    year,
    month,
    fare_amount_p90,
    fare_amount_p95,
    fare_amount_p97
from monthly_p95
order by service_type, year_month
