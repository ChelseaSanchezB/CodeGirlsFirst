USE SHOP;

SELECT * FROM sales1;

-- Find all sales records that took place in the London store, not in December
-- but sales concluded by Bill or Frank for the mount higher that £50
SELECT *
FROM SALES1
WHERE STORE = 'LONDON' AND MONTH <> 'DEC'
		AND SalesAmount > 50.00
        AND (SalesPerson = 'Bill'
        OR SalesPerson = 'Frank');

-- Number of sales that took place each week (in no order)
SELECT 
	Week, COUNT(*)
FROM SALES1
GROUP BY WEEK;

-- Number of sales that took place each week (present by week in descending and then in ascending order)
SELECT 
	WEEK, COUNT(WEEK) AS 'NUM_sales'
FROM SALES1
GROUP BY WEEK
ORDER BY WEEK;

-- Number of sales recorded each week on different days of the week
SELECT  
	WEEK, DAY, COUNT(WEEK) AS 'NUM_sales'
FROM SALES1
GROUP BY WEEK, DAY
ORDER BY WEEK, DAY;

-- Changing salesperson name Inga to Anette 
UPDATE SALES1
SET SalesPerson = 'Anette'
WHERE SalesPerson = 'Inga';

-- How many sales Annette did
SELECT *
FROM SALES1
WHERE SalesPerson = 'Anette';

-- Total sales amount by each person by day
SELECT 
	SalesPerson, Day, SUM(SalesAmount) AS 'salesAmount'
FROM SALES1
GROUP BY SalesPerson , DAY
ORDER BY SalesPerson , DAY;

-- How much each person sold for the given period
SELECT 
	SalesPerson, SUM(SalesAmount) AS 'salesAmount'
FROM SALES1
GROUP BY SalesPerson
ORDER BY salesAmount DESC;

-- How much each person sold for the given period
-- including;  no. of sales per person, average, lowest and highest sale amounts
SELECT
	SalesPerson,
	SUM(SalesAmount) AS 'salesAmount',
    COUNT(SalesAmount) AS 'NUM_of_sales',
    AVG(SalesAmount) AS 'Average sale',
    MAX(SalesAmount) AS 'Highest Sale',
    MIN(SalesAmount) AS  'Lowest Sale'
FROM SALES1
GROUP BY SalesPerson
ORDER BY salesAmount DESC;

-- total monetary sales amount achieved by each store
SELECT 
	Store, SUM(SalesAmount) AS 'total sales'
FROM SALES1
GROUP BY store;

-- Number of sales by each person if they did < 3 sales for the past preiod
SELECT 
	SalesPerson, COUNT(salesAmount) AS 'Num of sales pp'
FROM SALES1
GROUP BY SalesPerson
HAVING COUNT(salesAmount) < 3;

-- Total amount of sales by month where combined total < £100
SELECT 
	month, SUM(salesAmount) AS 'Total Sales £'
FROM SALES1
GROUP BY month
HAVING SUM(salesAmount) < 100;