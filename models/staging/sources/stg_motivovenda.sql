WITH 

    fonteMotivoVenda AS(
        SELECT 
              SALESREASONID
            , NAME
            , REASONTYPE
            --, MODIFIEDDATE          
        FROM {{ source('source_adventureworks', 'SALESREASON') }}
    )

    , fonteMotivoVendaLigacao AS(
        SELECT 
              SALESORDERID
            , SALESREASONID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'SALESORDERHEADERSALESREASON') }}
    )


    , renomearMotivoVenda AS (
        SELECT 
              CAST(MotivoVendaLigacao.SALESORDERID AS INT) AS fk_idPedido
            , CAST(motivoVenda.SALESREASONID AS INT) AS fk_idMotivoVenda
            , CAST(motivoVenda.NAME AS VARCHAR) AS motivoVenda
            , CAST(motivoVenda.REASONTYPE AS VARCHAR) AS tipoMotivoVenda
        FROM fonteMotivoVendaLigacao AS motivoVendaLigacao
        JOIN fonteMotivoVenda AS motivoVenda
            ON motivoVendaLigacao.SALESREASONID = motivoVenda.SALESREASONID
    )

    SELECT *
    FROM renomearMotivoVenda



