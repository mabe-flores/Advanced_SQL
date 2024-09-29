CREATE TABLE keepcoding.Ejercicio11 AS
WITH call_times AS (
  SELECT
    ivr_id,
    phone_number,
    TIMESTAMP_TRUNC(start_date, HOUR) AS call_hour    
  FROM
    `keepcoding.ivr_calls`
)

SELECT
  id.calls_ivr_id,
  id.calls_phone_number,
    
  --llamadas en las 24 horas anteriores
  CASE WHEN EXISTS (
    SELECT 1
    FROM call_times ct
    WHERE id.calls_phone_number = ct.phone_number
      AND ct.call_hour BETWEEN TIMESTAMP_SUB(id.calls_start_date, INTERVAL 24 HOUR) AND id.calls_start_date
    ) THEN 1 ELSE 0 END AS repeated_phone_24H,
  
  --llamadas en las 24 horas siguientes
  CASE WHEN EXISTS (
    SELECT 1
    FROM call_times ct
    WHERE id.calls_phone_number = ct.phone_number
      AND ct.call_hour BETWEEN id.calls_start_date AND TIMESTAMP_ADD(id.calls_start_date, INTERVAL 24 HOUR)
  ) THEN 1 ELSE 0 END AS cause_recall_phone_24H

FROM
  `keepcoding.ivr_detail` id;