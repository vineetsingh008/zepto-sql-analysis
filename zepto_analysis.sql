-- ============================================================
--  ZEPTO E-COMMERCE SQL DATA ANALYSIS PROJECT
--  Author  : Vineet Singh
--  Tool    : MySQL 8.0+
--  Dataset : Simulated Zepto-style grocery e-commerce data
-- ============================================================

-- STEP 1: CREATE & USE DATABASE
CREATE DATABASE IF NOT EXISTS zepto_db;
USE zepto_db;

-- ============================================================
--  TABLE 1: PRODUCTS
-- ============================================================
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    category_id   INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id    INT PRIMARY KEY AUTO_INCREMENT,
    product_name  VARCHAR(100) NOT NULL,
    category_id   INT,
    price         DECIMAL(8,2),
    cost_price    DECIMAL(8,2),
    stock_qty     INT,
    weight_grams  INT,
    is_active     TINYINT DEFAULT 1,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id   INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(80),
    city          VARCHAR(50),
    pincode       VARCHAR(10),
    join_date     DATE,
    age_group     VARCHAR(20)   -- '18-25', '26-35', '36-50', '50+'
);

CREATE TABLE orders (
    order_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_id   INT,
    order_date    DATE,
    delivery_time_mins INT,
    payment_mode  VARCHAR(20),  -- 'UPI','Card','COD','Wallet'
    order_status  VARCHAR(20),  -- 'Delivered','Cancelled','Returned'
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id       INT PRIMARY KEY AUTO_INCREMENT,
    order_id      INT,
    product_id    INT,
    quantity      INT,
    unit_price    DECIMAL(8,2),
    discount_pct  DECIMAL(4,2) DEFAULT 0,
    FOREIGN KEY (order_id)   REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
--  STEP 2: INSERT SAMPLE DATA
-- ============================================================

INSERT INTO categories (category_name) VALUES
('Fruits & Vegetables'),
('Dairy & Eggs'),
('Snacks & Beverages'),
('Personal Care'),
('Household'),
('Bakery'),
('Meat & Fish'),
('Frozen Foods');

INSERT INTO products (product_name, category_id, price, cost_price, stock_qty, weight_grams) VALUES
('Tomatoes',             1, 35.00, 20.00, 500, 500),
('Onions',               1, 28.00, 15.00, 600, 500),
('Spinach',              1, 22.00, 12.00, 300, 250),
('Bananas',              1, 48.00, 28.00, 400, 600),
('Apples',               1, 120.00, 70.00, 200, 500),
('Full Cream Milk 1L',   2, 68.00, 52.00, 800, 1000),
('Curd 400g',            2, 42.00, 30.00, 500, 400),
('Paneer 200g',          2, 85.00, 60.00, 300, 200),
('Eggs (12-pack)',       2, 95.00, 72.00, 400, 700),
('Butter 100g',          2, 55.00, 40.00, 350, 100),
('Lays Chips',           3, 20.00, 12.00, 1000, 26),
('Kurkure',              3, 20.00, 11.00, 900, 50),
('Coca Cola 750ml',      3, 45.00, 30.00, 600, 750),
('Maggi 2-min Noodles',  3, 14.00,  8.00, 1200, 70),
('Bisleri Water 1L',     3, 20.00, 10.00, 1500, 1000),
('Head & Shoulders',     4, 199.00,130.00, 200, 180),
('Dove Soap',            4, 55.00, 35.00, 500, 75),
('Colgate Toothpaste',   4, 89.00, 60.00, 400, 150),
('Dettol Handwash',      4, 79.00, 50.00, 350, 200),
('Whisper Pads',         4, 69.00, 45.00, 300, 120),
('Surf Excel 1kg',       5, 185.00,120.00, 250, 1000),
('Harpic Cleaner',       5, 99.00, 65.00, 300, 500),
('Vim Dishwash Bar',     5, 45.00, 28.00, 400, 200),
('Good Knight Refill',   5, 79.00, 50.00, 200, 45),
('Bread Loaf',           6, 40.00, 25.00, 400, 400),
('Pav Buns (6pcs)',      6, 30.00, 18.00, 350, 300),
('Chicken Breast 500g',  7, 180.00,130.00, 150, 500),
('Eggs Boiled 6pcs',     7, 60.00, 42.00, 200, 300),
('Frozen Peas 500g',     8, 75.00, 50.00, 200, 500),
('Ice Cream Vanilla',    8, 120.00, 80.00, 150, 500);

INSERT INTO customers (customer_name, city, pincode, join_date, age_group) VALUES
('Rahul Sharma',    'Bangalore', '560001', '2023-01-15', '26-35'),
('Priya Nair',      'Bangalore', '560002', '2023-02-20', '18-25'),
('Amit Patel',      'Bangalore', '560003', '2023-01-10', '36-50'),
('Sneha Reddy',     'Bangalore', '560004', '2023-03-05', '26-35'),
('Vikram Singh',    'Bangalore', '560001', '2023-04-12', '36-50'),
('Anjali Mehta',    'Bangalore', '560005', '2023-05-18', '18-25'),
('Rohit Kumar',     'Bangalore', '560002', '2023-06-22', '26-35'),
('Deepa Iyer',      'Bangalore', '560006', '2023-07-30', '50+'),
('Karan Malhotra',  'Bangalore', '560003', '2023-08-14', '26-35'),
('Pooja Verma',     'Bangalore', '560007', '2023-09-01', '18-25'),
('Suresh Babu',     'Bangalore', '560008', '2023-09-15', '50+'),
('Nisha Gupta',     'Bangalore', '560004', '2023-10-20', '36-50'),
('Arjun Rao',       'Bangalore', '560009', '2023-11-05', '26-35'),
('Meena Krishnan',  'Bangalore', '560010', '2023-11-25', '36-50'),
('Sanjay Tiwari',   'Bangalore', '560001', '2024-01-08', '50+'),
('Kavya Pillai',    'Bangalore', '560002', '2024-02-14', '18-25'),
('Ravi Shankar',    'Bangalore', '560005', '2024-03-20', '26-35'),
('Lakshmi Devi',    'Bangalore', '560006', '2024-04-10', '50+'),
('Nikhil Joshi',    'Bangalore', '560003', '2024-05-01', '18-25'),
('Swati Kulkarni',  'Bangalore', '560007', '2024-06-15', '26-35');

INSERT INTO orders (customer_id, order_date, delivery_time_mins, payment_mode, order_status) VALUES
(1,  '2024-01-05', 12, 'UPI',    'Delivered'),
(2,  '2024-01-06', 18, 'Card',   'Delivered'),
(3,  '2024-01-07', 25, 'COD',    'Delivered'),
(4,  '2024-01-08', 15, 'UPI',    'Cancelled'),
(5,  '2024-01-10', 10, 'Wallet', 'Delivered'),
(1,  '2024-01-15', 14, 'UPI',    'Delivered'),
(6,  '2024-01-20', 22, 'Card',   'Delivered'),
(7,  '2024-02-01', 11, 'UPI',    'Delivered'),
(8,  '2024-02-05', 30, 'COD',    'Returned'),
(9,  '2024-02-10', 13, 'UPI',    'Delivered'),
(10, '2024-02-14', 17, 'Card',   'Delivered'),
(2,  '2024-02-18', 19, 'UPI',    'Delivered'),
(11, '2024-03-01', 20, 'COD',    'Delivered'),
(12, '2024-03-05', 12, 'UPI',    'Delivered'),
(3,  '2024-03-10', 28, 'Card',   'Cancelled'),
(13, '2024-03-15', 15, 'UPI',    'Delivered'),
(14, '2024-03-20', 16, 'Wallet', 'Delivered'),
(5,  '2024-03-25', 11, 'UPI',    'Delivered'),
(15, '2024-04-02', 24, 'COD',    'Delivered'),
(16, '2024-04-08', 14, 'UPI',    'Delivered'),
(1,  '2024-04-12', 13, 'UPI',    'Delivered'),
(6,  '2024-04-18', 21, 'Card',   'Delivered'),
(17, '2024-04-22', 18, 'UPI',    'Delivered'),
(7,  '2024-05-03', 12, 'UPI',    'Delivered'),
(18, '2024-05-10', 35, 'COD',    'Returned'),
(9,  '2024-05-15', 14, 'UPI',    'Delivered'),
(10, '2024-05-20', 16, 'Card',   'Delivered'),
(19, '2024-05-25', 10, 'UPI',    'Delivered'),
(20, '2024-06-01', 13, 'UPI',    'Delivered'),
(4,  '2024-06-05', 22, 'Wallet', 'Delivered'),
(11, '2024-06-10', 17, 'COD',    'Delivered'),
(12, '2024-06-15', 15, 'UPI',    'Delivered'),
(2,  '2024-06-20', 12, 'Card',   'Delivered'),
(13, '2024-06-25', 18, 'UPI',    'Delivered'),
(1,  '2024-07-02', 14, 'UPI',    'Delivered'),
(5,  '2024-07-08', 11, 'Wallet', 'Delivered'),
(14, '2024-07-12', 20, 'UPI',    'Cancelled'),
(15, '2024-07-18', 23, 'COD',    'Delivered'),
(3,  '2024-07-22', 16, 'Card',   'Delivered'),
(16, '2024-07-28', 13, 'UPI',    'Delivered'),
(17, '2024-08-03', 15, 'UPI',    'Delivered'),
(18, '2024-08-08', 19, 'COD',    'Delivered'),
(6,  '2024-08-14', 12, 'Card',   'Delivered'),
(7,  '2024-08-18', 14, 'UPI',    'Delivered'),
(19, '2024-08-22', 10, 'UPI',    'Delivered'),
(20, '2024-08-28', 17, 'Wallet', 'Delivered'),
(8,  '2024-09-03', 28, 'COD',    'Returned'),
(9,  '2024-09-08', 13, 'UPI',    'Delivered'),
(10, '2024-09-12', 15, 'Card',   'Delivered'),
(11, '2024-09-18', 22, 'COD',    'Delivered');

INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount_pct) VALUES
(1,  6,  2, 68.00, 0),    (1,  1,  1, 35.00, 5),   (1, 25,  1, 40.00, 0),
(2,  9,  1, 95.00, 0),    (2, 11,  2, 20.00, 0),   (2,  7,  1, 42.00, 10),
(3,  27, 1,180.00, 0),    (3,  6,  1, 68.00, 0),   (3, 21,  1,185.00, 5),
(4,  5,  2,120.00, 0),    (4, 16,  1,199.00, 10),
(5,  14, 3, 14.00, 0),    (5, 13,  2, 45.00, 0),   (5, 15,  4, 20.00, 0),
(6,  6,  2, 68.00, 0),    (6,  7,  1, 42.00, 0),   (6,  4,  1, 48.00, 5),
(7,  17, 2, 55.00, 0),    (7, 18,  1, 89.00, 0),   (7, 23,  1, 45.00, 10),
(8,  14, 5, 14.00, 0),    (8, 11,  3, 20.00, 5),   (8, 12,  2, 20.00, 0),
(9,  29, 2, 75.00, 0),    (9, 30,  1,120.00, 10),
(10, 6,  3, 68.00, 0),    (10, 9, 1, 95.00, 0),    (10, 8, 1, 85.00, 0),
(11, 5,  1,120.00, 0),    (11, 4, 2, 48.00, 0),    (11, 3, 1, 22.00, 5),
(12, 6,  1, 68.00, 0),    (12,25, 2, 40.00, 0),    (12,26, 2, 30.00, 0),
(13, 21, 1,185.00, 0),    (13,22, 1, 99.00, 10),   (13,23, 2, 45.00, 0),
(14, 6,  2, 68.00, 0),    (14, 7, 1, 42.00, 0),    (14,10, 1, 55.00, 5),
(15, 5,  3,120.00, 0),    (15,16, 1,199.00, 0),
(16, 8,  1, 85.00, 0),    (16, 9, 2, 95.00, 0),    (16,28, 1, 60.00, 0),
(17, 13, 3, 45.00, 0),    (17,14, 4, 14.00, 5),    (17,15, 6, 20.00, 0),
(18, 6,  2, 68.00, 0),    (18, 1, 2, 35.00, 0),    (18, 2, 1, 28.00, 0),
(19, 27, 1,180.00, 5),    (19,29, 1, 75.00, 0),    (19,30, 1,120.00, 0),
(20, 17, 1, 55.00, 0),    (20,18, 1, 89.00, 10),   (20,19, 1, 79.00, 0),
(21, 6,  3, 68.00, 0),    (21, 7, 2, 42.00, 0),    (21, 9, 1, 95.00, 0),
(22, 11, 3, 20.00, 0),    (22,12, 2, 20.00, 5),    (22,13, 1, 45.00, 0),
(23, 1,  2, 35.00, 0),    (23, 2, 1, 28.00, 0),    (23, 3, 2, 22.00, 0),
(24, 6,  2, 68.00, 0),    (24,25, 1, 40.00, 0),    (24,26, 2, 30.00, 0),
(25, 5,  2,120.00, 0),    (25,16, 1,199.00, 5),
(26, 8,  2, 85.00, 0),    (26, 9, 1, 95.00, 0),    (26,10, 1, 55.00, 0),
(27, 13, 2, 45.00, 0),    (27,14, 3, 14.00, 0),    (27,15, 5, 20.00, 0),
(28, 6,  1, 68.00, 0),    (28, 7, 1, 42.00, 5),    (28, 4, 2, 48.00, 0),
(29, 17, 2, 55.00, 0),    (29,20, 1, 69.00, 0),    (29,19, 1, 79.00, 10),
(30, 21, 1,185.00, 0),    (30,22, 1, 99.00, 0),    (30,24, 2, 79.00, 5),
(31, 6,  3, 68.00, 0),    (31, 1, 1, 35.00, 0),    (31, 3, 1, 22.00, 0),
(32, 9,  2, 95.00, 0),    (32, 8, 1, 85.00, 0),    (32,10, 1, 55.00, 0),
(33, 13, 3, 45.00, 5),    (33,11, 2, 20.00, 0),    (33,15, 4, 20.00, 0),
(34, 27, 1,180.00, 0),    (34,28, 1, 60.00, 0),    (34,29, 1, 75.00, 0),
(35, 6,  2, 68.00, 0),    (35, 7, 1, 42.00, 0),    (35,25, 2, 40.00, 0),
(36, 14, 4, 14.00, 0),    (36,13, 2, 45.00, 5),    (36,15, 3, 20.00, 0),
(37, 5,  1,120.00, 0),    (37,16, 1,199.00, 10),
(38, 6,  2, 68.00, 0),    (38, 9, 1, 95.00, 0),    (38, 8, 1, 85.00, 0),
(39, 1,  3, 35.00, 0),    (39, 2, 2, 28.00, 0),    (39, 4, 1, 48.00, 0),
(40, 17, 1, 55.00, 0),    (40,18, 1, 89.00, 0),    (40,23, 1, 45.00, 5),
(41, 6,  3, 68.00, 0),    (41, 7, 2, 42.00, 5),    (41,10, 1, 55.00, 0),
(42, 27, 1,180.00, 0),    (42,29, 2, 75.00, 0),    (42,28, 1, 60.00, 0),
(43, 11, 4, 20.00, 0),    (43,12, 3, 20.00, 5),    (43,13, 2, 45.00, 0),
(44, 6,  2, 68.00, 0),    (44, 1, 2, 35.00, 0),    (44, 3, 1, 22.00, 0),
(45, 9,  1, 95.00, 0),    (45, 8, 1, 85.00, 0),    (45, 7, 2, 42.00, 0),
(46, 21, 1,185.00, 5),    (46,22, 1, 99.00, 0),    (46,23, 2, 45.00, 0),
(47, 5,  2,120.00, 0),    (47,16, 1,199.00, 0),
(48, 6,  2, 68.00, 0),    (48, 4, 2, 48.00, 5),    (48,25, 1, 40.00, 0),
(49, 13, 3, 45.00, 0),    (49,14, 4, 14.00, 0),    (49,15, 6, 20.00, 5),
(50, 6,  2, 68.00, 0),    (50, 7, 1, 42.00, 0),    (50, 8, 1, 85.00, 0);


