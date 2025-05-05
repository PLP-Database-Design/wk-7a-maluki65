
-- Question 1: On achieving 1NF

WITH ProductDetail AS (
    SELECT 101 AS OrderID, 'John Doe' AS CustomerName, 'Laptop, Mouse' AS Products
    UNION ALL
    SELECT 102, 'Jane Smith', 'Tablet, Keyboard, Mouse'
    UNION ALL
    SELECT 103, 'Emily Clark', 'Phone'
),
SplitProducts AS (
    SELECT
        OrderID,
        CustomerName,
        TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Products, ',', numbers.n), ',', -1)) AS Product
    FROM
        ProductDetail
    JOIN (
        SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4
    ) numbers
    ON CHAR_LENGTH(Products) - CHAR_LENGTH(REPLACE(Products, ',', '')) >= numbers.n - 1
)
SELECT * FROM SplitProducts;

-- Question 2: On achieving 2NF 
SELECT DISTINCT
    OrderID,
    CustomerName
FROM
    OrderDetails;

SELECT
    OrderID,
    Product,
    Quantity
FROM
    OrderDetails;
