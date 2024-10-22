WITH 

    fonteTipoCartao AS(
        SELECT 
              CREDITCARDID
            , CARDTYPE
            --, CARDNUMBER
            --, EXPMONTH
            --, EXPYEAR
            --, MODIFIEDDATE          
        FROM {{ source('source_adventureworks', 'CREDITCARD') }}
    )

    , renomearTipoCartao AS (
        SELECT 
              CAST(CREDITCARDID AS INT) AS PK_idTipoCartao
            , CAST(CARDTYPE AS VARCHAR) AS tipoCartao
        FROM fonteTipoCartao
    )

    SELECT *
    FROM renomearTipoCartao