-- ============================================================
--  ANALYSIS QUERIES (15 TOTAL)
-- ============================================================

-- -------------------------------------------------------
-- Q1. Total Revenue, Total Orders, Average Order Value
-- -------------------------------------------------------
SELECT
    COUNT(DISTINCT o.order_id)                                            AS total_orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_revenue,
    ROUND(AVG(order_total), 2)                                            AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN (
    SELECT order_id,
           SUM(quantity * unit_price * (1 - discount_pct/100)) AS order_total
    FROM order_items GROUP BY order_id
) sub ON o.order_id = sub.order_id
WHERE o.order_status = 'Delivered';

-- -------------------------------------------------------
-- Q2. Revenue by Product Category (Top to Bottom)
-- -------------------------------------------------------
SELECT
    c.category_name,
    COUNT(DISTINCT o.order_id)                                              AS total_orders,
    SUM(oi.quantity)                                                        AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS revenue,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)) * 100.0
          / SUM(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100))) OVER (), 1) AS revenue_pct
FROM order_items oi
JOIN products p   ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
JOIN orders o     ON oi.order_id   = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_name
ORDER BY revenue DESC;

-- -------------------------------------------------------
-- Q3. Top 10 Best-Selling Products by Revenue
-- -------------------------------------------------------
SELECT
    p.product_name,
    c.category_name,
    SUM(oi.quantity)                                                        AS units_sold,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS revenue,
    ROUND((p.price - p.cost_price) / p.price * 100, 1)                    AS margin_pct
