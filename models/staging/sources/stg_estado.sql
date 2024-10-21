WITH
    fonteStateProvince AS (
        SELECT 
              STATEPROVINCEID
            , COUNTRYREGIONCODE
            , NAME
            --, STATEPROVINCECODE
            --, ISONLYSTATEPROVINCEFLAG
            --, TERRITORYID
            --, ROWGUID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'STATEPROVINCE') }}
    )

    , renomearStateProvince AS (
        SELECT 
              CAST(STATEPROVINCEID AS INT) AS pk_idEstado
            , CAST(COUNTRYREGIONCODE AS VARCHAR) AS fk_idPais
            , CAST(NAME AS VARCHAR) AS nomeEstado
        FROM fonteStateProvince
    )


SELECT * 
FROM renomearStateProvince