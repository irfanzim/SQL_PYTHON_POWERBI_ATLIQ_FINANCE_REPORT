/*
Purpose:
	To check the amount of rows where gross price fiscal year is matching
    with fact_sales_fiscal (calender year vs calender year+1)
    
Why:
  gross_price fiscal years are 2018–2022, while fact dates span 2017-09 to 2021-12.

Approach:
  Compare two common rules:
    A) fiscal_year = YEAR(date)
    B) fiscal_year = YEAR(date) + 1

Interpretation:
  The rule with the higher matched_rows could be the correct mapping to use for joins.
*/

SELECT
	rule_name,
    count(*) as total_rows,
    sum(is_matched) as fact_matched
FROM(
SELECT
    'A_calendar_year' AS rule_name,
    f.`date`,
    f.product_code,
    CASE WHEN gp.product_code IS NULL THEN 0 ELSE 1 END AS is_matched
FROM gdb041.fact_sales_monthly f
LEFT JOIN gdb056.gross_price gp
    ON gp.product_code = f.product_code
   AND gp.fiscal_year = YEAR(f.`date`)

union all

SELECT
    'year_plus_1' AS rule_name,
    f.`date`,
    f.product_code,
    CASE WHEN gp.product_code IS NULL THEN 0 ELSE 1 END AS is_matched
FROM gdb041.fact_sales_monthly f
LEFT JOIN gdb056.gross_price gp
    ON gp.product_code = f.product_code
   AND gp.fiscal_year = YEAR(f.`date`) + 1
) AS FACT
group by rule_name