FROM order_items oi
JOIN products p   ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
JOIN orders o     ON oi.order_id   = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name, c.category_name, p.price, p.cost_price
ORDER BY revenue DESC
LIMIT 10;

-- -------------------------------------------------------
-- Q4. Monthly Revenue Trend (Jan–Sep 2024)
-- -------------------------------------------------------
SELECT
    DATE_FORMAT(o.order_date, '%Y-%m')                                     AS month,
    COUNT(DISTINCT o.order_id)                                             AS orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- -------------------------------------------------------
-- Q5. Payment Mode Distribution
-- -------------------------------------------------------
SELECT
    payment_mode,
    COUNT(*)                                AS total_orders,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS percentage
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_mode
ORDER BY total_orders DESC;

-- -------------------------------------------------------
-- Q6. Order Status Summary (Delivered vs Cancelled vs Returned)
-- -------------------------------------------------------
SELECT
    order_status,
    COUNT(*)                                AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 1) AS percentage
FROM orders
GROUP BY order_status
ORDER BY count DESC;

-- -------------------------------------------------------
-- Q7. Average Delivery Time by Month
-- -------------------------------------------------------
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    ROUND(AVG(delivery_time_mins), 1) AS avg_delivery_mins,
    MIN(delivery_time_mins)           AS fastest_mins,
    MAX(delivery_time_mins)           AS slowest_mins
