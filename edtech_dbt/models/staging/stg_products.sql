-- Staging model for product catalog

with source as (

    select * from raw_products

),

renamed as (

    select
        "Product Name" as product_name,
        *
    from source

)

select * from renamed
