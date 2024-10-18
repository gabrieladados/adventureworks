WITH 
    produto AS (
        SELECT *
        FROM {{ ref('stg_produto') }} AS prod
        LEFT JOIN {{ ref('stg_subcategoriaproduto') }} AS prod_sub
        ON prod.fk_idSubcategoriaProduto = prod_sub.PK_idSubcategoriaProduto
        LEFT JOIN {{ ref('stg_categoriaproduto') }} AS prod_cat
        ON prod_sub.FK_idCategoriaProduto = prod_cat.pk_idCategoriaProduto
    )

SELECT 
      pk_idProduto
    , nomeProduto
    , nomeCategoriaProduto
    , nomeSubcategoriaProduto
FROM produto