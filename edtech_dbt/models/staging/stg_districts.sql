-- Staging model for district-level info

SELECT
    CAST(district_id AS BIGINT) AS district_id,
    *
EXCLUDE (district_id)
FROM {{ ref('raw_districts') }};
