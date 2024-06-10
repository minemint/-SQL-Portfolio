SELECT Category, sum(sales) AS total_sales
FROM supermart
GROUP BY Category
ORDER BY total_sales DESC