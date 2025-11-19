-- Fact table: daily engagement by product (lp_id) and date

with base as (

    select
        lp_id,
        cast(time as date)           as usage_date,
        pct_access,
        engagement_index
    from {{ ref('stg_engagement') }}
    where pct_access is not null
       or engagement_index is not null

),

aggregated as (

    select
        lp_id,
        usage_date,
        avg(pct_access)        as avg_pct_access,
        avg(engagement_index)  as avg_engagement_index
    from base
    group by
        lp_id,
        usage_date

)

select * from aggregated
