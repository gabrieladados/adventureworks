WITH 

    fonteCategoriaProduto AS(
        SELECT 
              PRODUCTCATEGORYID
            , NAME
            --, ROWGUID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'PRODUCTCATEGORY') }}
    )

    , renomearCategoriaProduto AS (
        SELECT 
              CAST(PRODUCTCATEGORYID AS INT) AS pk_idCategoriaProduto
            , CAST(NAME AS VARCHAR) AS nomeCategoriaProduto
        FROM fonteCategoriaProduto
    )

    SELECT *
    FROM renomearCategoriaProduto



