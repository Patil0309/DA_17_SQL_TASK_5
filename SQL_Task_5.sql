select * from sales

select * from customer

select * from products
--View_1
create view logistics as select s.order_id,s.sales ,c.customer_name,c.age,c.country,c.state,c.city from sales as s
left join customer as c
on s.cust_id=c.cust_id

select * from logistics

select sum(s.sales)as sum_of_sale,customer_name,country from sales as s
inner join customer as c
on s.cust_id=c.cust_id
group by c.customer_name,c.country

update logistics set age =62 where customer_name='Claire Gute'

insert into logistics (order_id,sales,customer_name,age,country,state,	city)
values(1001, 2999.50, 'Amit Sharma', 32, 'India', 'Maharashtra', 'Mumbai'
);
--View_2
create view customer_40_60 as 
select cust_id,customer_name,segment,age,country,city,state,region 
from customer 
where age >40 and age<60 

select * from customer_40_60

INSERT INTO customer_40_60 (  cust_id, customer_name, segment, age, country, city, state, region)
 VALUES ( 'PK-65412', 'Krashna patil', 'Home Office', 29, 'India', 'Nagpur', 'Maharashtra', 'North')

select customer_name from customer_40_60 where cust_id='PK-65412'

delete from customer_40_60 where city='Concord'

--View_3

CREATE VIEW daily_sales AS
SELECT order_date, COUNT(order_id) AS total_orders, SUM(sales) AS total_sales
FROM sales
GROUP BY order_date
ORDER BY order_date;

select * from daily_sales

delete from daily_sales where order_date='2014-01-03'

--View_4
CREATE VIEW customer_summary AS
SELECT c.cust_id, c.customer_name, COUNT(s.order_id) AS total_orders,
SUM(s.sales) AS total_spent
FROM customer as c  
INNER JOIN Sales as s ON c.cust_id = s.cust_id
GROUP BY c.cust_id, c.customer_name;

select * from customer_summary


--View_5
create view categorywise_sale  as select p.category,p.product_name,sum(s.sales) from products as p
left join sales as s
on s.product_id=p.product_id
group by p.category,p.product_name

select * from categorywise_sale





