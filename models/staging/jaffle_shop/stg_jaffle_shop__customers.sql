{{
    config
    (
        materialized='view',
        database = 'raw',
        schema='JAFFLE_SHOP'
    )
    
    
}}
select
    id as customer_id,
    first_name,
    last_name

from raw.jaffle_shop.customers