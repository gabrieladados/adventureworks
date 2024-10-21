WITH 

    fonteTempo AS (
        SELECT 
            DATEADD(DAY, seq4(), '2000-01-01') AS data_completa 
        FROM TABLE(GENERATOR(ROWCOUNT => 365*25)) 
)

SELECT 
      data_completa
    , YEAR(data_completa) AS ano
    , MONTH(data_completa) AS mes
    , DAY(data_completa) AS dia
    , CASE 
        WHEN MONTH(data_completa) IN (1, 2, 3) THEN 1 
        WHEN MONTH(data_completa) IN (4, 5, 6) THEN 2 
        WHEN MONTH(data_completa) IN (7, 8, 9) THEN 3 
        ELSE 4 
    END AS trimestre
    , DATE_TRUNC('MONTH', data_completa) AS inicio_do_mes
    , DATE_TRUNC('YEAR', data_completa) AS inicio_do_ano
FROM fonteTempo
