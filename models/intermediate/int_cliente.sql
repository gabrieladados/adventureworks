WITH cliente AS (
    SELECT  *
    FROM {{ ref('stg_cliente') }} AS c
    LEFT JOIN {{ ref('stg_pessoa') }} AS p
        ON c.pk_idCliente = p.pk_idContatoNegocio 
)

SELECT 
      pk_idCliente
    , nomePessoa 
    , tipoPessoa
FROM cliente
