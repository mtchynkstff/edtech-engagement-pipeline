-- Staging model for products data

select
  cast("LP ID" as bigint)                 as lp_id,
  "URL"                                   as product_url,
  "Product Name"                          as product_name,
  "Provider/Company Name"                 as provider_name,
  "Sector(s)"                             as sectors,
  "Primary Essential Function"             as primary_essential_function
from raw_products
