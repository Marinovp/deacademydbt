{{
    config
    (
        materialized='incremental' ,
        incremental_strategy = 'merge' ,
        unique_key ='PURCHASE_ID' ,
        merge_exclude_columns = ['INSERT_DTS']
    )
}}

with purchase_src as (

    select 
        *
        ,CURRENT_TIMESTAMP AS INSERT_DTS 
        ,CURRENT_TIMESTAMP AS UPDATED_DTS
    FROM {{source('purchase','PURCHASE_SRC')}}


    {% if is_incremental() %}
    where CREATED_AT > (select max(UPDATED_DTS) from {{this}})
    {% endif %}
)

SELECT * 
FROM purchase_srC