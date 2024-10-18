WITH 
    fontePessoa AS (
        SELECT
                BUSINESSENTITYID
              , FIRSTNAME
              , LASTNAME
              , PERSONTYPE
            --, NAMESTYLE
            --, TITLE
            --, MIDDLENAME
            --, SUFFIX
            --, EMAILPROMOTION
            --, ADDITIONALCONTACTINFO
            --, DEMOGRAPHICS
            --, ROWGUID
            --, MODIFIEDDATE
        FROM {{ source('source_adventureworks', 'PERSON') }} AS person
    )

  , renomearPessoa AS (
        SELECT
              CAST(BUSINESSENTITYID AS INT) AS pk_idContatoNegocio
            , CONCAT(FIRSTNAME,' ', LASTNAME) AS nomePessoa
            , CASE
                when persontype = 'SC' then 'Contato de Loja'
                when persontype = 'IN' then 'Cliente Individual'
                when persontype = 'SP' then 'Vendedor'
                when persontype = 'EM' then 'Funcionário'
                when persontype = 'VC' then 'Fornecedor'
                when persontype = 'GC' then 'Contato Geral'
             END AS tipoPessoa
        FROM fontePessoa
    )

SELECT *
FROM renomearPessoa