FROM orders
WHERE order_status = 'Delivered'
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- -------------------------------------------------------
-- Q8. Customer Segmentation by Total Spend (RFM-style)
-- -------------------------------------------------------
WITH customer_spend AS (
    SELECT
        c.customer_id,
        c.customer_name,
        c.age_group,
        COUNT(DISTINCT o.order_id)                                              AS total_orders,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS total_spend,
        MAX(o.order_date)                                                       AS last_order_date
    FROM customers c
    JOIN orders o     ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id  = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.customer_name, c.age_group
)
SELECT *,
    CASE
        WHEN total_spend >= 800  THEN 'High Value'
        WHEN total_spend >= 400  THEN 'Mid Value'
        ELSE                          'Low Value'
    END AS customer_segment
FROM customer_spend
ORDER BY total_spend DESC;

-- -------------------------------------------------------
-- Q9. Top 5 Most Valuable Customers
-- -------------------------------------------------------
SELECT
    c.customer_name,
    c.age_group,
    COUNT(DISTINCT o.order_id)                                              AS orders_placed,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS lifetime_value
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name, c.age_group
ORDER BY lifetime_value DESC
LIMIT 5;

-- -------------------------------------------------------
-- Q10. Revenue Contribution by Age Group
-- -------------------------------------------------------
SELECT
    c.age_group,
    COUNT(DISTINCT c.customer_id)                                           AS customers,
    COUNT(DISTINCT o.order_id)                                              AS orders,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS revenue,
    ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)) * 100.0
          / SUM(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100))) OVER (), 1) AS revenue_pct
