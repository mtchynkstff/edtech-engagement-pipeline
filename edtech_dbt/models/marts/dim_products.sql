-- Dimension table: products
-- Coverage-first: includes all lp_id values observed in engagement, even if product attributes are missing.

with engagement_ids as (
  select distinct lp_id
  from {{ ref('stg_engagement') }}
  where lp_id is not null
),

product_attrs as (
  select
    lp_id,
    product_name,
    provider_name,
    product_url,
    sectors,
    primary_essential_function
  from {{ ref('stg_products') }}
  where lp_id is not null
)

select
  e.lp_id,
  p.product_name,
  p.provider_name,
  p.product_url,
  p.sectors,
  p.primary_essential_function
from engagement_ids e
left join product_attrs p
  on e.lp_id = p.lp_id
