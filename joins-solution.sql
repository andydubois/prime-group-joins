1. Get all customers and their addresses.

SELECT * FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;


2. Get all orders and their line items
(orders, quantity and product).

SELECT "line_items".quantity, "orders".id, "products".description FROM "orders"
JOIN "line_items" ON "line_items".order_id = "orders".id
JOIN "products" ON "line_items".product_id = "products".id;

Which warehouses have cheetos?

SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'cheetos';

Which warehouses have diet pepsi?

SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi';

Get the number of orders for each customer.
NOTE:
It is OK
if those without orders are not included in results.

SELECT "customers".first_name, count("orders") from "customers"
JOIN "addresses" ON "customers".id="addresses".customer_id
JOIN "orders" ON "addresses".id="orders".address_id
GROUP BY "customers".first_name;


How many customers do we have?

SELECT count(*) from "customers"

How many products do we carry?

SELECT count(*) from "products";

What is the total available on-hand quantity of diet pepsi?

SELECT "products".description, sum(on_hand) FROM "products"
JOIN "warehouse_product" ON "products".id = "warehouse_product".product_id
WHERE "products".description = 'diet pepsi'
GROUP BY "products".description;