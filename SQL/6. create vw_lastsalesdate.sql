/*
Purpose: to create a view to get last_sales_date from fact_sales_monthly
*/
Create or Replace view vw_lastsalesdate as
SELECT
	max(`date`)as lastsalesdate
FROM
	gdb041.fact_sales_monthly
