WITH
    dimProduto AS (
        SELECT *
        FROM {{ ref('int_produto') }}
    )

SELECT *
FROM dimProduto