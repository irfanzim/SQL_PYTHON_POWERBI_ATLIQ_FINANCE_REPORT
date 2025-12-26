/*
Purpose:
  Quickly check whether the combination of
    - date (monthly)
    - product_code
    - customer_code
  produces duplicate rows.

Logic:
  - Group by the suspected grain
  - Return only combinations that appear more than once

Interpretation:
  - If this query returns NO rows → grain is valid
  - If it returns rows → table has finer grain or duplicates
*/



SELECT
    `date`,
    product_code,
    customer_code,
    count(*) as count_rows
FROM fact_forecast_monthly
GROUP BY
    `date`,
    product_code,
    customer_code
HAVING count_rows>1
