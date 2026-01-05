/*
Purpose: create view by adding vw_sales_with_gross_sales with pre_invoice_deduction
ADD a new column net_invoice_sales
net_invoice_sales=gross_sales*(1-pre_invoice_discount_pct)
*/
CREATE OR REPLACE VIEW vw_sales_with_net_invoice_sales AS
SELECT 
	f.*,
    pid.pre_invoice_discount_pct,
    f.gross_sales*(1-pre_invoice_discount_pct) as net_invoice_sales
FROM 
	gdb041.vw_sales_with_gross_sales f
JOIN
	gdb056.pre_invoice_deductions pid
ON
	f.customer_code=pid.customer_code AND
    f.fiscal_year=pid.fiscal_year