---Phase 1
---Query 1
SELECT DISTINCT name from pizza_types;
---Query 2
SELECT pizza_type_id, name, COALESCE(ingredients, 'Missing Data') AS ingredients
FROM 
    pizza_types
LIMIT 5;
---Query 3 
SELECT * from pizzas limit  5;
---Query 4
Select 8 from pizzas where price IS NULL;

---Phase 2
---Query 1
SELECT * FROM orders WHERE date = '2015-01-01';
---Query 2
SELECT * FROM pizzas ORDER BY price DESC;
---Query 3
SELECT * FROM pizzas WHERE size IN ('L', 'XL');
---Query 4
SELECT * FROM pizzas WHERE price BETWEEN 15.00 AND 17.00;
---Query 5
SELECT * FROM pizza_types WHERE name LIKE '%Chicken%';

---Phase 3
---Query 1
SELECT SUM(quantity) AS total_pizzas_sold FROM order_details;
---Query 2
SELECT AVG(price) AS average_pizza_price FROM pizzas;
---Query 3
SELECT 
    o.order_id,
    SUM(od.quantity * p.price) AS total_order_value
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.order_id;
---Query 4
SELECT 
    pt.category,
    SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;
---Query 5
SELECT 
    pt.category,
    SUM(od.quantity) AS total_quantity_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
HAVING SUM(od.quantity) > 5000;
---Query 6
SELECT 
    p.pizza_id, 
    pt.name AS pizza_name
FROM pizzas p
LEFT JOIN order_details od ON p.pizza_id = od.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
WHERE od.pizza_id IS NULL;
---Query 7
SELECT 
    pt.name AS pizza_name,
    pz.size AS size1,
    pz.price AS price1,
    pi.size AS size2,
    pi.price AS price2,
    (pi.price - pz.price) AS price_difference
FROM pizzas pz
JOIN pizzas pi 
    ON pz.pizza_type_id = pi.pizza_type_id
   AND pz.size <> pi.size
JOIN pizza_types pt ON pz.pizza_type_id = pt.pizza_type_id
WHERE (pi.price - pz.price) > 0;

