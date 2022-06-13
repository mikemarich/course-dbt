How many users do we have?
  130

==============

On average, how many orders do we receive per hour?
  7.52

==============

On average, how long does an order take from being placed to being delivered?
  3 days 21:24:11.803279

==============

How many users have only made one purchase?
  25
Two purchases?
  28
Three+ purchases?
  71

==============

On average, how many unique sessions do we have per hour?
  16.33

==============

with cte1 as (
  select count(order_id) order_count, date_trunc('hour',created_at) as order_hour from orders group by order_hour
)
select avg(order_count) as avg_hourly_orders from cte1

with cte1 as (
  select delivered_at - created_at as delivery_time from orders
)
select avg(delivery_time) as avg_delivery_time from cte1

with cte1 as (
  select count(order_id) as order_count, user_id from orders group by user_id having count(order_id)>2
)
select count(*) as user_count from cte1

with cte1 as (
  select count(distinct session_id) session_count, date_trunc('hour',created_at) as session_hour from events group by session_hour
)
select avg(session_count) as avg_hourly_sessions from cte1
