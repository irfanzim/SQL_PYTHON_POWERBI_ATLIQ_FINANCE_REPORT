/*
view name: vw_gross_sales
Purpose: Enrich vw_sales_with_fiscal_year data with gross_price and gross_sales
by using the key product_code, and fiscal_year

Here, gross_sales= sold_quantity*gross_price
*/

CREATE OR REPLACE VIEW vw_gross_sales as
SELECT
	f.*,
    g.gross_price,
    (f.quantity*g.gross_price) as gross_sales
FROM
	gdb041.vw_sales_with_fiscal_year f
JOIN
	gdb056.gross_price g
on f.product_code=g.product_code and f.fiscal_year=g.fiscal_year
