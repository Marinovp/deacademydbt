{{
    config
    (
        materialized='view'
    )
    
    
}}

SELECT * 
FROM {{ ref('dim_customer') }}
WHERE COUNTRY= 'USA'