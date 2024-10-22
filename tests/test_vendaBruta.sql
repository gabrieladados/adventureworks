{{ 
    config(
        severity = 'error'
    ) 
}}

WITH 

    fonte_vendabruta AS (
        SELECT 
            ROUND(SUM(quantidadePedido * precoUnitario), 2) AS valorTotal
        FROM {{ ref('FatoPedido') }}
        WHERE dataCompra BETWEEN '2011-01-01' AND '2011-12-31'
    )

SELECT *
FROM fonte_vendabruta
WHERE valorTotal <> 12646112.16
