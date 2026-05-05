SELECT c.city, sum(o.amount) as Tot_revenue,
 sum(o.amount)*100.0/sum(sum(o.amount)) over() as %_Contribution
FROM orders o
JOIN customers c
ON o.customer_id=c.customer_id
GROUP BY c.city
ORDER BY Tot_revenue DESC;
