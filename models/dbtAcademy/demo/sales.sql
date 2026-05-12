{{
    config
    (
        materialized = 'incremental',
        incremental_strategy = 'append'
    )
}}
with sales_src as (
    SELECT 
        *
        ,CURRENT_TIMESTAMP AS INSERT_DTS 
    FROM  {{source('sales','SALES_SRC')}}

    {% if is_incremental() %}
    where CREATED_AT > (select max(INSERT_DTS) from {{this}})
    {% endif %}
)

SELECT * 
FROM sales_src