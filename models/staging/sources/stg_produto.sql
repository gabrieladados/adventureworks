WITH 

    fonteProduto AS(
        SELECT 
              PRODUCTID
            , PRODUCTSUBCATEGORYID
            , NAME
            , SELLSTARTDATE
            , SELLENDDATE
            --, DISCONTINUEDDATE
            --, PRODUCTNUMBER
            --, MAKEFLAG
            --, FINISHEDGOODSFLAG
            --, COLOR
            --, SAFETYSTOCKLEVEL
            --, REORDERPOINT
            --, STANDARDCOST
            --, LISTPRICE
            --, SIZE
            --, SIZEUNITMEASURECODE
            --, WEIGHTUNITMEASURECODE
            --, WEIGHT
            --, DAYSTOMANUFACTURE
            --, PRODUCTLINE
            --, CLASS
            --, STYLE
            --, PRODUCTSUBCATEGORYID
            --, PRODUCTMODELID
            --, ROWGUID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'PRODUCT') }}
    )

    , renomearProduto AS (
        SELECT 
              CAST(PRODUCTID AS INT) AS pk_idProduto
            , CAST(PRODUCTSUBCATEGORYID AS INT) AS fk_idSubcategoriaProduto
            , CAST(NAME AS VARCHAR) AS nomeProduto
            , CAST(SELLSTARTDATE AS DATE) AS dataInicioVenda
            , CAST(SELLENDDATE AS DATE) AS dataFimVenda
        FROM fonteProduto
    )

    SELECT *
    FROM renomearProduto

