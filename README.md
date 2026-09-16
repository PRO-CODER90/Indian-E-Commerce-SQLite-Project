# 🇮🇳 Indian E-Commerce Analytics — SQLite Project

A practical **SQLite database project** built around a realistic Indian e-commerce dataset. This project demonstrates relational database design, SQL queries, data analysis, views, indexing, and business-oriented reporting using **SQLite**.
The database contains customers, products, categories, orders, order items, and reviews, along with ready-to-use analytical queries.

---

## 📌 Project Overview

The goal of this project is to build and analyze an e-commerce database representing customers and transactions across different cities and states in India.
The project focuses on answering common business questions such as:

- How much revenue was generated?
- Which products generate the most revenue?
- Which product categories perform best?
- Which states contribute the most sales?
- Who are the highest-spending customers?
- Which payment methods are most commonly used?
- What are the average product ratings?
- How many orders were cancelled?
- How does revenue change month by month?

---

## 🛠️ Technologies Used

- **SQLite**
- **SQL**
- **DB Browser for SQLite**
- Relational Database Concepts
- Data Analysis & Aggregation

---

## 🗂️ Database Structure

The database contains the following tables:

### 1. `customers`

Stores customer information.

| Column | Description |
| ----------------- | ------------------ |
| `customer_id` | Unique customer ID |
| `customer_name` | Customer name |
| `gender` | Customer gender |
| `age` | Customer age |
| `city` | Indian city |
| `state` | Indian state |
| `signup_date` | Registration date |

### 2. `categories`

Stores product categories.
Examples:

- Electronics
- Fashion
- Home & Kitchen
- Beauty
- Books
- Grocery

### 3. `products`

Stores product information.

| Column | Description |
| ----------------- | -------------------- |
| `product_id` | Unique product ID |
| `product_name` | Product name |
| `category_id` | Product category |
| `brand` | Brand name |
| `price` | Product price in INR |

### 4. `orders`

Stores customer order information.

| Column | Description |
| ----------------- | ----------------------------- |
| `order_id` | Unique order ID |
| `customer_id` | Customer who placed the order |
| `order_date` | Date of order |
| `order_status` | Order status |
| `payment_method` | Payment method |
| `shipping_city` | Delivery city |
| `shipping_state` | Delivery state |

### 5. `order_items`

Stores products included in each order.

| Column | Description |
| ----------------- | ------------------- |
| `order_item_id` | Unique item ID |
| `order_id` | Related order |
| `product_id` | Purchased product |
| `quantity` | Quantity purchased |
| `unit_price` | Price per unit |
| `discount_pct` | Discount percentage |

### 6. `reviews`

Stores customer product ratings.

| Column | Description |
| ----------------- | ------------------ |
| `review_id` | Unique review ID |
| `customer_id` | Reviewing customer |
| `product_id` | Reviewed product |
| `rating` | Rating from 1 to 5 |
| `review_date` | Review date |

---

## 📊 Dataset

The project contains:

- 👥 **100 Customers**
- 📦 **20 Products**
- 🛒 **180 Orders**
- 🧾 **366 Order Items**
- ⭐ **150 Reviews**
- 🇮🇳 Multiple Indian cities and states
- 💰 Product prices represented in Indian Rupees (₹)

> **Note:** The dataset is synthetic/sample data created for educational and portfolio purposes. It does not contain real customer information.

---

## 👁️ Database Views

To make analysis easier, the project includes several SQL views.

### `v_order_details`

Combines customer, order, product, category, and item information into a single analytical view.

### `v_monthly_sales`

Provides monthly order counts and revenue.

### `v_product_performance`

Provides product-level performance including:

- Number of orders
- Units sold
- Revenue

### `v_customer_spending`

Provides customer-level spending information.

---

## 🔎 Example SQL Queries

### Total Delivered Revenue

```sql
SELECT 
    ROUND(SUM(line_total), 2) AS total_revenue
FROM v_order_details
WHERE order_status = 'Delivered';

```

### Top 10 Products by Revenue

```sql
SELECT *
FROM v_product_performance
ORDER BY revenue DESC
LIMIT 10;

```

