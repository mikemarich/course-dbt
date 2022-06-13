How many users do we have?
select count(*) from users
  130

==============

On average, how many orders do we receive per hour?
with cte1 as (
  select count(order_id) order_count, date_trunc('hour',created_at) as order_hour from orders group by order_hour
)
select avg(order_count) as avg_hourly_orders from cte1
  7.52

==============

On average, how long does an order take from being placed to being delivered?
with cte1 as (
  select delivered_at - created_at as delivery_time from orders
)
select avg(delivery_time) as avg_delivery_time from cte1
  3 days 21:24:11.803279

==============

How many users have only made one purchase?
with cte1 as (
  select count(order_id) as order_count, user_id from orders group by user_id having count(order_id)=1
)
select count(*) as user_count from cte1
  25

Two purchases?
with cte1 as (
  select count(order_id) as order_count, user_id from orders group by user_id having count(order_id)=2
)
select count(*) as user_count from cte1
  28

Three+ purchases?
with cte1 as (
  select count(order_id) as order_count, user_id from orders group by user_id having count(order_id)>2
)
select count(*) as user_count from cte1
  71

==============

On average, how many unique sessions do we have per hour?
with cte1 as (
  select count(distinct session_id) session_count, date_trunc('hour',created_at) as session_hour from events group by session_hour
)
select avg(session_count) as avg_hourly_sessions from cte1
  16.33
