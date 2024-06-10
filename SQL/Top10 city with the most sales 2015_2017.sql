SELECT city, SUM(sales) as total_sales
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
AND EXTRACT('year' from order_date) <= 2017
GROUP BY city
ORDER BY total_sales DESC
LIMIT 10;