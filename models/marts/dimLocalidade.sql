WITH
    dimLocalidade AS (
        SELECT *
        FROM {{ ref('int_localidade') }}
    )

SELECT *
FROM dimLocalidade