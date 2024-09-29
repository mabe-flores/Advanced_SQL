CREATE TABLE keepcoding.Ejercicio6 AS
WITH customer_info AS (
  SELECT 
    ivr_id,
    customer_phone AS customer_info
  FROM
    `keepcoding.ivr_steps`

  WHERE customer_phone <> 'UNKNOWN' 
)
SELECT
  id.calls_ivr_id,
  ci.customer_info AS customer_phone
FROM
  `keepcoding.ivr_detail` id
JOIN
  customer_info ci
ON
  id.calls_ivr_id= ci.ivr_id;