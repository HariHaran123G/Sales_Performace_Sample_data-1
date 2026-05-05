WITH customer_revenue AS(
  SELECT o.customer_id, c.name, SUM(o.amount) as Total_revenue
  FROM orders o
  JOIN customers c
  ON c.customer_id = o.customer_id
  GROUP BY o.customer_id, c.name
  ),
SELECT * FROM ( 
  SELECT *, ROW_NUMBER() OVER(ORDER BY Total_revenue DESC) AS Rn
  FROM customer_revenue)t
where Rn<=5;
  
