-- Engagement rows that do not map to a known product (lp_id is null)

WITH base AS (
    SELECT
        lp_id,
        usage_date,
        pct_access,
        engagement_index
    FROM {{ ref('stg_engagement') }}
    WHERE pct_access IS NOT NULL
       OR engagement_index IS NOT NULL
)

SELECT
    usage_date,
    COUNT(*) AS rows_with_null_lp_id,
    AVG(pct_access) AS avg_pct_access,
    AVG(engagement_index) AS avg_engagement_index
FROM base
WHERE lp_id IS NULL
GROUP BY usage_date
ORDER BY usage_date
