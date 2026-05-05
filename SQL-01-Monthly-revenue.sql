SELECT date_format(order_date,'%y-%m')as order_month
      sum(amount) as Revenue 
FROM orders
GROUP BY order_month
ORDER BY Revenue DESC;
