WITH 
    motivoVenda AS (
        SELECT 
              motivoligacao.PK_IDPEDIDO
            , motivovenda.motivovenda
            , motivovenda.tipoMotivoVenda
        FROM {{ ref('stg_motivovenda') }}  AS motivovenda
        JOIN {{ ref('stg_motivovendaligacao') }} AS motivoligacao
            ON motivovenda.pk_idMotivoVenda = motivoligacao.fk_idMotivoVenda
    )

    

SELECT * 
FROM motivoVenda