1. Get all customers and their addresses.
SELECT addresses.street, addresses.city, addresses.state, addresses.zip, addresses.address_type, customers.first_name, customers.last_name
FROM addresses
JOIN customers ON addresses.id = customers.id;

2. Get all orders and their line items (orders, quantity and product).
SELECT line_items.quantity, line_items.product_id, line_items.order_id, orders.id
FROM line_items
JOIN orders ON line_items.id = orders.id;


3. Which warehouses have cheetos? --> answer is delta
SELECT warehouse.warehouse
FROM products
JOIN warehouse_product wp ON products.id = wp.product_id
JOIN warehouse ON warehouse.id = wp.warehouse_id
WHERE products.id = 5;

4. Which warehouses have diet pepsi? --> answer is alpha, delta, and gamma
SELECT warehouse.warehouse
FROM products
JOIN warehouse_product wp ON products.id = wp.product_id
JOIN warehouse ON warehouse.id = wp.warehouse_id
WHERE products.id = 6;


5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT(o.id), first_name
FROM customers
JOIN addresses as a ON customers.id = a.customer_id
JOIN orders as o ON a.id = o.address_id
GROUP BY customers.first_name;

6. How many customers do we have? --> 4 customers
SELECT COUNT(*) FROM customers;

7. How many products do we carry?
SELECT COUNT(*) FROM products; ---> 7

8. What is the total available on-hand quantity of diet pepsi? --> 92
SELECT SUM(wp.on_hand)
FROM products
JOIN warehouse_product wp ON products.id = wp.product_id
JOIN warehouse ON warehouse.id = wp.warehouse_id
WHERE products.id = 6;

