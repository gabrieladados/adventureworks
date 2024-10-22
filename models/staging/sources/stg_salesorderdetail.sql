WITH 
    fonteSalesDetail AS (
        SELECT 
              SALESORDERID
            , SALESORDERDETAILID
            , PRODUCTID
            , ORDERQTY 
            , UNITPRICE 
            , UNITPRICEDISCOUNT 
        FROM {{ source('source_adventureworks', 'SALESORDERDETAIL') }} AS vendaDetalhes

) 


    , renomearSalesDetail AS (
         SELECT 
              CAST(SALESORDERID AS INT) AS pk_idPedido
            , CAST(SALESORDERDETAILID AS INT) AS pk_idPedidoDetalhe
            , CAST(PRODUCTID AS INT) AS fk_idProduto
            , CAST(ORDERQTY AS INT) AS quantidadePedido
            , CAST(UNITPRICE AS DECIMAL(10, 4)) AS precoUnitario
            , CAST(UNITPRICEDISCOUNT AS DECIMAL(10, 4)) AS descontoUnitario
        FROM fonteSalesDetail
    )

SELECT *
FROM renomearSalesDetail