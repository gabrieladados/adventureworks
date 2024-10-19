WITH 
    motivoVenda AS (
        SELECT *
        FROM {{ ref('stg_motivovenda') }}
    )

SELECT * 
FROM motivoVenda