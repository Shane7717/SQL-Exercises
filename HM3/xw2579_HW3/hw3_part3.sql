select distinct D.dish
from Dishes D, Foods F
where D.food = F.food
and F.category != 'fruit'
and F.category in ('meat', 'seafood')
order by D.dish;


select food
from Dishes
where units >= 3
group by food
having count(*) >= 2
order by food;


select D.dish, F.category, sum(D.units * F.calories_per_unit) as calories
from Dishes D, Foods F
where D.food = F.food
group by D.dish, F.category
order by dish, category;


select D.dish, sum(D.units * F.calories_per_unit) as total_calories
from Dishes D, Foods F
where D.food = F.food
group by D.dish
having count(*) <= 3 and sum(D.units * F.calories_per_unit) >= 1000
order by dish;