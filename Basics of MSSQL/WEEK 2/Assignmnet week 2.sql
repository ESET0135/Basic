use joins;
select * from books;

-- Assignment 1 (Top N Books per User)
SELECT *
FROM (
    SELECT
        u.user_id,u.name,b.title,b.price,
        ROW_NUMBER() OVER (PARTITION BY u.user_id ORDER BY b.price DESC) AS RowNum,
        RANK() OVER (PARTITION BY u.user_id ORDER BY b.price DESC) AS RankNum,
        DENSE_RANK() OVER (PARTITION BY u.user_id ORDER BY b.price DESC) AS DenseRankNum
    FROM orders o
    INNER JOIN users u ON o.user_id = u.user_id
    INNER JOIN books b ON o.product_id = b.product_id
) ranked
WHERE ranked.RowNum <= 2
ORDER BY user_id, price DESC;

-- Assignment 2 (Ranking Users by Total Spending)
SELECT
    u.user_id,
    u.name, SUM(b.price) AS Total_Spending,
    RANK() OVER (ORDER BY SUM(b.price) DESC) AS RankNum,
    DENSE_RANK() OVER (ORDER BY SUM(b.price) DESC) AS DenseRankNum
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id
INNER JOIN books b ON o.product_id = b.product_id
GROUP BY u.user_id, u.name
ORDER BY Total_Spending DESC;
