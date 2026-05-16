with 

source as (

    select * from {{ source('jaffle_shop', 'orders') }}

),

renamed as (

    select
<<<<<<< HEAD
        id as order_id,
        user_id,
        order_date,
        status as order_status,
=======
<<<<<<< HEAD
        id as order_id,
        user_id,
        order_date,
        status as order_status,
=======
        id,
        user_id,
        order_date,
        status,
>>>>>>> a7d72956406b90402a9d08aadaa7b1c20c2abde6
>>>>>>> b7d65f4a7df6a018675d1b502ae252c09d0f5bd9
        _etl_loaded_at

    from source

)

select * from renamed