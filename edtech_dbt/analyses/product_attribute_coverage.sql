select
  count(*) as total_lp_ids_in_dim,
  sum(case when product_name is not null then 1 else 0 end) as with_product_name,
  round(
    100.0 * sum(case when product_name is not null then 1 else 0 end) / count(*),
    2
  ) as pct_with_product_name
from {{ ref('dim_products') }}
