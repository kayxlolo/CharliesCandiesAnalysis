with 
totals as (
	select 
	sum(carm3pc) as carm3pc,
	sum(carm8pc) as carm8pc,
	sum(carm16pc) as carm16pc,
	sum(toff3pc) as toff3pc,
	sum(toff8pc) as toff8pc,
	sum(toff16pc) as toff16pc,
	sum(fudg3pc) as fudg3pc,
	sum(fudg8pc) as fudg8pc,
	sum(fudg16pc) as fudg16pc,
	sum(combo3pc) as combo3pc,
	sum(combo8pc) as combo8pc,
	sum(combo16pc) as combo16pc
	from charliesorders),

lists as (
	select 
	p.item,
		case
			when p.item = 'carm3pc' then totals.carm3pc
			when p.item = 'carm8pc' then totals.carm8pc
			when p.item = 'carm16pc' then totals.carm16pc
			when p.item = 'toff3pc' then totals.toff3pc
			when p.item = 'toff8pc' then totals.toff8pc
			when p.item = 'toff16pc' then totals.toff16pc
			when p.item = 'fudg3pc' then totals.fudg3pc
			when p.item = 'fudg8pc' then totals.fudg8pc
			when p.item = 'fudg16pc' then totals.fudg16pc
			when p.item = 'combo3pc' then totals.combo3pc
			when p.item = 'combo8pc' then totals.combo8pc
			when p.item = 'combo16pc' then totals.combo16pc
			else ''
		end as product_totals
		from charliesproducts p, totals)

select 
item,
cast(lists.product_totals as signed) as prod_totals
from lists
order by prod_totals desc
limit 5



-- round(sum(subtotal),2) as totalsales,
-- count(order_Number) as totalorders,


