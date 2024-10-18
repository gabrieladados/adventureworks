WITH
    dimTipoCartao AS (
        SELECT *
        FROM {{ ref('int_tipocartao') }}
    )

SELECT *
FROM dimTipoCartao
