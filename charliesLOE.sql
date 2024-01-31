-- unit total break outs and time needed to produce units

with carameltotals as 
    (select 
    'caramel' as categories,
    (sum(carm3pc) * 3)+ 
    (sum(carm8pc) * 8) +
    (sum(carm16pc) * 16)+
    (sum(combo3pc))+
    (sum(combo8pc) * 4)+
    (sum(combo16pc) * 8) as totals
    from charliesorderdetails),
    
     toffeetotals as
    (select 
    'toffee' as categories,
    (sum(toff3pc) * 3) +
    (sum(toff8pc) * 8) + 
    (sum(toff16pc) * 16) +
    (sum(combo3pc)) +
    (sum(combo8pc) * 2) +
    (sum(combo16pc) * 4) as totals
    from charliesorderdetails),
    
    fudgetotals as
    (select
    'fudge' as categories,
    (sum(fudg3pc) * 3) +
    (sum(fudg8pc) * 8) +
    (sum(fudg16pc) * 16) +
    (sum(combo3pc)) +
    (sum(combo8pc) * 2) +
    (sum(combo16pc) * 4) as totals
    from charliesorderdetails)
    
select categories, totals, round(((totals/2.4)/60), 2) as loe_in_hours from carameltotals 
union 
select categories, totals, round(((totals/2)/60), 2) as loe_in_hours from toffeetotals
union
select categories, totals, round(((totals/2.7)/60), 2) as loe_in_hours from fudgetotals

-- units produced per minute * 60 minutes to result in hourly output
    -- caramel: 2.4 units per minute
    -- toffee: 2.0 units per minute
    -- fudge: 2.7 units per minute
    