drop table if exists zepto;

CREATE TABLE zepto(
	sku_id SERIAL PRIMARY KEY,
	Category VARCHAR(120),
	name VARCHAR(120) NOT NULL,
	mrp NUMERIC(8,2),
	discountPercent NUMERIC(8,2),
	availableQuantity INTEGER,
	discountedSellingPrice NUMERIC(8,2),
	weightInGms INTEGER,
	outOfStock BOOLEAN,
	quantity INTEGER
);

SELECT COUNT(*) FROM public.zepto;
-- Show Table Data
SELECT * FROM zepto;

-- Count total rows 
SELECT COUNT(*) FROM zepto;

-- Find null values 
SELECT * FROM zepto 
WHERE name IS NULL OR
Category IS NULL OR
mrp IS NULL OR
discountPercent IS NULL OR
availableQuantity IS NULL OR
discountedSellingPrice IS NULL OR
weightInGms IS NULL OR
outOfStock IS NULL OR
quantity IS NULL;

-- Identified distinct product categories available in the dataset 
SELECT DISTINCT category FROM zepto
ORDER BY category;

-- Compared in-stock vs out-of-stock product counts
SELECT outofstock, COUNT(sku_id)
FROM zepto
GROUP BY outofstock;

-- Detected products present multiple times, representing different SKUs
SELECT name, COUNT(sku_id) AS "Number of sku"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;


-- Data Cleaning

-- Identified and removed rows where MRP or discounted selling price was zero

SELECT * FROM zepto
WHERE mrp = 0 OR discountedsellingprice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
UPDATE zepto
SET mrp = mrp/100.0,
discountedsellingprice = discountedsellingprice/100.0;

--  Business Insights

-- Q1) Found top 10 best-value products based on discount percentage
SELECT DISTINCT name,mrp,discountpercent FROM zepto
ORDER BY discountpercent DESC
LIMIT 10;

-- Q2)  Identified high-MRP products that are currently out of stock
SELECT DISTINCT name, mrp, outofstock FROM zepto
WHERE outofstock = TRUE AND mrp > 300
ORDER BY mrp DESC;

-- Q3) Estimated potential revenue for each product category
SELECT category,
SUM(discountedsellingprice * availablequantity) AS Total_revenue
FROM zepto
GROUP BY category
ORDER BY Total_revenue;


-- Q4) Filtered expensive products (MRP > ₹500) with minimal discount less than 10%
SELECT DISTINCT name, mrp, discountpercent
FROM zepto
WHERE mrp > 500 AND discountpercent < 10
ORDER BY mrp DESC, discountpercent DESC;

-- Q5) Ranked top 5 categories offering highest average discounts
SELECT category,
ROUND(AVG(discountpercent),2) AS Avg_discount
FROM zepto 
GROUP BY category 
ORDER BY Avg_discount DESC
LIMIT 5;

-- Q6) Calculated price per gram to identify value-for-money products
SELECT DISTINCT name , discountedsellingprice , weightingms ,
ROUND(discountedsellingprice / weightingms,2) AS price_per_gms
FROM zepto
WHERE weightingms >=100
ORDER BY price_per_gms DESC;

-- Q7) Grouped products based on weight into Low, Medium, and Bulk categories
SELECT DISTINCT name,weightingms,
CASE WHEN weightingms < 1000 THEN 'lOW'
	 WHEN weightingms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

-- Q8) Measured total inventory weight per product category
SELECT category,
SUM(weightInGms * availableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
