WITH 
    fontePais AS (
        SELECT 
            COUNTRYREGIONCODE
            , NAME
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'COUNTRYREGION') }}
    )

    , renomearPais AS (
        SELECT 
              CAST(COUNTRYREGIONCODE AS VARCHAR) AS pk_idPais
            , CAST(NAME AS VARCHAR) AS nomePais
        FROM fontePais
    )

SELECT *
FROM renomearPais