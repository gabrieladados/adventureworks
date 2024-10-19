WITH 

    fonteMotivoVenda AS(
        SELECT 
              SALESREASONID
            , NAME
            , REASONTYPE
            --, MODIFIEDDATE          
        FROM {{ source('source_adventureworks', 'SALESREASON') }}
    )


    , renomearMotivoVenda AS (
        SELECT 
              CAST(SALESREASONID AS INT) AS pk_idMotivoVenda
            , CAST(NAME AS VARCHAR) AS motivoVenda
            , CAST(REASONTYPE AS VARCHAR) AS tipoMotivoVenda
        FROM fonteMotivoVenda
    )

    SELECT *
    FROM renomearMotivoVenda



