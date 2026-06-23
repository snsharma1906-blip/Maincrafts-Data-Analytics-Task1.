-- Step 1: Create the sales table structure
CREATE TABLE sales (
    order_id VARCHAR(50),
    order_date DATE,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    category VARCHAR(50),
    sales DECIMAL (10,2),
    quantity INT,
    profit DECIMAL(10,2),
    discount DECIMAL(5,2)
);

-- Step 2: Query for Total Sales by Region
SELECT region, SUM(sales) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;

-- Step 3: Query for Top Profitable Categories
SELECT category, SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC;

-- Step 4: Query for Monthly Sales Trend
SELECT strftime('%m', order_date) AS month, SUM(sales) AS total_sales
FROM sales
GROUP BY month
ORDER BY month;

-- Step 5: Query for Discount Impact on Profitability
SELECT discount, AVG(profit) AS avg_profit
FROM sales
GROUP BY discount
ORDER BY discount;