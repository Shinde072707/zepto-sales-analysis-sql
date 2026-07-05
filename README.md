# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

## 📌 Project Overview

This project analyzes a **Zepto grocery product dataset** using
**PostgreSQL**. It covers database creation, data cleaning, and business
insight queries to demonstrate practical SQL skills for data analytics.

## 🛠️ Tech Stack

-   PostgreSQL
-   SQL
-   CSV Dataset

## 📂 Project Files

-   `encoded-zepto_v2.csv` -- Dataset
-   `zepto_SQL_project.sql` -- SQL script containing table creation,
    cleaning, and analysis queries

## 🗄️ Database Schema

  Column                   Description
  ------------------------ ------------------------------
  sku_id                   Primary Key
  category                 Product category
  name                     Product name
  mrp                      Maximum Retail Price
  discountPercent          Discount percentage
  availableQuantity        Available stock
  discountedSellingPrice   Selling price after discount
  weightInGms              Product weight
  outOfStock               Stock status
  quantity                 Pack quantity

## 🚀 Features

-   Create Zepto table
-   Import CSV data
-   Check missing values
-   Remove invalid records
-   Convert prices from paise to rupees
-   Analyze categories and stock availability
-   Find duplicate products
-   Generate business insights

## 📊 Sample Business Questions

1. Found top 10 best-value products based on discount percentage
2. Identified high-MRP products that are currently out of stock
3. Estimated potential revenue for each product category
4. Filtered expensive products (MRP > ₹500) with minimal discount
5. Ranked top 5 categories offering highest average discounts
6. Calculated price per gram to identify value-for-money products
7. Grouped products based on weight into Low, Medium, and Bulk categories
8. Measured total inventory weight per product category

## ▶️ How to Run

1.  Create a PostgreSQL database.
2.  Execute `zepto_SQL_project.sql`.
3.  Import `encoded-zepto_v2.csv` into the `zepto` table.
4.  Run the analysis queries.

## 📈 Skills Demonstrated

-   SQL
-   Data Cleaning
-   Aggregations
-   Filtering
-   GROUP BY
-   ORDER BY
-   Business Analysis
-   PostgreSQL

## 👨‍💻 Author

**Shubham Shinde**
