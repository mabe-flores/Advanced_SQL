CREATE TABLE keepcoding.Ejercicio5 AS
  
  WITH customer_info_id AS 
  (SELECT
   ivr_id,
    document_type, 
    document_identification
  FROM
      `keepcoding.ivr_steps`
    
    
  WHERE document_type <> 'UNKNOWN' AND  document_identification <> 'UNKNOWN'

  )

SELECT
  id.calls_ivr_id,
  ci.document_type AS document_type,
  ci.document_identification AS document_identification
FROM
  `keepcoding.ivr_detail` id
JOIN
  customer_info_id ci
ON
  id.calls_ivr_id = ci.ivr_id;