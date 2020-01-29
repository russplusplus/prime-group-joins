-- 1
SELECT "customers".first_name, "customers".last_name, "addresses".street, "addresses".city
FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

-- 2
SELECT "orders".id, "line_items".quantity, "products".description
FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "line_items".product_id = "products".id;

-- 3
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'cheetos';

-- 4
SELECT * FROM "warehouse"
JOIN "warehouse_product" ON "warehouse".id = "warehouse_product".warehouse_id
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi';

-- 5
SELECT "customers".first_name, "customers".last_name, COUNT("orders".id) FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id 
JOIN "orders" ON "addresses".id = "orders".address_id
GROUP BY "customers".first_name, "customers".last_name;

-- 6
SELECT COUNT(DISTINCT "customers".first_name) FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id 
JOIN "orders" ON "addresses".id = "orders".address_id;

-- 7
SELECT COUNT("products".description) FROM "products";

-- 8
SELECT SUM("warehouse_product".on_hand) FROM "warehouse_product"
JOIN "products" ON "warehouse_product".product_id = "products".id
WHERE "products".description = 'diet pepsi';
