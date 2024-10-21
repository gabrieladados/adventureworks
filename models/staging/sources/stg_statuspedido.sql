WITH
    fonteStatusPedido AS (
        SELECT 
              SALESORDERID
            , CASE 
                WHEN STATUS = 1 THEN 'Em andamento'
                WHEN STATUS = 2 THEN 'Aprovado'
                WHEN STATUS = 3 THEN 'Em atraso'
                WHEN STATUS = 4 THEN 'Rejeitado'
                WHEN STATUS = 5 THEN 'Enviado'
                WHEN STATUS = 6 THEN 'Cancelado'
              END AS STATUSPEDIDO
            --, REVISIONNUMBER
            --, ORDERDATE
            --, DUEDATE
            --, SHIPDATE
            --, ONLINEORDERFLAG
            --, PURCHASEORDERNUMBER
            --, ACCOUNTNUMBER
            --, CUSTOMERID
            --, SALESPERSONID
            --, TERRITORYID
            --, BILLTOADDRESSID
            --, SHIPTOADDRESSID
            --, SHIPMETHODID
            --, CREDITCARDID
            --, CREDITCARDAPPROVALCODE
            --, CURRENCYRATEID
            --, SUBTOTAL
            --, TAXAMT
            --, FREIGHT
            --, TOTALDUE
            --, COMMENT
            --, ROWGUID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'SALESORDERHEADER') }}
    )

    , renomearStatusPedido AS (
        SELECT 
              CAST(SALESORDERID AS INT) AS pk_idPedido
            , CAST(STATUSPEDIDO AS VARCHAR) AS statusPedido
        FROM fonteStatusPedido
    )

SELECT * 
FROM renomearStatusPedido  