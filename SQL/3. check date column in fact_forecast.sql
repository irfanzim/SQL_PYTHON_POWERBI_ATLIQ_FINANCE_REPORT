#check min date, max date, and disctinct date
SELECT
MIN(DATE) AS MIN_DATE,
MAX(DATE) AS MAX_DATE,
COUNT(DISTINCT DATE) AS DATE_COUNT
FROM FACT_FORECAST_MONTHLY

#check some date sample to decide whehter it is monthly or daily date
SELECT 
DISTINCT DATE
FROM FACT_FORECAST_MONTHLY
LIMIT 20
