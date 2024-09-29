CREATE TABLE keepcoding.Ejercicio4 AS
WITH label_info AS (
  SELECT
    ivr_id,
    vdn_label,
    CASE
      WHEN vdn_label LIKE 'ATC%' THEN 'FRONT'
      WHEN vdn_label LIKE 'TECH%' THEN 'TECH'
      WHEN vdn_label LIKE 'ABSORPTION' THEN 'ABSORPTION'
      ELSE 'RESTO'
    END AS vdn_aggregation
  FROM
    `keepcoding.ivr_calls`
)

SELECT
  id.calls_ivr_id,
  li.vdn_aggregation AS vdn_aggregation
FROM
  `keepcoding.ivr_detail` id
JOIN
  label_info li
ON
  id.calls_ivr_id = li.ivr_id;