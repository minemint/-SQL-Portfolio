SELECT AVG(sales) AS snacks_sales_average
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
AND EXTRACT('year' from order_date) <= 2017
AND category = 'Snacks';