/*
Purpose: 
Create view to get net_sales by joining vw_sales_with_net_invoice_sales with post_invoice_deductions
by using keys(customer_code, product_code, date)
net_sales=net_invoice_sales*(1-discount_pct-other_deduction_pct)
coalesce is done to avoid null value
*/
create or replace view vw_sales_with_net_sales as 
SELECT 
	nis.*,
    COALESCE(pod.discounts_pct,0) as discounts_pct,
    coalesce(other_deductions_pct,0)as other_ded_pct,
    nis.net_invoice_sales*(1-pod.discounts_pct-pod.other_deductions_pct) as net_sales  
FROM 
	gdb041.vw_sales_with_net_invoice_sales nis
LEFT JOIN
	gdb056.post_invoice_deductions pod
on
	pod.customer_code=nis.customer_code and
    pod.product_code=nis.product_code and
    pod.`date`=nis.`date`