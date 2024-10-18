WITH
    dimCliente AS (
        SELECT *
        FROM {{ ref('int_cliente') }}
    )

SELECT *
FROM dimCliente