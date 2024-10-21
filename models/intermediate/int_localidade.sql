WITH 
    localidade AS (
        SELECT *
        FROM {{ ref('stg_cidade') }} AS c
        LEFT JOIN {{ ref('stg_estado') }} AS e
            ON c.fk_idEstado = e.pk_idEstado
        LEFT JOIN {{ ref('stg_pais') }} AS p
            ON e.fk_idPais = p.pk_idPais
    )

SELECT 
      pk_idEndereco
    , cidade
    , nomeEstado AS Estado
    , nomePais AS Pais
FROM localidade