/*
Purpose: 
Validate that post_invoice_deduction has exactly one record
  per (product_code, customer_code, fiscal_year)
if the query returns no rows than it is validated.

*/

SELECT 
	`date`,
    customer_code,
    product_code,
    count(*) as count_row
FROM 
	gdb056.post_invoice_deductions
GROUP BY
	CUSTOMER_CODE, PRODUCT_CODE, `DATE`
HAVING
	COUNT_ROW>1


/*
Purpose: 
Check the number scale of discount_pct
*/
SELECT 
	min(discounts_pct) as min_dis,
    max(discounts_pct) as max_dis,
    avg(discounts_pct) as avg_dis
FROM 
	gdb056.post_invoice_deductions
    
/*
Purpose: 
Check the number scale of other discount_pct
*/
SELECT 
	min(other_deductions_pct) as min_dis,
    max(other_deductions_pct) as max_dis,
    avg(other_deductions_pct) as avg_dis
FROM 
	gdb056.post_invoice_deductions