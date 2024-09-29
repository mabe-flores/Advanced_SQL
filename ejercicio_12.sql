CREATE OR REPLACE TABLE keepcoding.ivr_summary AS
SELECT
  id.calls_ivr_id,
  id.calls_phone_number,
  id.calls_ivr_result,
  ej4.vdn_aggregation,
  id.calls_start_date,
  id.calls_end_date,
  id.calls_total_duration,
  id.calls_customer_segment,
  id.calls_ivr_language,
  id.calls_steps_module,
  id.calls_module_aggregation,
  ej5.document_type,
  ej5.document_identification,
  ej6.customer_phone,
  ej7.billing_account_id,
  ej8.masiva_lg,
  ej9.info_by_phone_lg,
  ej10.info_by_dni_lg,
  ej11.repeated_phone_24H,
  ej11.cause_recall_phone_24H

FROM
  `keepcoding.ivr_detail` id

LEFT JOIN 
    `keepcoding.Ejercicio4` ej4
ON  id.calls_ivr_id = ej4.calls_ivr_id
LEFT JOIN 
     `keepcoding.Ejercicio5` ej5
ON  id.calls_ivr_id = ej5.calls_ivr_id
LEFT JOIN 
    `keepcoding.Ejercicio6` ej6
ON  id.calls_ivr_id = ej6.calls_ivr_id
LEFT JOIN 
    `keepcoding.Ejercicio7` ej7
ON  id.calls_ivr_id = ej7.calls_ivr_id
LEFT JOIN 
    `keepcoding.Ejercicio8` ej8
ON  id.calls_ivr_id = ej8.calls_ivr_id
LEFT JOIN 
    `keepcoding.Ejercicio9` ej9
ON  id.calls_ivr_id = ej9.calls_ivr_id
LEFT JOIN 
    `keepcoding.Ejercicio10` ej10
ON  id.calls_ivr_id = ej10.calls_ivr_id
LEFT JOIN 
    `keepcoding.Ejercicio11` ej11
ON  id.calls_ivr_id = ej11.calls_ivr_id