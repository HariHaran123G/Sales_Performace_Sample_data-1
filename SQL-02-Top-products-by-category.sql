with base as(
  select p.category, p.product_id,p.product_name, sum(oi.amount) as Total_revenue
  FROM products p
  JOIN order_items oi
  ON oi.product_id=p.product_id
  GROUP BY p.category,p.product_id,p.product_name
  ),
Ranked as(
  SELECT *, rank() over(PARTITION BY category order by Total_revenue DESC) AS rnk
  from base
)
Select * from Ranked 
where rnk=1;
