-- Engagement rows that do not map to a known product (lp_id is null)

select
  lp_id,
  usage_date,
  pct_access,
  engagement_index
from {{ ref('stg_engagement') }}
where lp_id is not null
  and (pct_access is not null or engagement_index is not null)

