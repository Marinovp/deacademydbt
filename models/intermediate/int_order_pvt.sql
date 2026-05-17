-- WITH payments as (
--     SELECT * 
--     FROM {{ ref ('stg_stripe__payment') }}
-- ) 
-- , pivoted as (
--     SELECT 
--         orderid
--         , SUM(case when paymentmethod = 'bank_transfer' then amount else 0 end ) as bank_transfer_amount
--         , SUM(case when paymentmethod = 'coupon' then amount else 0 end ) as coupon_amount
--         , SUM(case when paymentmethod = 'credit_card' then amount else 0 end ) as credit_card_amount
--         , SUM(case when paymentmethod = 'gift_card' then amount else 0 end ) as gift_card_amount
--     FROM payments
--     group by 1
-- )

-- SELECT * 
-- FROM pivoted
-- order by orderid

---- with jinja code 
WITH payments as (
    SELECT * 
    FROM {{ ref ('stg_stripe__payment') }}
) 
, pivoted as (
    SELECT 
        orderid ,
        {% set payment_methods = ['bank_transfer','coupon','credit_card','gift_card'] %}
        {%- for payment_method in payment_methods %}

            SUM(case when paymentmethod = {{ payment_method }} then amount else 0 end ) as {{ payment_method }}_amount
        
        {%- if not loop.last -%}
            ,
        {%- endif -%}
            
        {% endfor %}
        
    FROM payments
    group by 1
)

SELECT * 
FROM pivoted
order by orderid