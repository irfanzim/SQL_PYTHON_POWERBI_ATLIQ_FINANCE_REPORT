/*
Purpose:
  Validate that pre_invoice_deduction has exactly one record
  per (customer_code, fiscal_year).
  if the query return no rows, than grain is customer_code, fiscal_year
  otherwise need rework
*/
SELECT 
	CUSTOMER_CODE,
    FISCAL_YEAR,
    COUNT(*) AS COUNT_ROW
FROM gdb056.pre_invoice_deductions
group by CUSTOMER_CODE, FISCAL_YEAR
HAVING COUNT_ROW>1

/*
Purpose:
  check the numeric scale of pre_invoice_discount_pct.
*/

SELECT
    MIN(pre_invoice_discount_pct) AS min_pct,
    MAX(pre_invoice_discount_pct) AS max_pct,
    AVG(pre_invoice_discount_pct) AS avg_pct
FROM gdb056.pre_invoice_deductions;
