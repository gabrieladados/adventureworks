WITH 
    fonteMotivoVendaLigacao AS(
        SELECT 
              SALESORDERID
            , SALESREASONID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'SALESORDERHEADERSALESREASON') }}
    )

    , renomearMotivoVendaLigacao AS (
        SELECT
            CAST(SALESORDERID AS INT) AS pk_idPedido
         ,  CAST(SALESREASONID AS INT) AS fk_idMotivoVenda
        FROM fonteMotivoVendaLigacao
    )

    SELECT *
    FROM renomearMotivoVendaLigacao


        