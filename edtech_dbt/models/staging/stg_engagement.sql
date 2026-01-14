-- Staging model for engagement data
-- Grain: lp_id x day (raw is already daily)

select
    cast(time as date)      as usage_date,
    cast(lp_id as bigint)   as lp_id,
    cast(pct_access as double) as pct_access,
    cast(engagement_index as double) as engagement_index
from raw_engagement
