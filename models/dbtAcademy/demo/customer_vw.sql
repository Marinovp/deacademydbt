{{
    config
    (
        materialized='view'
    )
    
    
}}

SELECT * 
<<<<<<< HEAD:models/dbtAcademy/demo/customer_vw.sql
FROM {{ ref('dim_customer') }}
=======
FROM {{ ref('customer_dbt') }}
>>>>>>> c4b7a5b3db020ce8fff8bcb5adb0c6c09a7441ef:models/example/demo/customer_vw.sql
WHERE COUNTRY= 'USA'