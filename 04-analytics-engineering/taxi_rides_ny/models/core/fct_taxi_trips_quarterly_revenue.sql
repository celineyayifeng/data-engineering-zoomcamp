{{
    config(
        materialized='table'
    )
}}

with quarterly_revenue as (
    select
        extract(year from pickup_datetime) as year,
        extract(quarter from pickup_datetime) as quarter,
        service_type,
        sum(total_amount) as revenue
    from {{ ref('fact_trips') }}
    group by 1, 2, 3
),

quarterly_revenue_with_previous_year as (
    select
        service_type,
        year,
        quarter,
        revenue,
        lag(revenue) over (
            partition by quarter
            order by year
        ) as prev_year_revenue
    from quarterly_revenue
)

select
    service_type,
    year,
    quarter,
    revenue,
    prev_year_revenue,
    case 
        when prev_year_revenue is null then null
        when prev_year_revenue = 0 then null
        else round(((revenue - prev_year_revenue) / prev_year_revenue) * 100, 2)
    end as yoy_growth_pct
from quarterly_revenue_with_previous_year
order by service_type, year, quarter
