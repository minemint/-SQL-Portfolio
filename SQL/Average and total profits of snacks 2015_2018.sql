SELECT EXTRACT('year' from order_date) as order_year,
	AVG(profit) AS profit_avg,
	SUM(profit) AS total_profit
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
AND EXTRACT('year' from order_date) <= 2018
AND category = 'Snacks'
GROUP BY order_year;