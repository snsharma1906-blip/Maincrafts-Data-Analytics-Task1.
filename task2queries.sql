-- 1. Table Structural Schemes
CREATE TABLE Customers (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Region VARCHAR(50),
    Segment VARCHAR(50)
);

CREATE TABLE Orders (
    Order_ID VARCHAR(50) PRIMARY KEY,
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Product_Category VARCHAR(50),
    Sales DECIMAL(10,2),
    Quantity INT,
    Profit DECIMAL(10,2),
    Discount DECIMAL(5,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- 2. Inner Join Connection Example
SELECT 
    o.Order_ID,
    o.Order_Date,
    c.Customer_Name,
    c.Region,
    o.Product_Category,
    o.Sales,
    o.Profit
FROM Orders o
INNER JOIN Customers c ON o.Customer_ID = c.Customer_ID;

-- 3. Metric KPI Analysis Calculations

-- KPI 1: Total Sales by Region
SELECT c.Region, SUM(o.Sales) AS Total_Sales
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Region
ORDER BY Total_Sales DESC;

-- KPI 2: Profit Margin by Category
SELECT Product_Category,
       SUM(Profit)/SUM(Sales) AS Profit_Margin
FROM Orders
GROUP BY Product_Category;

-- KPI 3: Monthly Sales Trend
SELECT strftime('%m', Order_Date) AS Month, SUM(Sales) AS Monthly_Sales
FROM Orders
GROUP BY Month
ORDER BY Month;

-- KPI 4: Top 5 Customers by Revenue
SELECT c.Customer_Name, SUM(o.Sales) AS Total_Revenue
FROM Orders o
JOIN Customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Customer_Name
ORDER BY Total_Revenue DESC
LIMIT 5;