WITH 
    dimStatusPedido AS (
        SELECT *
        FROM {{ ref('int_statuspedido') }}
    )

SELECT * 
FROM dimStatusPedido