select
sales_person,
sum(subtotal) as sales,
round ((sum(subtotal)/(select sum(subtotal) from charliesorders) * 100),1) as percentages,
round (((sum(subtotal)) * .20),2) as commissions
from charliesorders
group by sales_person 
order by commissions desc;
