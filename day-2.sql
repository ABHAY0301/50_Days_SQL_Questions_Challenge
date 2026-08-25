-- 02/50 Days SQL Questions challenge

/*

Given the Orders table with columns order_id, 
order_date, and total_amount, and the 
Returns table with columns return_id and order_id.

write an SQL query to calculate the total 
numbers of returned orders for each month

*/

-- Creating a Orders Table and Inserting values

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO Orders (order_id, order_date, total_amount) VALUES
(1, '2023-01-15', 150.50),
(2, '2023-02-20', 200.75),
(3, '2023-02-28', 300.25),
(4, '2023-03-10', 180.00),
(5, '2023-04-05', 250.80);

-- Creating a Returns Table and Inserting values

CREATE TABLE Returns (
    return_id INT PRIMARY KEY,
    order_id INT,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

INSERT INTO Returns (return_id, order_id) VALUES
(101, 2),
(102, 4),
(103, 5),
(104, 1),
(105, 3);


-- ------------------------------------
-- My Solution
-- ------------------------------------



SELECT
	EXTRACT(MONTH FROM O.order_date) || '-' || EXTRACT(YEAR FROM O.order_date) AS month,
	COUNT(R.return_id) AS total_return
FROM Returns AS R
LEFT JOIN Orders AS O
ON R.order_id = O.order_id
GROUP BY month
ORDER BY month


