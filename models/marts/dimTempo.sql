WITH
    dimTempo AS (
        SELECT *
        FROM {{ ref('int_tempo') }}
    )

SELECT *
FROM dimTempo