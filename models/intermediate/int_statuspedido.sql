WITH 
    statusPedido AS (
        SELECT 
              pk_idPedido
            , statusPedido
        FROM {{ ref('stg_salesorderheader') }}
    )

SELECT * 
FROM statusPedido