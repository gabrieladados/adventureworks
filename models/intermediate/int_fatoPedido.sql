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
            , vendaDetalhes.quantidadePedido 
            , SUM(vendaDetalhes.precoUnitario*vendaDetalhes.quantidadePedido) AS valorTotalNegociado
            , SUM(vendaDetalhes.precoUnitario*vendaDetalhes.quantidadePedido- (1-vendaDetalhes.descontoUnitario)) AS valorTotalNegociadoLiquido


        FROM {{ ref('stg_fatoPedido') }} AS vendaDetalhes
        JOIN {{ ref('stg_statuspedido') }} AS vendaHeader
            ON vendaDetalhes.pk_idPedido = vendaHeader.pk_idPedido

        JOIN {{ ref('stg_produto') }} AS produto
            ON vendaDetalhes.fk_idProduto = produto.pk_idProduto

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
            , vendaDetalhes.quantidadePedido 
) 

SELECT *
FROM fontePedidos