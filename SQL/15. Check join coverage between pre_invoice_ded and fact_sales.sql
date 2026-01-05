/*
Purpose:
  Validate that join converage between fact_sales and pre_invoice_deduction by using keys
  (customer_code, fiscal_year).
  if the query return no unmatched rows, than it is perfectly aligned.
*/
SELECT 
	count(*) as fact_rows,
    sum(case when pid.pre_invoice_discount_pct is not null then 1 else 0 end) as matched_rows,
    sum(case when pid.pre_invoice_discount_pct is null then 1 else 0 end) as unmatched_rows
FROM 
	gdb041.vw_fact_sales_monthly_fy f
left join 
	gdb056.pre_invoice_deductions pid
	on f.customer_code=pid.customer_code and
    f.fiscal_year=pid.fiscal_year