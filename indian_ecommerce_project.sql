BEGIN TRANSACTION;
CREATE TABLE analytics_queries (
    query_id INTEGER PRIMARY KEY,
    query_name TEXT NOT NULL,
    sql_query TEXT NOT NULL
);
INSERT INTO "analytics_queries" VALUES(1,'Total delivered revenue','SELECT ROUND(SUM(line_total),2) AS revenue FROM v_order_details WHERE order_status=''Delivered'';');
INSERT INTO "analytics_queries" VALUES(2,'Monthly sales','SELECT * FROM v_monthly_sales;');
INSERT INTO "analytics_queries" VALUES(3,'Top 10 products by revenue','SELECT * FROM v_product_performance ORDER BY revenue DESC LIMIT 10;');
INSERT INTO "analytics_queries" VALUES(4,'Top 10 customers','SELECT * FROM v_customer_spending ORDER BY total_spent DESC LIMIT 10;');
INSERT INTO "analytics_queries" VALUES(5,'Revenue by state','SELECT customer_state AS state, ROUND(SUM(line_total),2) AS revenue
FROM v_order_details WHERE order_status=''Delivered''
GROUP BY customer_state ORDER BY revenue DESC;');
INSERT INTO "analytics_queries" VALUES(6,'Revenue by category','SELECT category_name, ROUND(SUM(line_total),2) AS revenue
FROM v_order_details WHERE order_status=''Delivered''
GROUP BY category_name ORDER BY revenue DESC;');
INSERT INTO "analytics_queries" VALUES(7,'Payment method usage','SELECT payment_method, COUNT(DISTINCT order_id) AS orders
FROM orders GROUP BY payment_method ORDER BY orders DESC;');
INSERT INTO "analytics_queries" VALUES(8,'Average rating by product','SELECT p.product_name, ROUND(AVG(r.rating),2) AS avg_rating, COUNT(*) AS review_count
FROM reviews r JOIN products p ON p.product_id=r.product_id
GROUP BY p.product_id ORDER BY avg_rating DESC;');
INSERT INTO "analytics_queries" VALUES(9,'Cancelled orders','SELECT COUNT(*) AS cancelled_orders FROM orders WHERE order_status=''Cancelled'';');
INSERT INTO "analytics_queries" VALUES(10,'High-value customers','SELECT * FROM v_customer_spending
WHERE total_spent >= 20000 ORDER BY total_spent DESC;');
CREATE TABLE categories (
    category_id INTEGER PRIMARY KEY,
    category_name TEXT NOT NULL UNIQUE
);
INSERT INTO "categories" VALUES(1,'Electronics');
INSERT INTO "categories" VALUES(2,'Fashion');
INSERT INTO "categories" VALUES(3,'Home & Kitchen');
INSERT INTO "categories" VALUES(4,'Beauty');
INSERT INTO "categories" VALUES(5,'Books');
INSERT INTO "categories" VALUES(6,'Grocery');
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    gender TEXT CHECK(gender IN ('Male','Female','Other')),
    age INTEGER CHECK(age BETWEEN 18 AND 80),
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    signup_date TEXT NOT NULL
);
INSERT INTO "customers" VALUES(1,'Arjun Sharma','Other',35,'Lucknow','Uttar Pradesh','2025-05-06');
INSERT INTO "customers" VALUES(2,'Rohan Jain','Other',52,'Mumbai','Maharashtra','2025-02-14');
INSERT INTO "customers" VALUES(3,'Aanya Sharma','Male',23,'Ahmedabad','Gujarat','2025-04-22');
INSERT INTO "customers" VALUES(4,'Meera Joshi','Male',53,'Mumbai','Maharashtra','2025-04-12');
INSERT INTO "customers" VALUES(5,'Sneha Mehta','Male',46,'Indore','Madhya Pradesh','2025-05-23');
INSERT INTO "customers" VALUES(6,'Aarav Gupta','Other',45,'Kochi','Kerala','2025-06-24');
INSERT INTO "customers" VALUES(7,'Rohan Patel','Female',24,'Pune','Maharashtra','2025-02-17');
INSERT INTO "customers" VALUES(8,'Arjun Verma','Female',34,'Hyderabad','Telangana','2025-01-23');
INSERT INTO "customers" VALUES(9,'Priya Khan','Male',42,'Indore','Madhya Pradesh','2025-02-10');
INSERT INTO "customers" VALUES(10,'Sahil Joshi','Female',54,'Kolkata','West Bengal','2025-04-09');
INSERT INTO "customers" VALUES(11,'Aditya Sharma','Other',32,'Indore','Madhya Pradesh','2025-05-29');
INSERT INTO "customers" VALUES(12,'Yash Jain','Female',35,'Jaipur','Rajasthan','2025-08-21');
INSERT INTO "customers" VALUES(13,'Diya Gupta','Female',40,'Lucknow','Uttar Pradesh','2025-04-18');
INSERT INTO "customers" VALUES(14,'Ishaan Jain','Other',28,'Lucknow','Uttar Pradesh','2025-10-01');
INSERT INTO "customers" VALUES(15,'Yash Gupta','Female',42,'Indore','Madhya Pradesh','2025-05-19');
INSERT INTO "customers" VALUES(16,'Sneha Patel','Other',38,'Chandigarh','Chandigarh','2025-01-29');
INSERT INTO "customers" VALUES(17,'Vivaan Verma','Female',35,'Mumbai','Maharashtra','2025-02-03');
INSERT INTO "customers" VALUES(18,'Pooja Verma','Male',49,'Mumbai','Maharashtra','2025-07-22');
INSERT INTO "customers" VALUES(19,'Priya Gupta','Female',26,'Chandigarh','Chandigarh','2025-05-07');
INSERT INTO "customers" VALUES(20,'Sneha Khan','Female',55,'Indore','Madhya Pradesh','2025-08-08');
INSERT INTO "customers" VALUES(21,'Pooja Mehta','Female',32,'Chandigarh','Chandigarh','2025-03-12');
INSERT INTO "customers" VALUES(22,'Kavya Jain','Male',25,'Kolkata','West Bengal','2025-03-20');
INSERT INTO "customers" VALUES(23,'Kunal Mehta','Other',22,'Lucknow','Uttar Pradesh','2025-07-17');
INSERT INTO "customers" VALUES(24,'Riya Agarwal','Other',34,'Hyderabad','Telangana','2025-10-11');
INSERT INTO "customers" VALUES(25,'Aarav Jain','Other',52,'Bhopal','Madhya Pradesh','2025-05-17');
INSERT INTO "customers" VALUES(26,'Ananya Jain','Female',45,'Kochi','Kerala','2025-03-22');
INSERT INTO "customers" VALUES(27,'Aarav Singh','Other',29,'Chennai','Tamil Nadu','2025-09-17');
INSERT INTO "customers" VALUES(28,'Arjun Singh','Other',50,'Chandigarh','Chandigarh','2025-04-12');
INSERT INTO "customers" VALUES(29,'Diya Gupta','Other',51,'Delhi','Delhi','2025-01-01');
INSERT INTO "customers" VALUES(30,'Ananya Agarwal','Male',25,'Ahmedabad','Gujarat','2025-07-05');
INSERT INTO "customers" VALUES(31,'Sahil Patel','Male',33,'Chandigarh','Chandigarh','2025-10-18');
INSERT INTO "customers" VALUES(32,'Aditya Agarwal','Male',52,'Jaipur','Rajasthan','2025-03-06');
INSERT INTO "customers" VALUES(33,'Kavya Khan','Male',34,'Delhi','Delhi','2025-09-28');
INSERT INTO "customers" VALUES(34,'Riya Mehta','Male',52,'Bhopal','Madhya Pradesh','2025-04-13');
INSERT INTO "customers" VALUES(35,'Sahil Mehta','Other',41,'Indore','Madhya Pradesh','2025-08-13');
INSERT INTO "customers" VALUES(36,'Meera Agarwal','Male',33,'Chandigarh','Chandigarh','2025-04-26');
INSERT INTO "customers" VALUES(37,'Ananya Sharma','Other',53,'Jaipur','Rajasthan','2025-04-28');
INSERT INTO "customers" VALUES(38,'Yash Sharma','Male',21,'Ahmedabad','Gujarat','2025-04-28');
INSERT INTO "customers" VALUES(39,'Vivaan Verma','Male',50,'Jaipur','Rajasthan','2025-05-02');
INSERT INTO "customers" VALUES(40,'Kavya Patel','Other',26,'Pune','Maharashtra','2025-10-20');
INSERT INTO "customers" VALUES(41,'Kavya Patel','Female',44,'Ahmedabad','Gujarat','2025-04-08');
INSERT INTO "customers" VALUES(42,'Arjun Mehta','Female',45,'Jaipur','Rajasthan','2025-07-30');
INSERT INTO "customers" VALUES(43,'Vivaan Jain','Male',43,'Chennai','Tamil Nadu','2025-06-23');
INSERT INTO "customers" VALUES(44,'Arjun Patel','Male',30,'Kochi','Kerala','2025-10-02');
INSERT INTO "customers" VALUES(45,'Rohan Mehta','Male',35,'Chennai','Tamil Nadu','2025-08-25');
INSERT INTO "customers" VALUES(46,'Aditya Agarwal','Other',24,'Mumbai','Maharashtra','2025-01-26');
INSERT INTO "customers" VALUES(47,'Sneha Sharma','Male',33,'Lucknow','Uttar Pradesh','2025-03-27');
INSERT INTO "customers" VALUES(48,'Kavya Agarwal','Male',43,'Hyderabad','Telangana','2025-01-31');
INSERT INTO "customers" VALUES(49,'Isha Sharma','Female',34,'Delhi','Delhi','2025-08-21');
INSERT INTO "customers" VALUES(50,'Aanya Khan','Other',49,'Pune','Maharashtra','2025-03-21');
INSERT INTO "customers" VALUES(51,'Sahil Patel','Male',55,'Mumbai','Maharashtra','2025-10-05');
INSERT INTO "customers" VALUES(52,'Ananya Sharma','Male',55,'Ajmer','Rajasthan','2025-09-02');
INSERT INTO "customers" VALUES(53,'Meera Gupta','Male',50,'Kolkata','West Bengal','2025-02-11');
INSERT INTO "customers" VALUES(54,'Kunal Jain','Other',22,'Bhopal','Madhya Pradesh','2025-05-01');
INSERT INTO "customers" VALUES(55,'Arjun Joshi','Male',55,'Hyderabad','Telangana','2025-01-21');
INSERT INTO "customers" VALUES(56,'Aditya Mehta','Other',55,'Ahmedabad','Gujarat','2025-10-17');
INSERT INTO "customers" VALUES(57,'Ananya Singh','Male',38,'Kolkata','West Bengal','2025-05-03');
INSERT INTO "customers" VALUES(58,'Isha Gupta','Other',37,'Pune','Maharashtra','2025-08-23');
INSERT INTO "customers" VALUES(59,'Aditya Sharma','Female',54,'Bengaluru','Karnataka','2025-02-21');
INSERT INTO "customers" VALUES(60,'Sneha Patel','Other',34,'Jaipur','Rajasthan','2025-03-09');
INSERT INTO "customers" VALUES(61,'Diya Jain','Male',41,'Chandigarh','Chandigarh','2025-05-26');
INSERT INTO "customers" VALUES(62,'Priya Khan','Other',37,'Delhi','Delhi','2025-09-28');
INSERT INTO "customers" VALUES(63,'Sneha Singh','Other',24,'Ajmer','Rajasthan','2025-03-10');
INSERT INTO "customers" VALUES(64,'Arjun Jain','Other',53,'Pune','Maharashtra','2025-03-21');
INSERT INTO "customers" VALUES(65,'Sahil Joshi','Male',39,'Pune','Maharashtra','2025-04-15');
INSERT INTO "customers" VALUES(66,'Ishaan Khan','Female',34,'Lucknow','Uttar Pradesh','2025-01-27');
INSERT INTO "customers" VALUES(67,'Aanya Singh','Male',18,'Jaipur','Rajasthan','2025-06-20');
INSERT INTO "customers" VALUES(68,'Rohan Singh','Male',46,'Kochi','Kerala','2025-10-10');
INSERT INTO "customers" VALUES(69,'Aanya Khan','Male',25,'Indore','Madhya Pradesh','2025-02-08');
INSERT INTO "customers" VALUES(70,'Rohan Khan','Male',41,'Chandigarh','Chandigarh','2025-10-26');
INSERT INTO "customers" VALUES(71,'Rohan Mehta','Male',20,'Kolkata','West Bengal','2025-06-07');
INSERT INTO "customers" VALUES(72,'Vivaan Verma','Male',33,'Bengaluru','Karnataka','2025-02-22');
INSERT INTO "customers" VALUES(73,'Sneha Mehta','Other',27,'Bengaluru','Karnataka','2025-05-02');
INSERT INTO "customers" VALUES(74,'Kunal Gupta','Female',19,'Bhopal','Madhya Pradesh','2025-04-02');
INSERT INTO "customers" VALUES(75,'Ananya Mehta','Other',33,'Indore','Madhya Pradesh','2025-05-17');
INSERT INTO "customers" VALUES(76,'Arjun Mehta','Male',48,'Delhi','Delhi','2025-04-24');
INSERT INTO "customers" VALUES(77,'Priya Verma','Female',32,'Mumbai','Maharashtra','2025-04-25');
INSERT INTO "customers" VALUES(78,'Rahul Mehta','Female',35,'Ajmer','Rajasthan','2025-02-05');
INSERT INTO "customers" VALUES(79,'Ishaan Verma','Other',50,'Kochi','Kerala','2025-07-24');
INSERT INTO "customers" VALUES(80,'Sneha Verma','Male',25,'Lucknow','Uttar Pradesh','2025-05-14');
INSERT INTO "customers" VALUES(81,'Pooja Singh','Male',24,'Delhi','Delhi','2025-08-11');
INSERT INTO "customers" VALUES(82,'Ananya Mehta','Other',50,'Bengaluru','Karnataka','2025-03-01');
INSERT INTO "customers" VALUES(83,'Pooja Patel','Female',20,'Hyderabad','Telangana','2025-08-12');
INSERT INTO "customers" VALUES(84,'Meera Khan','Other',30,'Ajmer','Rajasthan','2025-07-06');
INSERT INTO "customers" VALUES(85,'Aditya Verma','Other',38,'Hyderabad','Telangana','2025-03-05');
INSERT INTO "customers" VALUES(86,'Sahil Khan','Female',44,'Indore','Madhya Pradesh','2025-06-17');
INSERT INTO "customers" VALUES(87,'Sahil Khan','Male',30,'Hyderabad','Telangana','2025-08-04');
INSERT INTO "customers" VALUES(88,'Isha Gupta','Other',54,'Lucknow','Uttar Pradesh','2025-06-04');
INSERT INTO "customers" VALUES(89,'Sneha Sharma','Female',36,'Hyderabad','Telangana','2025-04-18');
INSERT INTO "customers" VALUES(90,'Pooja Joshi','Other',38,'Hyderabad','Telangana','2025-08-27');
INSERT INTO "customers" VALUES(91,'Priya Patel','Other',48,'Chennai','Tamil Nadu','2025-03-28');
INSERT INTO "customers" VALUES(92,'Aditya Singh','Other',39,'Lucknow','Uttar Pradesh','2025-02-17');
INSERT INTO "customers" VALUES(93,'Yash Singh','Male',30,'Bhopal','Madhya Pradesh','2025-03-17');
INSERT INTO "customers" VALUES(94,'Vivaan Patel','Female',22,'Ajmer','Rajasthan','2025-08-22');
INSERT INTO "customers" VALUES(95,'Pooja Patel','Other',42,'Hyderabad','Telangana','2025-09-11');
INSERT INTO "customers" VALUES(96,'Yash Gupta','Other',18,'Hyderabad','Telangana','2025-02-24');
INSERT INTO "customers" VALUES(97,'Aanya Patel','Male',51,'Kochi','Kerala','2025-08-26');
INSERT INTO "customers" VALUES(98,'Sneha Patel','Male',47,'Ajmer','Rajasthan','2025-03-10');
INSERT INTO "customers" VALUES(99,'Priya Khan','Other',38,'Kochi','Kerala','2025-08-15');
INSERT INTO "customers" VALUES(100,'Meera Mehta','Other',46,'Ahmedabad','Gujarat','2025-03-23');
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK(quantity > 0),
    unit_price REAL NOT NULL CHECK(unit_price > 0),
    discount_pct REAL NOT NULL DEFAULT 0 CHECK(discount_pct BETWEEN 0 AND 100),
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);
INSERT INTO "order_items" VALUES(1,1,3,2,54999.0,15.0);
INSERT INTO "order_items" VALUES(2,2,3,1,54999.0,5.0);
INSERT INTO "order_items" VALUES(3,3,19,2,999.0,15.0);
INSERT INTO "order_items" VALUES(4,3,18,3,1799.0,5.0);
INSERT INTO "order_items" VALUES(5,3,11,2,199.0,15.0);
INSERT INTO "order_items" VALUES(6,4,14,3,899.0,20.0);
INSERT INTO "order_items" VALUES(7,4,4,3,2999.0,20.0);
INSERT INTO "order_items" VALUES(8,4,19,1,999.0,10.0);
INSERT INTO "order_items" VALUES(9,5,8,2,3299.0,10.0);
INSERT INTO "order_items" VALUES(10,5,14,2,899.0,10.0);
INSERT INTO "order_items" VALUES(11,6,4,2,2999.0,20.0);
INSERT INTO "order_items" VALUES(12,6,11,2,199.0,5.0);
INSERT INTO "order_items" VALUES(13,6,14,1,899.0,20.0);
INSERT INTO "order_items" VALUES(14,7,3,1,54999.0,0.0);
INSERT INTO "order_items" VALUES(15,7,20,2,399.0,0.0);
INSERT INTO "order_items" VALUES(16,8,12,1,549.0,15.0);
INSERT INTO "order_items" VALUES(17,8,5,3,1299.0,15.0);
INSERT INTO "order_items" VALUES(18,8,18,2,1799.0,20.0);
INSERT INTO "order_items" VALUES(19,9,14,2,899.0,20.0);
INSERT INTO "order_items" VALUES(20,10,2,3,18999.0,5.0);
INSERT INTO "order_items" VALUES(21,10,10,2,1599.0,0.0);
INSERT INTO "order_items" VALUES(22,11,17,3,3499.0,10.0);
INSERT INTO "order_items" VALUES(23,11,7,1,2499.0,0.0);
INSERT INTO "order_items" VALUES(24,11,5,2,1299.0,15.0);
INSERT INTO "order_items" VALUES(25,12,4,3,2999.0,0.0);
INSERT INTO "order_items" VALUES(26,12,9,2,2199.0,15.0);
INSERT INTO "order_items" VALUES(27,13,20,3,399.0,20.0);
INSERT INTO "order_items" VALUES(28,13,18,3,1799.0,5.0);
INSERT INTO "order_items" VALUES(29,13,1,1,1499.0,0.0);
INSERT INTO "order_items" VALUES(30,14,10,2,1599.0,0.0);
INSERT INTO "order_items" VALUES(31,14,11,1,199.0,0.0);
INSERT INTO "order_items" VALUES(32,15,13,3,699.0,20.0);
INSERT INTO "order_items" VALUES(33,15,3,1,54999.0,0.0);
INSERT INTO "order_items" VALUES(34,15,5,3,1299.0,15.0);
INSERT INTO "order_items" VALUES(35,16,13,2,699.0,10.0);
INSERT INTO "order_items" VALUES(36,17,6,2,1899.0,20.0);
INSERT INTO "order_items" VALUES(37,17,12,2,549.0,15.0);
INSERT INTO "order_items" VALUES(38,18,3,1,54999.0,15.0);
INSERT INTO "order_items" VALUES(39,18,2,1,18999.0,20.0);
INSERT INTO "order_items" VALUES(40,18,5,1,1299.0,5.0);
INSERT INTO "order_items" VALUES(41,19,14,3,899.0,10.0);
INSERT INTO "order_items" VALUES(42,19,16,2,149.0,5.0);
INSERT INTO "order_items" VALUES(43,20,17,1,3499.0,5.0);
INSERT INTO "order_items" VALUES(44,21,4,3,2999.0,20.0);
INSERT INTO "order_items" VALUES(45,21,10,3,1599.0,10.0);
INSERT INTO "order_items" VALUES(46,22,10,2,1599.0,15.0);
INSERT INTO "order_items" VALUES(47,22,2,1,18999.0,0.0);
INSERT INTO "order_items" VALUES(48,22,8,1,3299.0,5.0);
INSERT INTO "order_items" VALUES(49,23,5,2,1299.0,5.0);
INSERT INTO "order_items" VALUES(50,24,4,2,2999.0,20.0);
INSERT INTO "order_items" VALUES(51,24,1,2,1499.0,0.0);
INSERT INTO "order_items" VALUES(52,25,13,3,699.0,20.0);
INSERT INTO "order_items" VALUES(53,26,17,3,3499.0,20.0);
INSERT INTO "order_items" VALUES(54,27,3,3,54999.0,0.0);
INSERT INTO "order_items" VALUES(55,27,13,2,699.0,0.0);
INSERT INTO "order_items" VALUES(56,28,3,3,54999.0,10.0);
INSERT INTO "order_items" VALUES(57,28,11,3,199.0,10.0);
INSERT INTO "order_items" VALUES(58,29,14,2,899.0,0.0);
INSERT INTO "order_items" VALUES(59,29,10,2,1599.0,0.0);
INSERT INTO "order_items" VALUES(60,29,4,3,2999.0,10.0);
INSERT INTO "order_items" VALUES(61,30,12,1,549.0,0.0);
INSERT INTO "order_items" VALUES(62,30,3,2,54999.0,15.0);
INSERT INTO "order_items" VALUES(63,30,14,2,899.0,15.0);
INSERT INTO "order_items" VALUES(64,31,13,2,699.0,20.0);
INSERT INTO "order_items" VALUES(65,32,8,1,3299.0,0.0);
INSERT INTO "order_items" VALUES(66,32,11,3,199.0,20.0);
INSERT INTO "order_items" VALUES(67,33,17,3,3499.0,0.0);
INSERT INTO "order_items" VALUES(68,34,12,1,549.0,0.0);
INSERT INTO "order_items" VALUES(69,34,5,1,1299.0,5.0);
INSERT INTO "order_items" VALUES(70,35,6,3,1899.0,0.0);
INSERT INTO "order_items" VALUES(71,36,3,2,54999.0,15.0);
INSERT INTO "order_items" VALUES(72,36,6,3,1899.0,10.0);
INSERT INTO "order_items" VALUES(73,36,16,3,149.0,15.0);
INSERT INTO "order_items" VALUES(74,37,20,1,399.0,10.0);
INSERT INTO "order_items" VALUES(75,37,11,1,199.0,10.0);
INSERT INTO "order_items" VALUES(76,37,19,2,999.0,20.0);
INSERT INTO "order_items" VALUES(77,38,9,1,2199.0,5.0);
INSERT INTO "order_items" VALUES(78,38,19,3,999.0,0.0);
INSERT INTO "order_items" VALUES(79,39,15,1,649.0,0.0);
INSERT INTO "order_items" VALUES(80,39,20,2,399.0,5.0);
INSERT INTO "order_items" VALUES(81,40,3,3,54999.0,15.0);
INSERT INTO "order_items" VALUES(82,41,13,3,699.0,0.0);
INSERT INTO "order_items" VALUES(83,41,15,2,649.0,15.0);
INSERT INTO "order_items" VALUES(84,41,18,3,1799.0,0.0);
INSERT INTO "order_items" VALUES(85,42,20,3,399.0,0.0);
INSERT INTO "order_items" VALUES(86,42,16,1,149.0,10.0);
INSERT INTO "order_items" VALUES(87,43,11,3,199.0,0.0);
INSERT INTO "order_items" VALUES(88,44,6,3,1899.0,10.0);
INSERT INTO "order_items" VALUES(89,44,2,2,18999.0,15.0);
INSERT INTO "order_items" VALUES(90,44,8,3,3299.0,15.0);
INSERT INTO "order_items" VALUES(91,45,12,2,549.0,5.0);
INSERT INTO "order_items" VALUES(92,46,14,3,899.0,15.0);
INSERT INTO "order_items" VALUES(93,46,11,1,199.0,20.0);
INSERT INTO "order_items" VALUES(94,47,11,1,199.0,15.0);
INSERT INTO "order_items" VALUES(95,47,3,3,54999.0,10.0);
INSERT INTO "order_items" VALUES(96,47,20,2,399.0,5.0);
INSERT INTO "order_items" VALUES(97,48,20,1,399.0,15.0);
INSERT INTO "order_items" VALUES(98,48,5,3,1299.0,0.0);
INSERT INTO "order_items" VALUES(99,48,11,2,199.0,5.0);
INSERT INTO "order_items" VALUES(100,49,13,2,699.0,15.0);
INSERT INTO "order_items" VALUES(101,49,5,2,1299.0,20.0);
INSERT INTO "order_items" VALUES(102,49,3,2,54999.0,0.0);
INSERT INTO "order_items" VALUES(103,50,17,3,3499.0,5.0);
INSERT INTO "order_items" VALUES(104,50,3,1,54999.0,5.0);
INSERT INTO "order_items" VALUES(105,50,14,2,899.0,0.0);
INSERT INTO "order_items" VALUES(106,51,11,2,199.0,0.0);
INSERT INTO "order_items" VALUES(107,52,5,1,1299.0,0.0);
INSERT INTO "order_items" VALUES(108,53,4,3,2999.0,20.0);
INSERT INTO "order_items" VALUES(109,53,17,3,3499.0,0.0);
INSERT INTO "order_items" VALUES(110,54,11,1,199.0,0.0);
INSERT INTO "order_items" VALUES(111,54,5,1,1299.0,20.0);
INSERT INTO "order_items" VALUES(112,54,13,3,699.0,0.0);
INSERT INTO "order_items" VALUES(113,55,15,2,649.0,20.0);
INSERT INTO "order_items" VALUES(114,55,2,3,18999.0,0.0);
INSERT INTO "order_items" VALUES(115,55,14,2,899.0,15.0);
INSERT INTO "order_items" VALUES(116,56,15,3,649.0,0.0);
INSERT INTO "order_items" VALUES(117,56,8,2,3299.0,10.0);
INSERT INTO "order_items" VALUES(118,57,12,3,549.0,15.0);
INSERT INTO "order_items" VALUES(119,58,15,2,649.0,15.0);
INSERT INTO "order_items" VALUES(120,58,10,3,1599.0,10.0);
INSERT INTO "order_items" VALUES(121,59,7,3,2499.0,0.0);
INSERT INTO "order_items" VALUES(122,60,2,2,18999.0,15.0);
INSERT INTO "order_items" VALUES(123,60,16,1,149.0,20.0);
INSERT INTO "order_items" VALUES(124,61,4,1,2999.0,5.0);
INSERT INTO "order_items" VALUES(125,61,10,2,1599.0,15.0);
INSERT INTO "order_items" VALUES(126,61,3,1,54999.0,10.0);
INSERT INTO "order_items" VALUES(127,62,8,2,3299.0,5.0);
INSERT INTO "order_items" VALUES(128,63,14,1,899.0,10.0);
INSERT INTO "order_items" VALUES(129,64,12,1,549.0,5.0);
INSERT INTO "order_items" VALUES(130,64,8,1,3299.0,0.0);
INSERT INTO "order_items" VALUES(131,64,13,2,699.0,0.0);
INSERT INTO "order_items" VALUES(132,65,11,1,199.0,5.0);
INSERT INTO "order_items" VALUES(133,65,5,2,1299.0,20.0);
INSERT INTO "order_items" VALUES(134,65,19,1,999.0,20.0);
INSERT INTO "order_items" VALUES(135,66,15,1,649.0,0.0);
INSERT INTO "order_items" VALUES(136,66,1,2,1499.0,0.0);
INSERT INTO "order_items" VALUES(137,67,18,3,1799.0,15.0);
INSERT INTO "order_items" VALUES(138,68,14,1,899.0,5.0);
INSERT INTO "order_items" VALUES(139,68,4,1,2999.0,0.0);
INSERT INTO "order_items" VALUES(140,68,10,1,1599.0,10.0);
INSERT INTO "order_items" VALUES(141,69,20,1,399.0,10.0);
INSERT INTO "order_items" VALUES(142,69,15,3,649.0,15.0);
INSERT INTO "order_items" VALUES(143,69,3,1,54999.0,20.0);
INSERT INTO "order_items" VALUES(144,70,19,2,999.0,10.0);
INSERT INTO "order_items" VALUES(145,70,8,1,3299.0,15.0);
INSERT INTO "order_items" VALUES(146,70,5,2,1299.0,0.0);
INSERT INTO "order_items" VALUES(147,71,14,3,899.0,5.0);
INSERT INTO "order_items" VALUES(148,71,6,1,1899.0,15.0);
INSERT INTO "order_items" VALUES(149,71,3,3,54999.0,15.0);
INSERT INTO "order_items" VALUES(150,72,18,2,1799.0,0.0);
INSERT INTO "order_items" VALUES(151,72,1,3,1499.0,10.0);
INSERT INTO "order_items" VALUES(152,72,13,2,699.0,5.0);
INSERT INTO "order_items" VALUES(153,73,1,2,1499.0,0.0);
INSERT INTO "order_items" VALUES(154,73,12,3,549.0,20.0);
INSERT INTO "order_items" VALUES(155,73,3,3,54999.0,0.0);
INSERT INTO "order_items" VALUES(156,74,11,2,199.0,15.0);
INSERT INTO "order_items" VALUES(157,74,5,2,1299.0,20.0);
INSERT INTO "order_items" VALUES(158,74,2,1,18999.0,20.0);
INSERT INTO "order_items" VALUES(159,75,16,1,149.0,0.0);
INSERT INTO "order_items" VALUES(160,75,6,3,1899.0,10.0);
INSERT INTO "order_items" VALUES(161,76,10,1,1599.0,0.0);
INSERT INTO "order_items" VALUES(162,77,2,2,18999.0,5.0);
INSERT INTO "order_items" VALUES(163,78,13,2,699.0,0.0);
INSERT INTO "order_items" VALUES(164,78,18,3,1799.0,0.0);
INSERT INTO "order_items" VALUES(165,78,16,2,149.0,5.0);
INSERT INTO "order_items" VALUES(166,79,11,2,199.0,0.0);
INSERT INTO "order_items" VALUES(167,80,14,3,899.0,10.0);
INSERT INTO "order_items" VALUES(168,80,13,2,699.0,5.0);
INSERT INTO "order_items" VALUES(169,81,16,3,149.0,10.0);
INSERT INTO "order_items" VALUES(170,82,17,1,3499.0,20.0);
INSERT INTO "order_items" VALUES(171,82,9,2,2199.0,0.0);
INSERT INTO "order_items" VALUES(172,83,20,3,399.0,5.0);
INSERT INTO "order_items" VALUES(173,83,6,2,1899.0,0.0);
INSERT INTO "order_items" VALUES(174,84,11,3,199.0,5.0);
INSERT INTO "order_items" VALUES(175,85,15,1,649.0,20.0);
INSERT INTO "order_items" VALUES(176,85,14,2,899.0,5.0);
INSERT INTO "order_items" VALUES(177,86,2,3,18999.0,10.0);
INSERT INTO "order_items" VALUES(178,86,12,2,549.0,20.0);
INSERT INTO "order_items" VALUES(179,87,3,3,54999.0,20.0);
INSERT INTO "order_items" VALUES(180,88,12,3,549.0,20.0);
INSERT INTO "order_items" VALUES(181,88,17,1,3499.0,0.0);
INSERT INTO "order_items" VALUES(182,89,20,3,399.0,10.0);
INSERT INTO "order_items" VALUES(183,90,5,1,1299.0,0.0);
INSERT INTO "order_items" VALUES(184,91,12,3,549.0,0.0);
INSERT INTO "order_items" VALUES(185,91,20,3,399.0,0.0);
INSERT INTO "order_items" VALUES(186,91,13,3,699.0,10.0);
INSERT INTO "order_items" VALUES(187,92,12,1,549.0,15.0);
INSERT INTO "order_items" VALUES(188,92,15,1,649.0,15.0);
INSERT INTO "order_items" VALUES(189,93,13,3,699.0,5.0);
INSERT INTO "order_items" VALUES(190,93,11,1,199.0,0.0);
INSERT INTO "order_items" VALUES(191,94,6,2,1899.0,15.0);
INSERT INTO "order_items" VALUES(192,95,18,2,1799.0,5.0);
INSERT INTO "order_items" VALUES(193,95,4,3,2999.0,10.0);
INSERT INTO "order_items" VALUES(194,96,20,2,399.0,20.0);
INSERT INTO "order_items" VALUES(195,97,7,1,2499.0,0.0);
INSERT INTO "order_items" VALUES(196,97,4,2,2999.0,0.0);
INSERT INTO "order_items" VALUES(197,98,15,3,649.0,5.0);
INSERT INTO "order_items" VALUES(198,98,3,3,54999.0,0.0);
INSERT INTO "order_items" VALUES(199,98,11,3,199.0,15.0);
INSERT INTO "order_items" VALUES(200,99,10,3,1599.0,20.0);
INSERT INTO "order_items" VALUES(201,99,6,3,1899.0,20.0);
INSERT INTO "order_items" VALUES(202,100,12,3,549.0,0.0);
INSERT INTO "order_items" VALUES(203,101,7,1,2499.0,0.0);
INSERT INTO "order_items" VALUES(204,102,1,3,1499.0,15.0);
INSERT INTO "order_items" VALUES(205,102,12,2,549.0,10.0);
INSERT INTO "order_items" VALUES(206,103,5,2,1299.0,10.0);
INSERT INTO "order_items" VALUES(207,103,3,3,54999.0,20.0);
INSERT INTO "order_items" VALUES(208,103,19,2,999.0,15.0);
INSERT INTO "order_items" VALUES(209,104,14,1,899.0,0.0);
INSERT INTO "order_items" VALUES(210,104,19,2,999.0,20.0);
INSERT INTO "order_items" VALUES(211,105,15,2,649.0,20.0);
INSERT INTO "order_items" VALUES(212,106,12,3,549.0,15.0);
INSERT INTO "order_items" VALUES(213,106,5,1,1299.0,0.0);
INSERT INTO "order_items" VALUES(214,106,18,2,1799.0,15.0);
INSERT INTO "order_items" VALUES(215,107,4,3,2999.0,0.0);
INSERT INTO "order_items" VALUES(216,108,6,2,1899.0,20.0);
INSERT INTO "order_items" VALUES(217,108,20,1,399.0,5.0);
INSERT INTO "order_items" VALUES(218,109,10,1,1599.0,20.0);
INSERT INTO "order_items" VALUES(219,109,3,3,54999.0,5.0);
INSERT INTO "order_items" VALUES(220,109,9,1,2199.0,20.0);
INSERT INTO "order_items" VALUES(221,110,20,1,399.0,15.0);
INSERT INTO "order_items" VALUES(222,110,18,3,1799.0,0.0);
INSERT INTO "order_items" VALUES(223,111,19,3,999.0,15.0);
INSERT INTO "order_items" VALUES(224,111,5,3,1299.0,15.0);
INSERT INTO "order_items" VALUES(225,111,6,2,1899.0,15.0);
INSERT INTO "order_items" VALUES(226,112,1,1,1499.0,0.0);
INSERT INTO "order_items" VALUES(227,113,19,3,999.0,10.0);
INSERT INTO "order_items" VALUES(228,113,9,3,2199.0,20.0);
INSERT INTO "order_items" VALUES(229,113,7,1,2499.0,10.0);
INSERT INTO "order_items" VALUES(230,114,18,2,1799.0,0.0);
INSERT INTO "order_items" VALUES(231,114,10,3,1599.0,10.0);
INSERT INTO "order_items" VALUES(232,114,19,2,999.0,10.0);
INSERT INTO "order_items" VALUES(233,115,2,1,18999.0,10.0);
INSERT INTO "order_items" VALUES(234,116,16,1,149.0,5.0);
INSERT INTO "order_items" VALUES(235,116,15,3,649.0,0.0);
INSERT INTO "order_items" VALUES(236,117,11,2,199.0,0.0);
INSERT INTO "order_items" VALUES(237,117,12,2,549.0,15.0);
INSERT INTO "order_items" VALUES(238,118,4,2,2999.0,0.0);
INSERT INTO "order_items" VALUES(239,118,11,2,199.0,10.0);
INSERT INTO "order_items" VALUES(240,118,8,1,3299.0,0.0);
INSERT INTO "order_items" VALUES(241,119,2,2,18999.0,10.0);
INSERT INTO "order_items" VALUES(242,120,14,2,899.0,15.0);
INSERT INTO "order_items" VALUES(243,120,8,3,3299.0,5.0);
INSERT INTO "order_items" VALUES(244,120,6,1,1899.0,0.0);
INSERT INTO "order_items" VALUES(245,121,17,2,3499.0,5.0);
INSERT INTO "order_items" VALUES(246,121,15,2,649.0,0.0);
INSERT INTO "order_items" VALUES(247,122,13,3,699.0,10.0);
INSERT INTO "order_items" VALUES(248,123,7,3,2499.0,5.0);
INSERT INTO "order_items" VALUES(249,124,2,2,18999.0,10.0);
INSERT INTO "order_items" VALUES(250,125,16,1,149.0,0.0);
INSERT INTO "order_items" VALUES(251,125,10,2,1599.0,0.0);
INSERT INTO "order_items" VALUES(252,125,18,2,1799.0,20.0);
INSERT INTO "order_items" VALUES(253,126,13,1,699.0,10.0);
INSERT INTO "order_items" VALUES(254,126,12,1,549.0,15.0);
INSERT INTO "order_items" VALUES(255,127,7,2,2499.0,0.0);
INSERT INTO "order_items" VALUES(256,127,12,2,549.0,15.0);
INSERT INTO "order_items" VALUES(257,127,18,2,1799.0,15.0);
INSERT INTO "order_items" VALUES(258,128,20,1,399.0,0.0);
INSERT INTO "order_items" VALUES(259,128,4,2,2999.0,5.0);
INSERT INTO "order_items" VALUES(260,129,18,1,1799.0,0.0);
INSERT INTO "order_items" VALUES(261,129,12,3,549.0,15.0);
INSERT INTO "order_items" VALUES(262,130,17,1,3499.0,0.0);
INSERT INTO "order_items" VALUES(263,130,2,1,18999.0,20.0);
INSERT INTO "order_items" VALUES(264,131,16,2,149.0,0.0);
INSERT INTO "order_items" VALUES(265,131,17,3,3499.0,15.0);
INSERT INTO "order_items" VALUES(266,132,11,3,199.0,5.0);
INSERT INTO "order_items" VALUES(267,133,13,3,699.0,20.0);
INSERT INTO "order_items" VALUES(268,134,19,3,999.0,15.0);
INSERT INTO "order_items" VALUES(269,134,11,3,199.0,10.0);
INSERT INTO "order_items" VALUES(270,135,19,1,999.0,5.0);
INSERT INTO "order_items" VALUES(271,135,10,2,1599.0,20.0);
INSERT INTO "order_items" VALUES(272,135,16,1,149.0,10.0);
INSERT INTO "order_items" VALUES(273,136,10,2,1599.0,20.0);
INSERT INTO "order_items" VALUES(274,136,1,3,1499.0,15.0);
INSERT INTO "order_items" VALUES(275,136,16,1,149.0,20.0);
INSERT INTO "order_items" VALUES(276,137,19,2,999.0,0.0);
INSERT INTO "order_items" VALUES(277,138,20,3,399.0,0.0);
INSERT INTO "order_items" VALUES(278,138,13,1,699.0,15.0);
INSERT INTO "order_items" VALUES(279,138,5,3,1299.0,0.0);
INSERT INTO "order_items" VALUES(280,139,1,2,1499.0,5.0);
INSERT INTO "order_items" VALUES(281,140,5,3,1299.0,0.0);
INSERT INTO "order_items" VALUES(282,140,14,2,899.0,15.0);
INSERT INTO "order_items" VALUES(283,141,16,3,149.0,0.0);
INSERT INTO "order_items" VALUES(284,141,2,3,18999.0,5.0);
INSERT INTO "order_items" VALUES(285,141,5,3,1299.0,10.0);
INSERT INTO "order_items" VALUES(286,142,13,2,699.0,15.0);
INSERT INTO "order_items" VALUES(287,142,11,2,199.0,15.0);
INSERT INTO "order_items" VALUES(288,142,6,2,1899.0,20.0);
INSERT INTO "order_items" VALUES(289,143,9,1,2199.0,5.0);
INSERT INTO "order_items" VALUES(290,143,16,3,149.0,5.0);
INSERT INTO "order_items" VALUES(291,143,7,1,2499.0,5.0);
INSERT INTO "order_items" VALUES(292,144,7,2,2499.0,10.0);
INSERT INTO "order_items" VALUES(293,144,16,2,149.0,15.0);
INSERT INTO "order_items" VALUES(294,145,9,3,2199.0,20.0);
INSERT INTO "order_items" VALUES(295,145,10,3,1599.0,10.0);
INSERT INTO "order_items" VALUES(296,145,4,2,2999.0,5.0);
INSERT INTO "order_items" VALUES(297,146,10,1,1599.0,5.0);
INSERT INTO "order_items" VALUES(298,147,3,3,54999.0,5.0);
INSERT INTO "order_items" VALUES(299,147,12,3,549.0,10.0);
INSERT INTO "order_items" VALUES(300,147,15,1,649.0,0.0);
INSERT INTO "order_items" VALUES(301,148,9,1,2199.0,0.0);
INSERT INTO "order_items" VALUES(302,148,18,3,1799.0,20.0);
INSERT INTO "order_items" VALUES(303,148,20,3,399.0,0.0);
INSERT INTO "order_items" VALUES(304,149,2,3,18999.0,15.0);
INSERT INTO "order_items" VALUES(305,150,8,1,3299.0,0.0);
INSERT INTO "order_items" VALUES(306,151,11,1,199.0,20.0);
INSERT INTO "order_items" VALUES(307,151,16,1,149.0,0.0);
INSERT INTO "order_items" VALUES(308,152,6,2,1899.0,20.0);
INSERT INTO "order_items" VALUES(309,152,14,1,899.0,5.0);
INSERT INTO "order_items" VALUES(310,152,16,2,149.0,5.0);
INSERT INTO "order_items" VALUES(311,153,2,3,18999.0,20.0);
INSERT INTO "order_items" VALUES(312,153,3,3,54999.0,0.0);
INSERT INTO "order_items" VALUES(313,153,8,1,3299.0,10.0);
INSERT INTO "order_items" VALUES(314,154,2,2,18999.0,10.0);
INSERT INTO "order_items" VALUES(315,155,10,1,1599.0,0.0);
INSERT INTO "order_items" VALUES(316,156,19,2,999.0,5.0);
INSERT INTO "order_items" VALUES(317,156,4,2,2999.0,20.0);
INSERT INTO "order_items" VALUES(318,157,17,3,3499.0,10.0);
INSERT INTO "order_items" VALUES(319,157,16,2,149.0,0.0);
INSERT INTO "order_items" VALUES(320,157,5,1,1299.0,5.0);
INSERT INTO "order_items" VALUES(321,158,15,3,649.0,5.0);
INSERT INTO "order_items" VALUES(322,159,6,2,1899.0,15.0);
INSERT INTO "order_items" VALUES(323,159,1,3,1499.0,0.0);
INSERT INTO "order_items" VALUES(324,159,11,1,199.0,15.0);
INSERT INTO "order_items" VALUES(325,160,13,2,699.0,0.0);
INSERT INTO "order_items" VALUES(326,160,14,2,899.0,20.0);
INSERT INTO "order_items" VALUES(327,160,17,1,3499.0,0.0);
INSERT INTO "order_items" VALUES(328,161,16,2,149.0,0.0);
INSERT INTO "order_items" VALUES(329,162,9,2,2199.0,0.0);
INSERT INTO "order_items" VALUES(330,163,9,2,2199.0,15.0);
INSERT INTO "order_items" VALUES(331,163,11,3,199.0,15.0);
INSERT INTO "order_items" VALUES(332,164,9,3,2199.0,5.0);
INSERT INTO "order_items" VALUES(333,165,8,2,3299.0,5.0);
INSERT INTO "order_items" VALUES(334,165,2,1,18999.0,10.0);
INSERT INTO "order_items" VALUES(335,165,4,3,2999.0,15.0);
INSERT INTO "order_items" VALUES(336,166,10,2,1599.0,15.0);
INSERT INTO "order_items" VALUES(337,166,4,1,2999.0,0.0);
INSERT INTO "order_items" VALUES(338,166,20,1,399.0,10.0);
INSERT INTO "order_items" VALUES(339,167,15,3,649.0,15.0);
INSERT INTO "order_items" VALUES(340,168,14,2,899.0,15.0);
INSERT INTO "order_items" VALUES(341,168,18,3,1799.0,0.0);
INSERT INTO "order_items" VALUES(342,169,20,1,399.0,15.0);
INSERT INTO "order_items" VALUES(343,170,17,1,3499.0,15.0);
INSERT INTO "order_items" VALUES(344,170,12,1,549.0,0.0);
INSERT INTO "order_items" VALUES(345,171,17,1,3499.0,0.0);
INSERT INTO "order_items" VALUES(346,171,7,2,2499.0,15.0);
INSERT INTO "order_items" VALUES(347,171,18,2,1799.0,0.0);
INSERT INTO "order_items" VALUES(348,172,7,1,2499.0,15.0);
INSERT INTO "order_items" VALUES(349,172,19,2,999.0,0.0);
INSERT INTO "order_items" VALUES(350,172,16,2,149.0,0.0);
INSERT INTO "order_items" VALUES(351,173,14,3,899.0,10.0);
INSERT INTO "order_items" VALUES(352,173,15,3,649.0,5.0);
INSERT INTO "order_items" VALUES(353,173,2,3,18999.0,0.0);
INSERT INTO "order_items" VALUES(354,174,9,3,2199.0,0.0);
INSERT INTO "order_items" VALUES(355,174,1,3,1499.0,0.0);
INSERT INTO "order_items" VALUES(356,175,14,2,899.0,20.0);
INSERT INTO "order_items" VALUES(357,176,18,1,1799.0,0.0);
INSERT INTO "order_items" VALUES(358,177,2,2,18999.0,0.0);
INSERT INTO "order_items" VALUES(359,177,10,1,1599.0,20.0);
INSERT INTO "order_items" VALUES(360,178,14,2,899.0,10.0);
INSERT INTO "order_items" VALUES(361,178,12,2,549.0,0.0);
INSERT INTO "order_items" VALUES(362,178,13,3,699.0,20.0);
INSERT INTO "order_items" VALUES(363,179,5,1,1299.0,15.0);
INSERT INTO "order_items" VALUES(364,179,12,2,549.0,15.0);
INSERT INTO "order_items" VALUES(365,179,4,1,2999.0,20.0);
INSERT INTO "order_items" VALUES(366,180,1,1,1499.0,5.0);
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date TEXT NOT NULL,
    order_status TEXT NOT NULL CHECK(order_status IN ('Delivered','Shipped','Processing','Cancelled')),
    payment_method TEXT NOT NULL CHECK(payment_method IN ('UPI','Credit Card','Debit Card','Cash on Delivery','Net Banking')),
    shipping_city TEXT NOT NULL,
    shipping_state TEXT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
INSERT INTO "orders" VALUES(1,96,'2025-07-31','Delivered','Credit Card','Pune','Maharashtra');
INSERT INTO "orders" VALUES(2,82,'2025-06-10','Cancelled','Net Banking','Kochi','Kerala');
INSERT INTO "orders" VALUES(3,63,'2025-09-08','Delivered','Cash on Delivery','Pune','Maharashtra');
INSERT INTO "orders" VALUES(4,10,'2025-06-13','Delivered','Debit Card','Pune','Maharashtra');
INSERT INTO "orders" VALUES(5,41,'2025-08-17','Delivered','Credit Card','Delhi','Delhi');
INSERT INTO "orders" VALUES(6,30,'2025-07-08','Processing','Credit Card','Delhi','Delhi');
INSERT INTO "orders" VALUES(7,9,'2025-07-16','Delivered','Net Banking','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(8,60,'2025-07-16','Delivered','Cash on Delivery','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(9,50,'2025-08-28','Processing','Net Banking','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(10,49,'2025-08-01','Delivered','Debit Card','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(11,97,'2025-07-09','Delivered','Net Banking','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(12,78,'2025-05-27','Delivered','Debit Card','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(13,56,'2025-08-03','Delivered','Debit Card','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(14,86,'2025-09-21','Delivered','Credit Card','Indore','Madhya Pradesh');
INSERT INTO "orders" VALUES(15,60,'2025-05-03','Shipped','UPI','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(16,51,'2025-08-30','Shipped','UPI','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(17,11,'2025-09-12','Delivered','Cash on Delivery','Delhi','Delhi');
INSERT INTO "orders" VALUES(18,24,'2025-04-13','Delivered','Debit Card','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(19,28,'2025-07-26','Delivered','Cash on Delivery','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(20,36,'2025-07-17','Delivered','UPI','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(21,61,'2025-04-05','Cancelled','UPI','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(22,45,'2025-05-28','Shipped','UPI','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(23,97,'2025-04-08','Delivered','UPI','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(24,80,'2025-05-10','Delivered','Cash on Delivery','Delhi','Delhi');
INSERT INTO "orders" VALUES(25,86,'2025-04-30','Shipped','Cash on Delivery','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(26,90,'2025-06-05','Cancelled','Credit Card','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(27,78,'2025-09-03','Cancelled','UPI','Indore','Madhya Pradesh');
INSERT INTO "orders" VALUES(28,100,'2025-05-12','Delivered','Net Banking','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(29,4,'2025-06-19','Shipped','Cash on Delivery','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(30,51,'2025-05-21','Delivered','Credit Card','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(31,14,'2025-09-26','Cancelled','Net Banking','Pune','Maharashtra');
INSERT INTO "orders" VALUES(32,16,'2025-08-23','Delivered','Net Banking','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(33,55,'2025-09-17','Delivered','Net Banking','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(34,83,'2025-06-27','Delivered','Cash on Delivery','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(35,63,'2025-04-28','Delivered','Cash on Delivery','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(36,91,'2025-05-10','Delivered','Net Banking','Delhi','Delhi');
INSERT INTO "orders" VALUES(37,84,'2025-06-09','Shipped','Net Banking','Kochi','Kerala');
INSERT INTO "orders" VALUES(38,100,'2025-08-02','Delivered','Net Banking','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(39,35,'2025-06-22','Delivered','UPI','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(40,36,'2025-07-25','Delivered','Cash on Delivery','Kochi','Kerala');
INSERT INTO "orders" VALUES(41,73,'2025-09-04','Processing','Debit Card','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(42,4,'2025-08-05','Delivered','Cash on Delivery','Delhi','Delhi');
INSERT INTO "orders" VALUES(43,28,'2025-06-30','Delivered','Debit Card','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(44,77,'2025-09-27','Delivered','UPI','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(45,67,'2025-05-19','Delivered','Cash on Delivery','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(46,63,'2025-08-21','Cancelled','Cash on Delivery','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(47,83,'2025-08-04','Delivered','UPI','Kochi','Kerala');
INSERT INTO "orders" VALUES(48,12,'2025-06-15','Delivered','Credit Card','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(49,40,'2025-09-17','Shipped','Cash on Delivery','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(50,71,'2025-08-14','Delivered','Net Banking','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(51,43,'2025-06-30','Processing','Debit Card','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(52,40,'2025-06-04','Delivered','Credit Card','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(53,41,'2025-05-01','Cancelled','Credit Card','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(54,25,'2025-05-26','Cancelled','Debit Card','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(55,93,'2025-08-29','Cancelled','Net Banking','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(56,37,'2025-04-26','Delivered','Credit Card','Pune','Maharashtra');
INSERT INTO "orders" VALUES(57,47,'2025-05-16','Delivered','Net Banking','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(58,17,'2025-06-10','Delivered','Net Banking','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(59,38,'2025-09-26','Delivered','Cash on Delivery','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(60,14,'2025-04-04','Shipped','Cash on Delivery','Pune','Maharashtra');
INSERT INTO "orders" VALUES(61,62,'2025-07-22','Delivered','UPI','Delhi','Delhi');
INSERT INTO "orders" VALUES(62,33,'2025-08-01','Delivered','UPI','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(63,52,'2025-08-04','Delivered','UPI','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(64,20,'2025-05-09','Shipped','UPI','Pune','Maharashtra');
INSERT INTO "orders" VALUES(65,32,'2025-05-01','Delivered','Cash on Delivery','Kochi','Kerala');
INSERT INTO "orders" VALUES(66,78,'2025-08-31','Shipped','Net Banking','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(67,49,'2025-07-25','Delivered','Net Banking','Pune','Maharashtra');
INSERT INTO "orders" VALUES(68,55,'2025-06-18','Shipped','UPI','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(69,79,'2025-04-26','Cancelled','Credit Card','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(70,34,'2025-09-17','Delivered','Credit Card','Delhi','Delhi');
INSERT INTO "orders" VALUES(71,23,'2025-08-20','Delivered','UPI','Delhi','Delhi');
INSERT INTO "orders" VALUES(72,53,'2025-07-25','Processing','Cash on Delivery','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(73,38,'2025-04-09','Delivered','Debit Card','Pune','Maharashtra');
INSERT INTO "orders" VALUES(74,90,'2025-07-26','Delivered','Credit Card','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(75,34,'2025-09-08','Shipped','Credit Card','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(76,55,'2025-04-30','Delivered','Credit Card','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(77,35,'2025-05-07','Delivered','Credit Card','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(78,40,'2025-08-31','Cancelled','Net Banking','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(79,37,'2025-07-22','Delivered','Debit Card','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(80,90,'2025-07-13','Delivered','Net Banking','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(81,64,'2025-07-22','Delivered','UPI','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(82,56,'2025-06-22','Shipped','UPI','Pune','Maharashtra');
INSERT INTO "orders" VALUES(83,12,'2025-05-29','Processing','Net Banking','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(84,76,'2025-04-06','Cancelled','Debit Card','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(85,74,'2025-04-11','Cancelled','Credit Card','Kochi','Kerala');
INSERT INTO "orders" VALUES(86,61,'2025-08-11','Shipped','Debit Card','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(87,24,'2025-08-28','Delivered','Cash on Delivery','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(88,12,'2025-07-30','Delivered','Debit Card','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(89,42,'2025-09-19','Delivered','Credit Card','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(90,43,'2025-07-15','Processing','Debit Card','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(91,85,'2025-07-12','Cancelled','UPI','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(92,59,'2025-04-23','Delivered','Debit Card','Pune','Maharashtra');
INSERT INTO "orders" VALUES(93,15,'2025-07-13','Delivered','UPI','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(94,85,'2025-08-17','Delivered','UPI','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(95,25,'2025-08-11','Delivered','Cash on Delivery','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(96,81,'2025-07-23','Cancelled','Credit Card','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(97,35,'2025-08-19','Delivered','Debit Card','Chandigarh','Chandigarh');
INSERT INTO "orders" VALUES(98,57,'2025-09-26','Delivered','UPI','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(99,81,'2025-09-03','Delivered','Credit Card','Indore','Madhya Pradesh');
INSERT INTO "orders" VALUES(100,40,'2025-08-20','Delivered','Cash on Delivery','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(101,12,'2025-05-28','Delivered','UPI','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(102,83,'2025-05-10','Delivered','Debit Card','Chandigarh','Chandigarh');
INSERT INTO "orders" VALUES(103,66,'2025-09-28','Delivered','Cash on Delivery','Hyderabad','Telangana');
INSERT INTO "orders" VALUES(104,61,'2025-06-02','Delivered','Credit Card','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(105,50,'2025-05-19','Shipped','Credit Card','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(106,9,'2025-06-10','Cancelled','Cash on Delivery','Kochi','Kerala');
INSERT INTO "orders" VALUES(107,44,'2025-08-08','Delivered','UPI','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(108,37,'2025-06-16','Shipped','Cash on Delivery','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(109,20,'2025-07-24','Delivered','Debit Card','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(110,43,'2025-08-20','Cancelled','Cash on Delivery','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(111,59,'2025-06-22','Delivered','Credit Card','Indore','Madhya Pradesh');
INSERT INTO "orders" VALUES(112,74,'2025-07-08','Delivered','Cash on Delivery','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(113,6,'2025-06-21','Cancelled','Cash on Delivery','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(114,50,'2025-09-17','Shipped','Cash on Delivery','Delhi','Delhi');
INSERT INTO "orders" VALUES(115,5,'2025-05-03','Delivered','Debit Card','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(116,13,'2025-07-22','Delivered','Cash on Delivery','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(117,2,'2025-05-07','Delivered','Credit Card','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(118,10,'2025-07-30','Delivered','Net Banking','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(119,89,'2025-07-11','Shipped','Debit Card','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(120,87,'2025-08-15','Delivered','Cash on Delivery','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(121,70,'2025-04-10','Shipped','Credit Card','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(122,81,'2025-09-23','Delivered','UPI','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(123,56,'2025-04-26','Cancelled','UPI','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(124,57,'2025-05-13','Processing','UPI','Pune','Maharashtra');
INSERT INTO "orders" VALUES(125,6,'2025-06-23','Delivered','Debit Card','Pune','Maharashtra');
INSERT INTO "orders" VALUES(126,48,'2025-07-20','Delivered','Net Banking','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(127,53,'2025-08-23','Processing','Credit Card','Kochi','Kerala');
INSERT INTO "orders" VALUES(128,22,'2025-05-15','Delivered','Cash on Delivery','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(129,80,'2025-09-22','Delivered','Net Banking','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(130,19,'2025-05-30','Delivered','Debit Card','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(131,59,'2025-06-05','Processing','Cash on Delivery','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(132,37,'2025-09-21','Delivered','UPI','Delhi','Delhi');
INSERT INTO "orders" VALUES(133,57,'2025-06-28','Shipped','Cash on Delivery','Pune','Maharashtra');
INSERT INTO "orders" VALUES(134,89,'2025-06-04','Delivered','Debit Card','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(135,26,'2025-07-08','Delivered','Credit Card','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(136,49,'2025-08-25','Delivered','Debit Card','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(137,90,'2025-06-15','Delivered','Cash on Delivery','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(138,36,'2025-04-03','Shipped','UPI','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(139,78,'2025-08-06','Delivered','Credit Card','Kochi','Kerala');
INSERT INTO "orders" VALUES(140,78,'2025-06-30','Delivered','Credit Card','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(141,80,'2025-06-04','Processing','Credit Card','Kochi','Kerala');
INSERT INTO "orders" VALUES(142,81,'2025-04-25','Shipped','UPI','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(143,40,'2025-07-22','Delivered','Debit Card','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(144,94,'2025-05-04','Delivered','Debit Card','Chandigarh','Chandigarh');
INSERT INTO "orders" VALUES(145,42,'2025-07-16','Delivered','Credit Card','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(146,70,'2025-07-03','Delivered','Debit Card','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(147,22,'2025-06-05','Delivered','Debit Card','Kochi','Kerala');
INSERT INTO "orders" VALUES(148,96,'2025-06-26','Delivered','UPI','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(149,19,'2025-05-28','Processing','Cash on Delivery','Indore','Madhya Pradesh');
INSERT INTO "orders" VALUES(150,72,'2025-07-03','Delivered','Cash on Delivery','Kochi','Kerala');
INSERT INTO "orders" VALUES(151,2,'2025-06-07','Delivered','Cash on Delivery','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(152,48,'2025-09-20','Cancelled','Debit Card','Lucknow','Uttar Pradesh');
INSERT INTO "orders" VALUES(153,75,'2025-07-07','Shipped','UPI','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(154,87,'2025-05-30','Delivered','Net Banking','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(155,72,'2025-06-23','Shipped','UPI','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(156,82,'2025-07-28','Processing','Cash on Delivery','Pune','Maharashtra');
INSERT INTO "orders" VALUES(157,15,'2025-05-06','Delivered','Debit Card','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(158,64,'2025-04-30','Delivered','Net Banking','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(159,18,'2025-07-09','Delivered','Net Banking','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(160,54,'2025-08-29','Cancelled','Credit Card','Indore','Madhya Pradesh');
INSERT INTO "orders" VALUES(161,54,'2025-09-15','Delivered','Cash on Delivery','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(162,79,'2025-07-14','Delivered','Debit Card','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(163,28,'2025-07-23','Delivered','Debit Card','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(164,13,'2025-09-23','Delivered','Debit Card','Kolkata','West Bengal');
INSERT INTO "orders" VALUES(165,8,'2025-07-11','Delivered','UPI','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(166,59,'2025-04-24','Processing','Net Banking','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(167,3,'2025-04-13','Delivered','Credit Card','Mumbai','Maharashtra');
INSERT INTO "orders" VALUES(168,73,'2025-05-23','Delivered','Net Banking','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(169,27,'2025-08-29','Delivered','Credit Card','Bhopal','Madhya Pradesh');
INSERT INTO "orders" VALUES(170,43,'2025-05-08','Shipped','Debit Card','Ajmer','Rajasthan');
INSERT INTO "orders" VALUES(171,19,'2025-05-04','Delivered','Credit Card','Pune','Maharashtra');
INSERT INTO "orders" VALUES(172,15,'2025-09-17','Delivered','UPI','Delhi','Delhi');
INSERT INTO "orders" VALUES(173,46,'2025-05-31','Shipped','UPI','Bengaluru','Karnataka');
INSERT INTO "orders" VALUES(174,23,'2025-06-07','Delivered','Cash on Delivery','Delhi','Delhi');
INSERT INTO "orders" VALUES(175,68,'2025-04-30','Cancelled','Cash on Delivery','Jaipur','Rajasthan');
INSERT INTO "orders" VALUES(176,58,'2025-07-02','Delivered','UPI','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(177,58,'2025-08-07','Delivered','UPI','Ahmedabad','Gujarat');
INSERT INTO "orders" VALUES(178,94,'2025-09-16','Delivered','Cash on Delivery','Pune','Maharashtra');
INSERT INTO "orders" VALUES(179,83,'2025-04-08','Delivered','Cash on Delivery','Chennai','Tamil Nadu');
INSERT INTO "orders" VALUES(180,55,'2025-09-23','Delivered','Cash on Delivery','Chennai','Tamil Nadu');
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    brand TEXT NOT NULL,
    price REAL NOT NULL CHECK(price > 0),
    FOREIGN KEY(category_id) REFERENCES categories(category_id)
);
INSERT INTO "products" VALUES(1,'Wireless Earbuds',1,'boAt',1499.0);
INSERT INTO "products" VALUES(2,'Smartphone 5G',1,'Samsung',18999.0);
INSERT INTO "products" VALUES(3,'Laptop 15-inch',1,'Lenovo',54999.0);
INSERT INTO "products" VALUES(4,'Smart Watch',1,'Noise',2999.0);
INSERT INTO "products" VALUES(5,'Cotton Kurta',2,'FabIndia',1299.0);
INSERT INTO "products" VALUES(6,'Running Shoes',2,'Campus',1899.0);
INSERT INTO "products" VALUES(7,'Denim Jeans',2,'Levis',2499.0);
INSERT INTO "products" VALUES(8,'Mixer Grinder',3,'Bajaj',3299.0);
INSERT INTO "products" VALUES(9,'Pressure Cooker',3,'Prestige',2199.0);
INSERT INTO "products" VALUES(10,'Bedsheet Set',3,'Bombay Dyeing',1599.0);
INSERT INTO "products" VALUES(11,'Face Wash',4,'Himalaya',199.0);
INSERT INTO "products" VALUES(12,'Sunscreen SPF 50',4,'Lakme',549.0);
INSERT INTO "products" VALUES(13,'Python Programming Book',5,'BPB',699.0);
INSERT INTO "products" VALUES(14,'Data Science Handbook',5,'O''Reilly',899.0);
INSERT INTO "products" VALUES(15,'Basmati Rice 5kg',6,'India Gate',649.0);
INSERT INTO "products" VALUES(16,'Masala Pack',6,'Everest',149.0);
INSERT INTO "products" VALUES(17,'Bluetooth Speaker',1,'JBL',3499.0);
INSERT INTO "products" VALUES(18,'Backpack',2,'Wildcraft',1799.0);
INSERT INTO "products" VALUES(19,'Non-Stick Pan',3,'Pigeon',999.0);
INSERT INTO "products" VALUES(20,'Shampoo',4,'Dove',399.0);
CREATE TABLE reviews (
    review_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    rating INTEGER NOT NULL CHECK(rating BETWEEN 1 AND 5),
    review_date TEXT NOT NULL,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);
INSERT INTO "reviews" VALUES(1,60,18,4,'2025-08-06');
INSERT INTO "reviews" VALUES(2,30,8,4,'2025-06-09');
INSERT INTO "reviews" VALUES(3,36,7,5,'2025-05-29');
INSERT INTO "reviews" VALUES(4,5,14,5,'2025-05-05');
INSERT INTO "reviews" VALUES(5,31,7,2,'2025-05-09');
INSERT INTO "reviews" VALUES(6,58,20,5,'2025-05-13');
INSERT INTO "reviews" VALUES(7,32,2,4,'2025-06-29');
INSERT INTO "reviews" VALUES(8,70,7,5,'2025-05-15');
INSERT INTO "reviews" VALUES(9,18,17,5,'2025-06-29');
INSERT INTO "reviews" VALUES(10,94,19,4,'2025-07-22');
INSERT INTO "reviews" VALUES(11,31,10,5,'2025-09-11');
INSERT INTO "reviews" VALUES(12,29,14,4,'2025-05-16');
INSERT INTO "reviews" VALUES(13,72,19,5,'2025-06-14');
INSERT INTO "reviews" VALUES(14,81,14,5,'2025-05-13');
INSERT INTO "reviews" VALUES(15,45,13,5,'2025-07-21');
INSERT INTO "reviews" VALUES(16,90,14,4,'2025-07-16');
INSERT INTO "reviews" VALUES(17,49,6,5,'2025-08-30');
INSERT INTO "reviews" VALUES(18,31,8,4,'2025-06-06');
INSERT INTO "reviews" VALUES(19,60,2,5,'2025-08-15');
INSERT INTO "reviews" VALUES(20,72,17,3,'2025-07-02');
INSERT INTO "reviews" VALUES(21,33,7,4,'2025-05-21');
INSERT INTO "reviews" VALUES(22,58,12,3,'2025-06-18');
INSERT INTO "reviews" VALUES(23,7,9,4,'2025-05-11');
INSERT INTO "reviews" VALUES(24,10,7,5,'2025-09-28');
INSERT INTO "reviews" VALUES(25,93,18,4,'2025-06-23');
INSERT INTO "reviews" VALUES(26,43,10,5,'2025-05-04');
INSERT INTO "reviews" VALUES(27,28,7,5,'2025-05-31');
INSERT INTO "reviews" VALUES(28,96,16,5,'2025-06-22');
INSERT INTO "reviews" VALUES(29,51,8,5,'2025-07-12');
INSERT INTO "reviews" VALUES(30,49,15,5,'2025-07-31');
INSERT INTO "reviews" VALUES(31,40,9,4,'2025-09-05');
INSERT INTO "reviews" VALUES(32,60,4,5,'2025-08-29');
INSERT INTO "reviews" VALUES(33,98,11,5,'2025-08-03');
INSERT INTO "reviews" VALUES(34,41,14,2,'2025-06-26');
INSERT INTO "reviews" VALUES(35,95,5,1,'2025-09-19');
INSERT INTO "reviews" VALUES(36,75,19,5,'2025-07-15');
INSERT INTO "reviews" VALUES(37,20,7,4,'2025-08-06');
INSERT INTO "reviews" VALUES(38,73,8,4,'2025-07-26');
INSERT INTO "reviews" VALUES(39,33,16,5,'2025-09-03');
INSERT INTO "reviews" VALUES(40,59,6,5,'2025-07-30');
INSERT INTO "reviews" VALUES(41,22,5,5,'2025-09-03');
INSERT INTO "reviews" VALUES(42,24,18,5,'2025-05-16');
INSERT INTO "reviews" VALUES(43,68,2,5,'2025-05-20');
INSERT INTO "reviews" VALUES(44,86,2,5,'2025-08-14');
INSERT INTO "reviews" VALUES(45,18,8,2,'2025-06-08');
INSERT INTO "reviews" VALUES(46,2,7,5,'2025-08-04');
INSERT INTO "reviews" VALUES(47,8,20,5,'2025-09-01');
INSERT INTO "reviews" VALUES(48,85,16,1,'2025-09-14');
INSERT INTO "reviews" VALUES(49,71,14,1,'2025-09-13');
INSERT INTO "reviews" VALUES(50,93,9,5,'2025-07-13');
INSERT INTO "reviews" VALUES(51,3,17,5,'2025-08-19');
INSERT INTO "reviews" VALUES(52,23,4,5,'2025-09-12');
INSERT INTO "reviews" VALUES(53,20,8,3,'2025-09-12');
INSERT INTO "reviews" VALUES(54,33,12,4,'2025-08-10');
INSERT INTO "reviews" VALUES(55,11,12,5,'2025-08-26');
INSERT INTO "reviews" VALUES(56,73,8,5,'2025-06-27');
INSERT INTO "reviews" VALUES(57,39,3,5,'2025-05-09');
INSERT INTO "reviews" VALUES(58,12,13,4,'2025-09-19');
INSERT INTO "reviews" VALUES(59,61,2,5,'2025-06-13');
INSERT INTO "reviews" VALUES(60,11,16,5,'2025-07-24');
INSERT INTO "reviews" VALUES(61,73,4,5,'2025-05-11');
INSERT INTO "reviews" VALUES(62,30,7,5,'2025-09-23');
INSERT INTO "reviews" VALUES(63,61,9,2,'2025-05-20');
INSERT INTO "reviews" VALUES(64,88,9,5,'2025-09-22');
INSERT INTO "reviews" VALUES(65,85,2,3,'2025-07-20');
INSERT INTO "reviews" VALUES(66,3,7,5,'2025-08-10');
INSERT INTO "reviews" VALUES(67,10,10,3,'2025-07-01');
INSERT INTO "reviews" VALUES(68,73,13,5,'2025-09-16');
INSERT INTO "reviews" VALUES(69,43,13,5,'2025-06-05');
INSERT INTO "reviews" VALUES(70,89,3,5,'2025-07-28');
INSERT INTO "reviews" VALUES(71,7,4,4,'2025-05-20');
INSERT INTO "reviews" VALUES(72,44,20,5,'2025-08-10');
INSERT INTO "reviews" VALUES(73,100,11,1,'2025-07-09');
INSERT INTO "reviews" VALUES(74,58,16,4,'2025-09-19');
INSERT INTO "reviews" VALUES(75,49,14,3,'2025-09-27');
INSERT INTO "reviews" VALUES(76,85,13,3,'2025-07-15');
INSERT INTO "reviews" VALUES(77,32,3,3,'2025-06-09');
INSERT INTO "reviews" VALUES(78,49,5,5,'2025-07-21');
INSERT INTO "reviews" VALUES(79,47,4,3,'2025-07-18');
INSERT INTO "reviews" VALUES(80,57,12,5,'2025-05-27');
INSERT INTO "reviews" VALUES(81,17,3,3,'2025-08-23');
INSERT INTO "reviews" VALUES(82,72,18,5,'2025-05-27');
INSERT INTO "reviews" VALUES(83,4,3,4,'2025-05-24');
INSERT INTO "reviews" VALUES(84,77,20,5,'2025-08-07');
INSERT INTO "reviews" VALUES(85,2,10,4,'2025-05-22');
INSERT INTO "reviews" VALUES(86,93,18,5,'2025-07-02');
INSERT INTO "reviews" VALUES(87,74,17,3,'2025-08-06');
INSERT INTO "reviews" VALUES(88,22,5,4,'2025-07-08');
INSERT INTO "reviews" VALUES(89,64,5,2,'2025-08-20');
INSERT INTO "reviews" VALUES(90,36,14,4,'2025-05-20');
INSERT INTO "reviews" VALUES(91,47,9,5,'2025-09-04');
INSERT INTO "reviews" VALUES(92,77,20,3,'2025-05-28');
INSERT INTO "reviews" VALUES(93,18,10,1,'2025-08-10');
INSERT INTO "reviews" VALUES(94,43,20,4,'2025-07-24');
INSERT INTO "reviews" VALUES(95,57,11,4,'2025-06-04');
INSERT INTO "reviews" VALUES(96,39,11,5,'2025-06-21');
INSERT INTO "reviews" VALUES(97,62,11,3,'2025-08-10');
INSERT INTO "reviews" VALUES(98,41,10,5,'2025-09-03');
INSERT INTO "reviews" VALUES(99,74,8,4,'2025-07-11');
INSERT INTO "reviews" VALUES(100,51,12,3,'2025-09-22');
INSERT INTO "reviews" VALUES(101,26,19,5,'2025-06-16');
INSERT INTO "reviews" VALUES(102,88,18,1,'2025-08-27');
INSERT INTO "reviews" VALUES(103,91,7,4,'2025-07-14');
INSERT INTO "reviews" VALUES(104,89,3,5,'2025-08-13');
INSERT INTO "reviews" VALUES(105,87,16,3,'2025-07-17');
INSERT INTO "reviews" VALUES(106,31,9,5,'2025-08-17');
INSERT INTO "reviews" VALUES(107,49,3,4,'2025-08-31');
INSERT INTO "reviews" VALUES(108,75,13,5,'2025-08-16');
INSERT INTO "reviews" VALUES(109,70,2,5,'2025-08-01');
INSERT INTO "reviews" VALUES(110,90,18,5,'2025-05-22');
INSERT INTO "reviews" VALUES(111,14,8,5,'2025-07-30');
INSERT INTO "reviews" VALUES(112,22,20,2,'2025-08-11');
INSERT INTO "reviews" VALUES(113,97,11,5,'2025-08-19');
INSERT INTO "reviews" VALUES(114,14,1,3,'2025-06-26');
INSERT INTO "reviews" VALUES(115,66,17,5,'2025-09-25');
INSERT INTO "reviews" VALUES(116,29,15,4,'2025-08-27');
INSERT INTO "reviews" VALUES(117,99,19,5,'2025-06-08');
INSERT INTO "reviews" VALUES(118,45,1,4,'2025-07-15');
INSERT INTO "reviews" VALUES(119,54,3,3,'2025-06-06');
INSERT INTO "reviews" VALUES(120,45,10,4,'2025-06-22');
INSERT INTO "reviews" VALUES(121,67,16,4,'2025-05-25');
INSERT INTO "reviews" VALUES(122,57,15,4,'2025-07-16');
INSERT INTO "reviews" VALUES(123,6,4,1,'2025-07-27');
INSERT INTO "reviews" VALUES(124,83,4,5,'2025-06-12');
INSERT INTO "reviews" VALUES(125,95,8,5,'2025-09-19');
INSERT INTO "reviews" VALUES(126,21,11,5,'2025-08-27');
INSERT INTO "reviews" VALUES(127,30,13,5,'2025-06-17');
INSERT INTO "reviews" VALUES(128,82,14,4,'2025-06-20');
INSERT INTO "reviews" VALUES(129,58,19,4,'2025-05-02');
INSERT INTO "reviews" VALUES(130,91,7,4,'2025-05-17');
INSERT INTO "reviews" VALUES(131,74,4,5,'2025-09-15');
INSERT INTO "reviews" VALUES(132,24,12,4,'2025-08-26');
INSERT INTO "reviews" VALUES(133,15,9,5,'2025-09-03');
INSERT INTO "reviews" VALUES(134,68,11,5,'2025-08-09');
INSERT INTO "reviews" VALUES(135,76,4,4,'2025-08-26');
INSERT INTO "reviews" VALUES(136,80,6,5,'2025-07-16');
INSERT INTO "reviews" VALUES(137,79,19,3,'2025-06-04');
INSERT INTO "reviews" VALUES(138,41,4,4,'2025-05-30');
INSERT INTO "reviews" VALUES(139,24,12,5,'2025-09-08');
INSERT INTO "reviews" VALUES(140,50,14,5,'2025-09-25');
INSERT INTO "reviews" VALUES(141,50,14,3,'2025-09-15');
INSERT INTO "reviews" VALUES(142,89,6,5,'2025-09-03');
INSERT INTO "reviews" VALUES(143,37,5,3,'2025-08-24');
INSERT INTO "reviews" VALUES(144,80,2,5,'2025-05-03');
INSERT INTO "reviews" VALUES(145,63,5,3,'2025-08-07');
INSERT INTO "reviews" VALUES(146,72,17,5,'2025-08-13');
INSERT INTO "reviews" VALUES(147,88,16,4,'2025-08-22');
INSERT INTO "reviews" VALUES(148,63,6,3,'2025-05-08');
INSERT INTO "reviews" VALUES(149,98,8,4,'2025-07-10');
INSERT INTO "reviews" VALUES(150,29,18,4,'2025-08-26');
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_reviews_product ON reviews(product_id);
CREATE VIEW v_order_details AS
SELECT
    o.order_id,
    o.order_date,
    o.order_status,
    o.payment_method,
    c.customer_id,
    c.customer_name,
    c.city AS customer_city,
    c.state AS customer_state,
    p.product_id,
    p.product_name,
    cat.category_name,
    p.brand,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct,
    ROUND(oi.quantity * oi.unit_price * (1 - oi.discount_pct / 100.0), 2) AS line_total
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN order_items oi ON oi.order_id = o.order_id
JOIN products p ON p.product_id = oi.product_id
JOIN categories cat ON cat.category_id = p.category_id;
CREATE VIEW v_monthly_sales AS
SELECT
    substr(order_date,1,7) AS sales_month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(line_total),2) AS revenue
FROM v_order_details
WHERE order_status = 'Delivered'
GROUP BY substr(order_date,1,7)
ORDER BY sales_month;
CREATE VIEW v_product_performance AS
SELECT
    product_id,
    product_name,
    category_name,
    brand,
    COUNT(DISTINCT order_id) AS orders_count,
    SUM(quantity) AS units_sold,
    ROUND(SUM(line_total),2) AS revenue
FROM v_order_details
WHERE order_status = 'Delivered'
GROUP BY product_id, product_name, category_name, brand;
CREATE VIEW v_customer_spending AS
SELECT
    customer_id,
    customer_name,
    customer_city,
    customer_state,
    COUNT(DISTINCT order_id) AS delivered_orders,
    ROUND(SUM(line_total),2) AS total_spent
FROM v_order_details
WHERE order_status = 'Delivered'
GROUP BY customer_id, customer_name, customer_city, customer_state;
COMMIT;