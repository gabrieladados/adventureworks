WITH 
    fonteCliente AS (
    SELECT
          CUSTOMERID 
        , PERSONID 
        --STOREID 
        --TERRITORYID 
        --ROWGUID 
        --MODIFIEDDATE
    FROM {{ source('source_adventureworks', 'CUSTOMER') }} AS cust
)

  , renomearCliente AS (
        SELECT
          CAST(CUSTOMERID AS INT) AS pk_idCliente
        , CAST(PERSONID AS INT) AS fk_idPessoa
        FROM fonteCliente
    )

SELECT *
FROM renomearCliente