FROM customers c
JOIN orders o       ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id    = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.age_group
ORDER BY revenue DESC;

-- -------------------------------------------------------
-- Q11. Slow-Moving Products (Low Sales, High Stock)
-- -------------------------------------------------------
SELECT
    p.product_name,
    c.category_name,
    p.stock_qty,
    COALESCE(SUM(oi.quantity), 0) AS units_sold,
    ROUND(p.stock_qty / NULLIF(COALESCE(SUM(oi.quantity), 0), 0), 1) AS stock_to_sales_ratio
FROM products p
LEFT JOIN categories c  ON p.category_id  = c.category_id
LEFT JOIN order_items oi ON p.product_id  = oi.product_id
LEFT JOIN orders o       ON oi.order_id   = o.order_id
    AND o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name, c.category_name, p.stock_qty
HAVING units_sold < 5
ORDER BY stock_qty DESC;

-- -------------------------------------------------------
-- Q12. Discount Impact on Revenue
-- -------------------------------------------------------
SELECT
    CASE
        WHEN discount_pct = 0        THEN 'No Discount'
        WHEN discount_pct BETWEEN 1 AND 5  THEN '1-5%'
        WHEN discount_pct BETWEEN 6 AND 10 THEN '6-10%'
        ELSE 'Above 10%'
    END AS discount_bucket,
    COUNT(*)                                                               AS line_items,
    ROUND(SUM(quantity * unit_price), 2)                                   AS gross_revenue,
    ROUND(SUM(quantity * unit_price * (1 - discount_pct/100)), 2)          AS net_revenue,
    ROUND(SUM(quantity * unit_price * discount_pct/100), 2)                AS total_discount_given
