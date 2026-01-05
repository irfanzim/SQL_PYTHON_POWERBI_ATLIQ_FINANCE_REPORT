/*
Purpose: 
Check the join coverage between vw_sales_with_net_invoice_sales and post_invoice_dedections
by using keys(customer_code, product_code, date)
if no rows return then there is no issue.
*/
SELECT 
	count(*) as fact_rows,
    sum(case when pod.product_code is not null then 1 else 0 end) as matched_rows,
    sum(case when pod.product_code is null then 1 else 0 end) as unmatched_rows
FROM 
	gdb041.vw_sales_with_net_invoice_sales nis
LEFT JOIN
	gdb056.post_invoice_deductions pod
on
	pod.customer_code=nis.customer_code and
    pod.product_code=nis.product_code and
    pod.`date`=nis.`date`