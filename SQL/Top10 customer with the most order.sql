SELECT customer_name, COUNT(*) AS total_order
FROM supermart
GROUP BY customer_name
ORDER BY total_order DESC
LIMIT 10;