/*
Purpose: Check join coverage between vw_sales_with_fiscal_year and gross price by using the
key product_code, and fiscal year
Unmatched rows will indicate missing product_code or fiscal year.
*/
SELECT
	count(*) as fact_rows,
    SUM(CASE WHEN g.gross_price is not null then 1 else 0 end) as matched_rows,
    SUM(CASE WHEN g.gross_price is null then 1 else 0 end) as unmatched_rows
FROM
	gdb041.vw_sales_with_fiscal_year f
LEFT JOIN 
	gdb056.gross_price g
on f.product_code=g.product_code and f.fiscal_year=g.fiscal_year