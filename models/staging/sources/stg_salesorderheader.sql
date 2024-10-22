WITH
    fonteSalesOrderHeader AS (
        SELECT 
              SALESORDERID
            , ORDERDATE
            , CUSTOMERID
            , SHIPTOADDRESSID
            , CREDITCARDID
            , CASE 
                WHEN STATUS = 1 THEN 'Em andamento'
                WHEN STATUS = 2 THEN 'Aprovado'
                WHEN STATUS = 3 THEN 'Em atraso'
                WHEN STATUS = 4 THEN 'Rejeitado'
                WHEN STATUS = 5 THEN 'Enviado'
                WHEN STATUS = 6 THEN 'Cancelado'
              END AS STATUSPEDIDO
            --, REVISIONNUMBER
            --, DUEDATE
            --, SHIPDATE
            --, ONLINEORDERFLAG
            --, PURCHASEORDERNUMBER
            --, ACCOUNTNUMBER
            , SALESPERSONID
            , TERRITORYID
            , BILLTOADDRESSID
            --, SHIPMETHODID
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

    , renomearSalesOrderHeader AS (
        SELECT 
              CAST(SALESORDERID AS INT) AS pk_idPedido
            , CAST(STATUSPEDIDO AS VARCHAR) AS statusPedido
            , CAST(CUSTOMERID AS INT) AS fk_idCliente
            , CAST(SHIPTOADDRESSID AS INT) AS fk_idEndereco
            , CAST(CREDITCARDID AS INT) AS fk_idTipoCartao
            , CAST(ORDERDATE AS DATE) AS dataCompra
            , SALESPERSONID
            , TERRITORYID
            , BILLTOADDRESSID
        FROM fonteSalesOrderHeader
    )

SELECT * 
FROM renomearSalesOrderHeader  