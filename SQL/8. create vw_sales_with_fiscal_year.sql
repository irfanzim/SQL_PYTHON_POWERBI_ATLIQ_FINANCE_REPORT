/*
View Name:
  vw_sales_with_fiscal_year
Purpose:
  Provide a clean, reusable version of vw_actual_forecast_sales that includes
  the official fiscal_year derived from date (FY starts in September).

Fiscal Year Rule:
  - If MONTH(date) >= 9 (Sep–Dec): fiscal_year = YEAR(date) + 1
  - Else (Jan–Aug):               fiscal_year = YEAR(date)
  
*/
CREATE OR REPLACE VIEW vw_sales_with_fiscal_year AS
SELECT
	f.*,
	CASE 
		WHEN MONTH(F.DATE)>=9 THEN YEAR(F.DATE)+1 
        ELSE YEAR(F.DATE)
	END AS FISCAL_YEAR
FROM
	gdb041.vw_actual_forcast_sales f;