WITH 
    tempo AS (
        SELECT *
        FROM {{ ref('stg_tempo') }}
)

SELECT 
      data_completa AS data
    , ano
    , mes
    , dia
    , trimestre
    , inicio_do_mes
    , inicio_do_ano
FROM tempo
