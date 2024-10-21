WITH 
    statusPedido AS (
        SELECT 
              pk_idPedido
            , statusPedido
        FROM {{ ref('stg_statuspedido') }}
    )

SELECT * 
FROM statusPedido