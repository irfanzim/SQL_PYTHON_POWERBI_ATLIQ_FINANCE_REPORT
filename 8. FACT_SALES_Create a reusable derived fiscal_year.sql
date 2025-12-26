/*
View Name:
  vw_fact_sales_monthly_fy
Purpose:
  Provide a clean, reusable version of fact_sales_monthly that includes
  the official fiscal_year derived from date (FY starts in September).

Fiscal Year Rule:
  - If MONTH(date) >= 9 (Sep–Dec): fiscal_year = YEAR(date) + 1
  - Else (Jan–Aug):               fiscal_year = YEAR(date)
  

Why:
  This creates a consistent fiscal_year key that can be used to join
  to tables like gross_price(product_code, fiscal_year) and for FY reporting.
*/
CREATE OR REPLACE VIEW vw_fact_sales_monthly_fy AS
SELECT
	f.*,
	CASE 
		WHEN MONTH(F.DATE)>=9 THEN YEAR(F.DATE)+1 
        ELSE YEAR(F.DATE)
	END AS FISCAL_YEAR
FROM
	gdb041.fact_sales_monthly f;