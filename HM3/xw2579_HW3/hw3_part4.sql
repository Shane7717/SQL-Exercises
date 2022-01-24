select distinct R.cname from Recipes R 
where R.iname = 'ice' or R.cname in
(select cname from Recipes group by cname having sum(units) < 4)
order by R.cname;


select R.cname, cast(sum(R.units * I.unit_cost) / sum(R.units) as decimal(10, 1)) as avg_cost
from Recipes R, Ingredients I
where R.iname = I.iname
group by R.cname 
having sum(R.units * I.unit_cost) / sum(R.units) < 3.5
order by cname;


select R.cname, (C.price - sum(R.units * I.unit_cost)) as profit 
from Recipes R, Cocktails C, Ingredients I
where R.cname = C.cname
and I.iname = R.iname
group by R.cname, C.price
having count(*) <= 2
order by cname;


drop view Cocktails_Alcohol;
create view Cocktails_Alcohol (cname, alcohol) as
select R.cname, sum(R.units * I.abv) / sum(units) as alcohol
from Recipes R, Ingredients I
where R.iname = I.iname
group by R.cname;

select CA1.cname as cname1, CA2.cname as cname2
from Cocktails_Alcohol CA1, Cocktails_Alcohol CA2
where CA1.alcohol > CA2.alcohol
order by cname1, cname2;