### Revenue by State

```sql
SELECT 
    customer_state AS state,
    ROUND(SUM(line_total), 2) AS revenue
FROM v_order_details
WHERE order_status = 'Delivered'
GROUP BY customer_state
ORDER BY revenue DESC;

```

### Revenue by Category

```sql
SELECT 
    category_name,
    ROUND(SUM(line_total), 2) AS revenue
FROM v_order_details
WHERE order_status = 'Delivered'
GROUP BY category_name
ORDER BY revenue DESC;

```

### Top Customers

```sql
SELECT *
FROM v_customer_spending
ORDER BY total_spent DESC
LIMIT 10;

```

### Monthly Sales

```sql
SELECT *
FROM v_monthly_sales;

```

### Average Product Rating

```sql
SELECT 
    p.product_name,
    ROUND(AVG(r.rating), 2) AS average_rating,
    COUNT(*) AS review_count
FROM reviews r
JOIN products p 
    ON p.product_id = r.product_id
GROUP BY p.product_id
ORDER BY average_rating DESC;

```

### Payment Method Analysis

```sql
SELECT 
    payment_method,
    COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC;

```

---

## 🔗 Relationships

The database follows a relational structure:

```text
customers
    │
    └── orders
          │
          └── order_items
                 │
                 └── products
                       │
                       └── categories

customers ─────────── reviews
                         │
                         └── products

```

Foreign keys are used to maintain relationships between related tables.

---

## ⚡ Database Optimization

The project also includes indexes to improve query performance.
Indexes are created on frequently searched/joined columns such as:

```sql
CREATE INDEX idx_orders_customer 
ON orders(customer_id);

CREATE INDEX idx_orders_date 
ON orders(order_date);

CREATE INDEX idx_order_items_order 
ON order_items(order_id);

CREATE INDEX idx_order_items_product 
ON order_items(product_id);

CREATE INDEX idx_reviews_product 
ON reviews(product_id);

```

---

## 🚀 How to Run the Project

### Option 1 — DB Browser for SQLite

1. Download the project.
2. Install **DB Browser for SQLite**.
3. Open `indian_ecommerce.db`.
4. Go to the **Browse Data** tab to explore the tables.
5. Go to the **Execute SQL** tab to run queries.

### Option 2 — SQLite Command Line

Open a terminal inside the project directory:

```bash
sqlite3 indian_ecommerce.db

```

Then run:

```sql
.tables

```

To view the database schema:

```sql
.schema

```

To exit SQLite:

```sql
.quit

```

---

## 📁 Project Files

```text
Indian_Ecommerce_SQLite_Project/
│
├── indian_ecommerce.db
├── indian_ecommerce_project.sql
└── README.md

```

### `indian_ecommerce.db`

The main SQLite database containing all tables, relationships, indexes, views, and data.

### `indian_ecommerce_project.sql`

Complete SQL dump that can be used to recreate the database.

### `README.md`

Project documentation and SQL examples.

---

## 🎯 Learning Outcomes

Through this project, I practiced:

- Database design
- Relational database concepts
- Primary keys and foreign keys
- SQL `JOIN`
- `GROUP BY`
- `ORDER BY`
- Aggregate functions
- Filtering with `WHERE`
- SQL views
- Database indexing
- Data validation using constraints
- Business data analysis
- SQLite database management

---

## 💡 Possible Future Improvements

This project can be extended by adding:

- 📊 Interactive Power BI dashboard
- 📈 Python-based data analysis
- 🐼 Pandas integration
- 📉 Sales forecasting
- 👤 Customer segmentation
- ⭐ Sentiment analysis of reviews
- 🔐 User authentication
- 🌐 REST API
- 🖥️ Web-based analytics dashboard

---

## 👨‍💻 Author

**Hardik Jain**
BCA — Artificial Intelligence & Data Science
Interested in:

- Full Stack Development
- Database Management
- Data Analytics
- Artificial Intelligence & Machine Learning

---

## ⭐ If You Like This Project

If you find this project useful for learning SQLite and SQL analytics, consider giving the repository a ⭐ on GitHub.
