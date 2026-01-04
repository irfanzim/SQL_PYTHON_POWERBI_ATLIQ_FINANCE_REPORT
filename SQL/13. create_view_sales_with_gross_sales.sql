/*
view name: vw_sales_with_gross_sales
Purpose: Enrich fact_sales data with gross_price and gross_sales
by using the key product_code, and fiscal_year

Here, gross_sales= sold_quantity*gross_price
*/

CREATE OR REPLACE VIEW vw_sales_with_gross_sales as
SELECT
	f.*,
    g.gross_price,
    (f.sold_quantity*g.gross_price) as gross_sales
FROM
	gdb041.vw_fact_sales_monthly_fy f
JOIN
	gdb056.gross_price g
on f.product_code=g.product_code and f.fiscal_year=g.fiscal_year
