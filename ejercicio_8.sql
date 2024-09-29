CREATE TABLE keepcoding.Ejercicio8 AS
SELECT
  id.calls_ivr_id,
   CASE WHEN EXISTS (
    SELECT 1
    FROM `keepcoding.ivr_modules` im
    WHERE id.calls_ivr_id = im.ivr_id AND im.module_name = 'AVERIA_MASIVA' 
  ) 
  THEN 1 ELSE 0 END AS masiva_lg
FROM
  `keepcoding.ivr_detail` id;