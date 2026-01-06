--=============================
-- Load the data from csv file
--=============================
IF OBJECT_ID ('SalesDB.Customers_Table','U') IS NOT NULL
	DROP TABLE SalesDB.Customers;
CREATE TABLE Sales.Customers_Table(
	customer_id NVARCHAR(50),
	customer_name NVARCHAR(50),
	city NVARCHAR(50),
	signup_date DATE,
	customer_type NVARCHAR(50)
);
TRUNCATE TABLE Sales.Customers_Table;
BULK INSERT Sales.Customers_Table
FROM 'D:\sql_project\cust.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM Sales.Customers_Table;
-------------------------------------------------------
IF OBJECT_ID ('SalesDB.Orders_Table','U') IS NOT NULL
	DROP TABLE SalesDB.Orders_Table;
CREATE TABLE Sales.Orders_Table(
	order_id NVARCHAR(50),
	customer_id NVARCHAR(50),
	order_date DATE,
	product NVARCHAR(50),
	order_amount INT,
	payment_mode NVARCHAR(50)
);
TRUNCATE TABLE Sales.Orders_Table;
BULK INSERT Orders_Table
FROM 'D:\sql_project\ords.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);
SELECT * FROM Sales.Orders_Table;

--===================
-- Filter by columns
--===================
SELECT
  customer_id,
  customer_name
FROM Sales.Customers_Table;

--=====================
-- Filter by condition
-- ====================
SELECT 
* 
FROM Sales.Customers_Table
WHERE customer_type = 'Premium'

--============================
-- Filter with two conditions
--============================
SELECT 
* 
FROM Sales.Customers_Table
WHERE customer_type = 'Premium' AND city = 'Delhi'
---------------------------------------------------
SELECT
* 
FROM Sales.Orders_Table
WHERE order_amount BETWEEN 3000 AND 15000
---------------------------------------------------
SELECT 
* 
FROM Sales.Orders_Table
WHERE product IN ('Mobile','Headphones')

--===================
-- Adding new column
--===================
ALTER TABLE Sales.Customers_Table
ADD phone_num INT;

--===================
-- Dropping a column
--===================
ALTER TABLE Sales.Customers_Table
DROP COLUMN phone_num

--===================
-- Select top 5 rows
--===================
SELECT TOP 5
* 
FROM Sales.Customers_Table

--============
-- Extracting
--============
SELECT
city
FROM Sales.Customers_Table
WHERE customer_name = 'Ananya Singh'

--========================
-- select which are nulls
--========================
SELECT 
* 
FROM Sales.Customers_Table
WHERE city IS NULL

--============================
-- select which are not nulls
--============================
SELECT 
* 
FROM Sales.Customers_Table
WHERE city IS NOT NULL

--============
-- Drop nulls
--============
DELETE FROM Sales.Customers_Table
WHERE city IS NULL

--============
-- Fill nulls
--============
UPDATE Sales.Customers_Table
SET customer_name = COALESCE(customer_name,'n/a'),
	city = COALESCE(city,'n/a'),
	customer_type = COALESCE(customer_type,'n/a')

--=============
-- Sort values
--=============
SELECT 
*
FROM Sales.Customers_Table
WHERE signup_date IS NOT NULL
ORDER BY signup_date

--=================
-- Find duplicates
--=================
SELECT DISTINCT
*
FROM(
SELECT
*,
COUNT(*) OVER(PARTITION BY customer_id) AS cnt
FROM Sales.Customers_Table
) t WHERE cnt > 1

--=================
-- Drop Duplicates
--=================
SELECT DISTINCT 
customer_id,customer_name,city,signup_date,customer_type
FROM(
SELECT
COUNT(*) OVER(PARTITION BY customer_id) AS cnt,
*
FROM Sales.Customers_Table) t

--======
-- Rank
--======
SELECT
RANK() OVER(ORDER BY customer_id) AS rank,
*
FROM Sales.Customers_Table

--====================
-- Add product amount
--====================
SELECT 
order_id,
customer_id,
order_date,
product,
order_amount + 50 AS increased_order_amount,
payment_mode
FROM Sales.Orders_Table 

--============================================
-- Combining two tables using with duplicates
--============================================
SELECT 'cust',* FROM Sales.Customers_Table
UNION ALL
SELECT 'extra_cust',* FROM sales.Extra_cust

--===============================================
-- Combining two tables using without duplicates
--===============================================
SELECT * FROM Sales.Customers_Table
UNION 
SELECT * FROM sales.Extra_cust

--============
-- Inner Join
--============
SELECT DISTINCT
*
FROM Sales.Customers_Table AS c
INNER JOIN Sales.Orders_Table AS o
ON c.customer_id = o.customer_id

--===========
-- Left Join
--===========
SELECT DISTINCT
*
FROM Sales.Customers_Table AS c
LEFT JOIN Sales.Orders_Table AS o
ON c.customer_id = o.customer_id

--================
-- Data Wrangling
--================
SELECT 
	customer_id,
	CASE 
		WHEN customer_name IS NULL THEN 'n/a'
		ELSE TRIM(customer_name)
	END AS customer_name,
	CASE
		WHEN city IS NULL THEN 'n/a'
		ELSE TRIM(city)
	END AS city,
	CASE
		WHEN signup_date IS NULL THEN CONVERT(DATE,'1900-01-01')
		ELSE signup_date
	END AS sighup_date,
	CASE 
		WHEN customer_type IS NULL THEN 'n/a'
		ELSE TRIM(customer_type)
	END customer_type
FROM Sales.Customers_Table
