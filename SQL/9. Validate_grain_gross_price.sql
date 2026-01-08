/*
Purpose:
  Validate that gross_price has exactly one record
  per (product_code, fiscal_year).

Why this matters:
  - Confirms correct grain of the gross_price table
  - Ensures safe joining with fact_forecast_monthly
  - Prevents revenue duplication

Interpretation:
  - If this query returns NO rows:
      Grain is (product_code, fiscal_year)
  - If rows are returned:
      Duplicate pricing records exist and must be resolved
*/
select 
	product_code,
    fiscal_year,
    count(*) as row_count
from
	gdb056.gross_price
group by
	product_code,
    fiscal_year
Having
	row_count>1
	