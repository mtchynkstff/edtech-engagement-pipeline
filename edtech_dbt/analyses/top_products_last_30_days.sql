select
  d.product_name,
  f.lp_id,
  avg(f.avg_engagement_index) as avg_engagement_index_30d
from {{ ref('fct_product_daily_engagement') }} f
left join {{ ref('dim_products') }} d
  on f.lp_id = d.lp_id
where f.usage_date >= (current_date - interval 30 day)
group by 1,2
order by 3 desc
limit 25
