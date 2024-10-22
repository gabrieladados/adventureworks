WITH 
    fontePedidos AS (
        SELECT 
              UUID_STRING() AS unique_id
            , vendaHeader.pk_idPedido
            , vendaDetalhes.pk_idPedidoDetalhe
            , vendaHeader.dataCompra
            , produto.pk_idProduto
            , cliente.pk_idCliente
            , tipoCartao.pk_idTipoCartao
            , vendaHeader.statusPedido
            , endereco.pk_idEndereco
            , CAST(vendaDetalhes.quantidadePedido AS DECIMAL(10,4)) AS quantidadePedido
            , CAST(vendaDetalhes.precoUnitario AS DECIMAL(10,4)) AS precoUnitario
            , vendaDetalhes.descontoUnitario
        FROM {{ ref('stg_salesorderdetail') }} AS vendaDetalhes
        JOIN {{ ref('stg_salesorderheader') }} AS vendaHeader
            ON vendaDetalhes.pk_idPedido = vendaHeader.pk_idPedido
        LEFT JOIN {{ ref('stg_produto') }} AS produto
            ON vendaDetalhes.fk_idProduto = produto.pk_idProduto
        LEFT JOIN {{ ref('stg_cliente') }} AS cliente
            ON vendaHeader.fk_idCliente = cliente.pk_idCliente
        LEFT JOIN {{ ref('stg_tipocartao') }} AS tipoCartao
            ON vendaHeader.fk_idTipoCartao = tipoCartao.pk_idTipoCartao
        LEFT JOIN {{ ref('stg_cidade') }} AS endereco
            ON vendaHeader.BILLTOADDRESSID = endereco.pk_idEndereco
    ) 

SELECT *
FROM fontePedidos
