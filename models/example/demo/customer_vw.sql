{{
    config
    (
        materialized='view'
    )
    
    
}}

SELECT * 
FROM {{ ref('customer_dbt') }}
WHERE COUNTRY= 'USA'