WITH 
    statusPedido AS (
        SELECT *
        FROM {{ ref('stg_statuspedido') }}
    )

SELECT * 
FROM statusPedido