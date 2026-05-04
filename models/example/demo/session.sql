{{
    config
    (
        materialized = 'table'
    )
}}

with session_src as (
    SELECT 
        SESSION_ID, USER_ID, BROWSER, DEVICE_TYPE,  B.COUNTRY_NAME, B.CONTINENT, B.CURRENCY, START_TIME, END_TIME, PAGES_VISITED
        , CURRENT_TIMESTAMP AS INSERT_DTS

    FROM 
        {{source('session','SESSION_SRC')}} A
        LEFT JOIN {{ref('country_code')}} B
            ON A.COUNTRY_CODE = B.COUNTRY_CODE
)

SELECT *
FROM session_src