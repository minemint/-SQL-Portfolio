
/*
	Create table supermart
*/
CREATE TABLE supermart (
	order_id INT,
	customer_name VARCHAR(50),
	category VARCHAR(50),
	sub_category VARCHAR(50),
	city VARCHAR(50),
	order_date DATE,
	region VARCHAR(50),
	sales NUMERIC(8,2),
	discount NUMERIC(6,2),
	profit NUMERIC(6,2),
	state VARCHAR(50),
	PRIMARY KEY (order_id); 

/*
	Insert data csv to table supermart
*/

COPY supermart(order_id,customer_name,category, sub_category, city,order_date, region,sales ,discount ,profit ,state )
FROM 'C:\Users\SQL\Supermart Grocery Sales - Retail Analytics Dataset.csv'
CSV HEADER;

/*
	Check the category with the most sales
*/
SELECT Category, sum(sales) AS total_sales
FROM supermart
GROUP BY Category
ORDER BY total_sales DESC

/*
Top 10 category sales in West during 2015-2017
*/
SELECT category, SUM(sales) as total_sales
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
AND EXTRACT('year' from order_date) <= 2017
AND region  = 'West'
GROUP BY category
ORDER BY total_sales DESC
LIMIT 10;

/*
Top 10 category sales during 2015-2017
*/
SELECT category, SUM(sales) as total_sales
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
AND EXTRACT('year' from order_date) <= 2017
GROUP BY category
ORDER BY total_sales DESC
LIMIT 10;

/*
Check city most sales during 2015
*/

SELECT city, SUM(sales) as total_sales
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
GROUP BY city
ORDER BY total_sales DESC

/*
Check customer most order 
*/

SELECT customer_name, COUNT(*) AS total_order
FROM supermart
GROUP BY customer_name
ORDER BY total_order DESC


/*
	What is the average sales for Snacks during 2015-2017?
*/

SELECT AVG(sales) AS snacks_sales_average
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
AND EXTRACT('year' from order_date) <= 2017
AND category = 'Snacks';

/*
	Check the average and total profits of snacks for each month during 2015
*/

SELECT EXTRACT('year' from order_date) as order_year,
	EXTRACT('month' from order_date) as order_month,
	AVG(profit) AS profit_avg,
	SUM(profit) AS total_profit
FROM supermart
WHERE EXTRACT('year' from order_date) = 2015
AND category ='Snacks'
GROUP BY order_year, order_month;

/*
	Check the average and total profits of snacks for year 2015-2018
*/

SELECT EXTRACT('year' from order_date) as order_year,
	AVG(profit) AS profit_avg,
	SUM(profit) AS total_profit
FROM supermart
WHERE EXTRACT('year' from order_date) >= 2015
AND EXTRACT('year' from order_date) <= 2018
AND category = 'Snacks'
GROUP BY order_year;

/*
	How many people that have more than two orders in a same day during 2018?
*/

SELECT customer_name, order_date, COUNT(*) AS total_order_per_day
	FROM supermart
	WHERE EXTRACT('year' from order_date) = 2018
	GROUP BY order_date, customer_name
	HAVING COUNT(*) > 2

/*
	How many unique people that have more than two orders in a same day during 2018?
*/
SELECT COUNT(DISTINCT customer_name) AS total_unique_customer
FROM (
	SELECT customer_name, order_date, COUNT(*) AS total_order_per_day
	FROM supermart
	WHERE EXTRACT('year' from order_date) = 2018
	GROUP BY order_date, customer_name
	HAVING COUNT(*) > 2
) AS order_more_than_2;
