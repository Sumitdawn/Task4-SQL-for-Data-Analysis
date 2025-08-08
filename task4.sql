-- task4.sql: creates database task4 with simple ecommerce schema + sample data

CREATE DATABASE IF NOT EXISTS task4;
USE task4;

-- Drop existing tables (safe to re-run)
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- Customers
CREATE TABLE customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  country VARCHAR(50)
);

-- Products
CREATE TABLE products (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10,2)
);

-- Orders
CREATE TABLE orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Order items
CREATE TABLE order_items (
  order_item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Sample data
INSERT INTO customers (first_name, last_name, email, country) VALUES
('John','Doe','john@example.com','USA'),
('Jane','Smith','jane@example.com','UK'),
('Ali','Khan','ali@example.com','India');

INSERT INTO products (product_name, category, price) VALUES
('Laptop','Electronics',800.00),
('Phone','Electronics',500.00),
('Book','Education',20.00);

INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1,'2025-08-01',1300.00),
(2,'2025-08-02',500.00),
(3,'2025-08-03',20.00);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1,1,1),
(1,2,1),
(2,2,1),
(3,3,1);

-- SELECT c.first_name, o.order_id, o.total_amount
-- FROM customers c JOIN orders o ON c.customer_id = o.customer_id;

-- SELECT p.category, SUM(p.price * oi.quantity) AS revenue
-- FROM order_items oi
-- JOIN products p ON oi.product_id = p.product_id
-- GROUP BY p.category;
