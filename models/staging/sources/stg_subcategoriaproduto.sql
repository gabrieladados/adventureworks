WITH 

    fonteSubcategoriaProduto AS(
        SELECT 
              PRODUCTSUBCATEGORYID
            , PRODUCTCATEGORYID
            , NAME
            --, ROWGUID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'PRODUCTSUBCATEGORY') }}
    )

    , renomearSubcategoriaProduto AS (
        SELECT 
              CAST(PRODUCTSUBCATEGORYID AS INT) AS PK_idSubcategoriaProduto
            , CAST(PRODUCTCATEGORYID AS INT) AS FK_idCategoriaProduto
            , CAST(NAME AS VARCHAR) AS nomeCategoriaProduto
        FROM fonteSubcategoriaProduto
    )

    SELECT *
    FROM renomearSubcategoriaProduto


