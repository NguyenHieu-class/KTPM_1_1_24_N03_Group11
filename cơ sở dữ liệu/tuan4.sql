use classicmodels;

SELECT * 
FROM customers 
WHERE city IN ('Nantes', 'Lyon');

SELECT * 
FROM orders 
WHERE shippedDate BETWEEN '2003-01-10' AND '2003-03-10';

SELECT * 
FROM productlines 
WHERE productLine LIKE '%CARS%';

SELECT * 
FROM products 
ORDER BY quantityInStock DESC 
LIMIT 10;

SELECT productCode, productName, buyPrice, quantityInStock, 
       (buyPrice * quantityInStock) AS inventoryValue 
FROM products;
