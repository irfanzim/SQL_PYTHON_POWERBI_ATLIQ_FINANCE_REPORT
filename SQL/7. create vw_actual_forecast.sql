CREATE or REPLACE view vw_actual_forcast_sales AS
SELECT 
	`date`,
    product_code,
    market,
    customer_code,
    sold_quantity as quantity,
    "Actual" as sales_type
FROM gdb041.fact_sales_monthly

union all

SELECT 
	`date`,
    product_code,
    market,
    customer_code,
    forecast_quantity as quantity,
    "Forecast" as sales_type
FROM gdb041.fact_forecast_monthly
where `date`>(
	select
		lastsalesdate
	from
		vw_lastsalesdate)