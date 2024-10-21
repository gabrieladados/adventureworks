WITH 
    fontePedidos AS (
        SELECT 
              vendaHeader.pk_idPedido
            , produto.pk_idProduto
            , cliente.pk_idCliente
            , tipoCartao.pk_idTipoCartao
            , motivoVenda.fk_idMotivoVenda
            , vendaHeader.statusPedido
            , endereco.pk_idEndereco
            , vendaHeader.dataCompra
            , vendaDetalhes.ORDERQTY AS quantidadeComprada
            , SUM(vendaDetalhes.UNITPRICE*vendaDetalhes.ORDERQTY) AS valorTotalNegociado
            , SUM(vendaDetalhes.UNITPRICE*vendaDetalhes.ORDERQTY- (1-vendaDetalhes.UNITPRICEDISCOUNT)) AS valorTotalNegociadoLiquido


        FROM {{ source('source_adventureworks', 'SALESORDERDETAIL') }} AS vendaDetalhes
        JOIN {{ ref('stg_statuspedido') }} AS vendaHeader
            ON vendaDetalhes.SALESORDERID = vendaHeader.pk_idPedido

        JOIN {{ ref('stg_produto') }} AS produto
            ON vendaDetalhes.PRODUCTID = produto.pk_idProduto

        JOIN {{ ref('stg_cliente') }} AS cliente
            ON vendaHeader.fk_idCliente = cliente.pk_idCliente

        JOIN {{ ref('stg_tipocartao') }} AS tipoCartao
            ON vendaHeader.fk_idTipoCartao = tipoCartao.pk_idTipoCartao

        JOIN {{ ref('stg_cidade') }} AS endereco
            ON vendaHeader.fk_idEndereco = endereco.pk_idEndereco

        JOIN {{ ref('stg_motivovenda') }} AS motivoVenda
            ON vendaHeader.pk_idPedido = motivoVenda.fk_idPedido

        JOIN {{ ref('stg_tempo') }} AS tempo
            ON vendaHeader.dataCompra = tempo.data_completa


        GROUP BY 
              vendaHeader.pk_idPedido
            , produto.pk_idProduto
            , cliente.pk_idCliente
            , tipoCartao.pk_idTipoCartao
            , motivoVenda.fk_idMotivoVenda
            , vendaHeader.statusPedido
            , endereco.pk_idEndereco
            , vendaHeader.dataCompra
            , vendaDetalhes.ORDERQTY
) 

SELECT *
FROM fontePedidos