WITH 
     fonteAddress AS (
        SELECT 
              ADDRESSID
            , STATEPROVINCEID
            , CITY
            --, ADDRESSLINE1
            --, ADDRESSLINE2
            --, POSTALCODE
            --, SPATIALLOCATION
            --, ROWGUID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'ADDRESS') }}
    )

    , renomearAddress AS (
        SELECT 
              CAST(ADDRESSID AS INT) AS pk_idEndereco
            , CAST(STATEPROVINCEID AS INT) AS fk_idEstado
            , CAST(CITY AS VARCHAR) AS cidade
        FROM fonteAddress
    )

SELECT *
FROM renomearAddress