FROM order_items
GROUP BY discount_bucket
ORDER BY total_discount_given DESC;

-- -------------------------------------------------------
-- Q13. Peak Ordering Days (Day of Week Analysis)
-- -------------------------------------------------------
SELECT
    DAYNAME(order_date)      AS day_of_week,
    COUNT(*)                 AS total_orders,
    ROUND(AVG(delivery_time_mins), 1) AS avg_delivery_mins
FROM orders
WHERE order_status = 'Delivered'
GROUP BY DAYNAME(order_date), DAYOFWEEK(order_date)
ORDER BY DAYOFWEEK(order_date);

-- -------------------------------------------------------
-- Q14. Product Profit Margin Analysis (Using CTE)
-- -------------------------------------------------------
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        c.category_name,
        p.price,
        p.cost_price,
        ROUND((p.price - p.cost_price) / p.price * 100, 1) AS margin_pct,
        COALESCE(SUM(oi.quantity), 0)                       AS units_sold
    FROM products p
    LEFT JOIN categories c   ON p.category_id  = c.category_id
    LEFT JOIN order_items oi ON p.product_id   = oi.product_id
    LEFT JOIN orders o       ON oi.order_id    = o.order_id
        AND o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name, c.category_name, p.price, p.cost_price
)
SELECT *,
    ROUND(units_sold * (price - cost_price), 2) AS estimated_profit,
    CASE
        WHEN margin_pct >= 45 THEN 'High Margin'
        WHEN margin_pct >= 30 THEN 'Medium Margin'
        ELSE                       'Low Margin'
    END AS margin_category
FROM product_revenue
ORDER BY estimated_profit DESC;

-- -------------------------------------------------------
-- Q15. Month-over-Month Revenue Growth (Window Function)
-- -------------------------------------------------------
WITH monthly AS (
    SELECT
        DATE_FORMAT(o.order_date, '%Y-%m')                                     AS month,
        ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount_pct/100)), 2) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month)                        AS prev_month_revenue,
    ROUND((revenue - LAG(revenue) OVER (ORDER BY month))
          / NULLIF(LAG(revenue) OVER (ORDER BY month), 0) * 100, 1) AS mom_growth_pct
FROM monthly
ORDER BY month;

-- ============================================================
-- END OF PROJECT
-- ============================================================
