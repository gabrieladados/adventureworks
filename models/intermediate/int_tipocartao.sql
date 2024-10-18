WITH 
    tipocartao AS (
        SELECT *
        FROM {{ ref('stg_tipocartao') }}
    )

SELECT * 
FROM tipocartao