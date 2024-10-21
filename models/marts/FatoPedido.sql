WITH
    dimFatoPedido AS (
        SELECT *
        FROM {{ ref('int_fatoPedido') }}
    )

SELECT *
FROM dimFatoPedido