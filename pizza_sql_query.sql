select * from pizza_sales

-- KPI'S

select sum(total_price) as total_reveneue from pizza_sales

select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales

select sum(quantity) as total_pizza_sold from pizza_sales

select count(distinct order_id) as total_orders from pizza_sales

select cast (cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as average_pizza_per_order from pizza_sales

-- CHART_DATA

select DATENAME(DW,order_date) as order_day, count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(DW,order_date) 

select DATENAME(month,order_date) as order_month, count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(MONTH,order_date)
order by total_orders

select pizza_category ,sum (total_price) as total_sales, sum (total_price)*100/(select sum(total_price) from pizza_sales ) as total_sales_percentage from pizza_sales
group by pizza_category

select pizza_category ,sum (total_price) as total_sales, sum (total_price)*100/(select sum(total_price) from pizza_sales where month(order_date)=1 ) as total_sales_percentage from pizza_sales
where month(order_date)=1
group by pizza_category   --january ke liy filter externa + subqyery m dono jagah filter lagenge

select pizza_size ,sum (total_price) as total_sales, cast( sum (total_price)*100/(select sum(total_price) from pizza_sales) as decimal(10,2))  as total_sales_percentage from pizza_sales
group by pizza_size
order by total_sales_percentage desc --order by me alias column name a skta h pr group by m alias name use nh kr skte

select pizza_size ,sum (total_price) as total_sales, cast( sum (total_price)*100/(select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as decimal(10,2))  as total_sales_percentage from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_size
order by total_sales_percentage desc -- first quarter ka show hoga isme

select top 5 pizza_name, sum(total_price) as total_reveneue from pizza_sales
group by pizza_name
order by total_reveneue desc

select top 5 pizza_name, sum(total_price) as total_reveneue from pizza_sales
group by pizza_name
order by total_reveneue asc

select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity desc

select top 5 pizza_name, sum(quantity) as total_quantity from pizza_sales
group by pizza_name
order by total_quantity asc

select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders desc

select top 5 pizza_name, count(distinct order_id) as total_orders from pizza_sales
group by pizza_name
order by total_orders asc
