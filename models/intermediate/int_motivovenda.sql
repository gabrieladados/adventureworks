WITH 
    motivoVenda AS (
        SELECT 
              UUID_STRING() AS unique_id
            , motivoligacao.pk_idPedido AS id_pedido
            , motivovenda.motivovenda
            , motivovenda.tipoMotivoVenda
        FROM {{ ref('stg_motivovenda') }}  AS motivovenda
        JOIN {{ ref('stg_motivovendaligacao') }} AS motivoligacao
            ON motivovenda.pk_idMotivoVenda = motivoligacao.fk_idMotivoVenda
    )

    

SELECT * 
FROM motivoVenda