CREATE TABLE keepcoding.Ejercicio9 AS
SELECT
  id.calls_ivr_id,
  CASE WHEN steps.step_name = 'CUSTOMERINFOBYPHONE.TX' AND steps.step_result = 'OK' THEN 1
  ELSE
   0
  END AS info_by_phone_lg   
FROM
  `keepcoding.ivr_detail` id
JOIN
`keepcoding.ivr_steps` steps
ON 
id.calls_ivr_id = steps.ivr_id;