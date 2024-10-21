WITH 
    fonteFato AS (
        SELECT 
              SALESORDERID
            , PRODUCTID
            , ORDERQTY 
            , UNITPRICE
            , UNITPRICEDISCOUNT 
        FROM {{ source('source_adventureworks', 'SALESORDERDETAIL') }} AS vendaDetalhes

) 
    , renomearFonteFato AS (
         SELECT 
              CAST(SALESORDERID AS INT) AS pk_idPedido
            , CAST(PRODUCTID AS INT) AS fk_idProduto
            , CAST(ORDERQTY AS INT) AS quantidadePedido
            , CAST(UNITPRICE AS DECIMAL(10, 2)) AS precoUnitario
            , CAST(UNITPRICEDISCOUNT AS DECIMAL(10, 3)) AS descontoUnitario
        FROM fonteFato
    )

SELECT *
FROM renomearFonteFato