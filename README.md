# Zepto E-Commerce SQL Data Analysis

![SQL](https://img.shields.io/badge/SQL-MySQL%208.0-blue?logo=mysql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Queries](https://img.shields.io/badge/Queries-15-orange)

## Project Overview

An end-to-end SQL data analysis project on a Zepto-style grocery e-commerce dataset. The project covers database design, data cleaning, and 15 business-focused analytical queries to extract actionable insights on revenue, customer behaviour, product performance, and operational efficiency.

---

## Business Questions Answered

| # | Business Question | SQL Concepts Used |
|---|---|---|
| 1 | What is the total revenue and average order value? | Aggregate functions, Subquery |
| 2 | Which product categories generate the most revenue? | GROUP BY, Window function |
| 3 | What are the top 10 best-selling products? | JOIN, ORDER BY, LIMIT |
| 4 | How has monthly revenue trended over time? | DATE_FORMAT, GROUP BY |
| 5 | Which payment mode do customers prefer? | Window function, percentage calc |
| 6 | What % of orders are delivered vs cancelled vs returned? | GROUP BY, Window function |
| 7 | What is the average delivery time per month? | AVG, MIN, MAX, DATE_FORMAT |
| 8 | How can customers be segmented by spending? | CTE, CASE WHEN |
| 9 | Who are the top 5 most valuable customers? | Multi-table JOIN, ORDER BY |
| 10 | Which age group contributes the most revenue? | GROUP BY, Window function |
| 11 | Which products are slow-moving (high stock, low sales)? | LEFT JOIN, HAVING, NULLIF |
| 12 | How do discounts affect revenue? | CASE WHEN, discount bucketing |
| 13 | Which days of the week see the highest orders? | DAYNAME, DAYOFWEEK |
| 14 | What is the profit margin per product? | CTE, margin calculation |
| 15 | What is the month-over-month revenue growth? | CTE, LAG window function |

---

## Database Schema

```
categories ──< products ──< order_items >── orders >── customers
```

| Table | Rows | Description |
|---|---|---|
| `categories` | 8 | Product category master |
| `products` | 30 | Product catalogue with price & cost |
| `customers` | 20 | Customer profiles with age group |
| `orders` | 50 | Order header with status & delivery time |
| `order_items` | 150 | Line items with quantity & discount |

---

## Key Findings

- **Dairy & Eggs** is the highest revenue category, contributing ~28% of total sales
- **Full Cream Milk 1L** is the single best-selling product by both units and revenue
- **UPI** is the dominant payment mode (~52% of orders)
- **97% delivery rate** — only 3 returns and 4 cancellations out of 50 orders
- **Average delivery time: ~16 minutes**, well within Zepto's 10-minute promise benchmark
- **26–35 age group** drives the highest revenue contribution (~38%)
- **Month-over-month growth** peaks in April and August
- Products like **Good Knight Refill** and **Ice Cream Vanilla** are slow-moving with high stock-to-sales ratios

---

## Tools Used

- **MySQL 8.0** — database and query execution
- **MySQL Workbench** — query editor and result visualization
- **GitHub** — version control and portfolio hosting

---

## How to Run

1. Open **MySQL Workbench** and connect to your local MySQL server
2. Open the file `zepto_analysis.sql`
3. Run the full file (Ctrl + Shift + Enter) — it will create the database, tables, and insert data automatically
4. After setup, run each analysis query block individually (select the query → Ctrl + Enter)
5. View results in the output grid below each query

---

## SQL Concepts Demonstrated

`JOINs` · `CTEs (WITH clause)` · `Window Functions (LAG, SUM OVER)` · `Subqueries` · `CASE WHEN` · `Aggregate Functions` · `DATE_FORMAT` · `NULLIF` · `HAVING` · `LEFT JOIN` · `GROUP BY` · `ORDER BY`

---

## Project Structure

```
zepto-sql-analysis/
│
├── zepto_analysis.sql     ← Main file: schema + data + all 15 queries
├── README.md              ← Project documentation
└── screenshots/           ← Query output screenshots (add after running)
    ├── q1_revenue_summary.png
    ├── q2_category_revenue.png
    └── ...
```

---

## Author

**Vineet Singh**
Data Analyst | Bangalore, India
[LinkedIn](https://linkedin.com/in/vineets28) · [GitHub](https://github.com/vineets28)

---

*This project is part of my data analytics portfolio demonstrating SQL skills for real-world business analysis.*
