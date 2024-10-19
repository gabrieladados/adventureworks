WITH 
    dimMotivoVenda AS (
        SELECT *
        FROM {{ ref('int_motivovenda') }}
    )
    
SELECT *
FROM dimMotivoVenda