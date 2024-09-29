CREATE TABLE keepcoding.Ejercicio7 AS
WITH customer_info AS 
  (SELECT
  ivr_id,
  billing_account_id  AS customer_info
     
  FROM
    `keepcoding.ivr_steps`

  WHERE billing_account_id <> 'UNKNOWN'
)
SELECT
  id.calls_ivr_id,
  ci.customer_info AS billing_account_id
FROM
  `keepcoding.ivr_detail` id
JOIN
  customer_info ci
ON
  id.calls_ivr_id = ci.ivr_id;