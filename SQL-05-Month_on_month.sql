with base as(
  select date_format(order_date, '%Y-%m') as Month,
        sum(amount) as Tot_revenue
  from orders
  GROUP BY date_format(order_date, '%Y-%m')),

Previous_value as(
  SELECT * , Lag(Tot_revenue) over(ORDER BY Month) as Previous_figure
  FROM base
  )

SELECT *, (Tot_revenue-Previous_figure)*100.0/Previous_figure AS MoM%
FROM Previous_value;
