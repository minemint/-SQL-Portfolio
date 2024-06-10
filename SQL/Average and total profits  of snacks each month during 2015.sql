SELECT EXTRACT('year' from order_date) as order_year,
	EXTRACT('month' from order_date) as order_month,
	AVG(profit) AS profit_avg,
	SUM(profit) AS total_profit
FROM supermart
WHERE EXTRACT('year' from order_date) = 2015
AND category ='Snacks'
GROUP BY order_year, order_month;