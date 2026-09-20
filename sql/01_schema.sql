-- Enterprise Sales Analytics
-- Target DB: MySQL 8+
CREATE DATABASE IF NOT EXISTS enterprise_sales_analytics;
USE enterprise_sales_analytics;

CREATE TABLE dim_customer (
    Customer_ID VARCHAR(20) PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Segment VARCHAR(50),
    Region VARCHAR(50)
);

CREATE TABLE dim_product (
    Product_Key INT AUTO_INCREMENT PRIMARY KEY,
    Category VARCHAR(50),
    Sub_Category VARCHAR(50)
);

CREATE TABLE dim_date (
    Date DATE PRIMARY KEY,
    Year INT,
    Month INT,
    Month_Name VARCHAR(10),
    Quarter VARCHAR(5),
    Year_Month VARCHAR(7)
);

CREATE TABLE sales_fact (
    Order_ID VARCHAR(30) PRIMARY KEY,
    Order_Date DATE,
    Region VARCHAR(50),
    Segment VARCHAR(50),
    Category VARCHAR(50),
    Sub_Category VARCHAR(50),
    Channel VARCHAR(30),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(12,2),
    Discount DECIMAL(6,4),
    Revenue DECIMAL(14,2),
    Cost DECIMAL(14,2),
    Profit DECIMAL(14,2),
    Year INT,
    Month INT,
    Month_Name VARCHAR(10),
    Quarter VARCHAR(5),
    Profit_Margin DECIMAL(8,4),
    INDEX idx_order_date (Order_Date),
    INDEX idx_customer (Customer_ID),
    INDEX idx_region (Region)
);

-- Star-schema relationships:
-- dim_customer.Customer_ID -> sales_fact.Customer_ID
-- dim_date.Date -> sales_fact.Order_Date
-- dim_product is a conformed product dimension for Category/Sub_Category.
