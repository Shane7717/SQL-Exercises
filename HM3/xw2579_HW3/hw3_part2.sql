select distinct TP1.country as country1, TP2.country as country2
from Tennis_Players TP1, Countries C1, Tennis_Players TP2, Countries C2
where TP1.country = C1.name
and TP2.country = C2.name
and (TP1.country, TP2.country) in
	(with Temp1 as (select country, count(*) as players from tennis_players group by country),
	Temp2 as (select country, count(*) as players from tennis_players group by country)
	select Temp1.country, Temp2.country from Temp1, Temp2 where Temp1.players < Temp2.players)
and C1.GDP < C2.GDP
order by country1, country2;



select distinct YRF.name as player_name, C.name as country, C.GDP as GDP
from Years_Ranked_First YRF, Tennis_Players TP, Countries C
where YRF.name = TP.name
and TP.country = C.name
and YRF.name in 
(select YRF1.name from Years_Ranked_First YRF1, Years_Ranked_First YRF2
where YRF1.name = YRF2.name and YRF1.year = YRF2.year + 1) order by player_name;

drop view Top_Players_Countries;
create view Top_Players_Countries (player, country)
as select distinct YRF.name, TP.country
from Tennis_Players TP, Years_Ranked_First YRF
where TP.name = YRF.name;



select C.name as country, C.GDP as GDP, C.population, TPC.player as top_ranked_player
from Countries C LEFT OUTER JOIN Top_Players_Countries TPC
on C.name = TPC.country
order by country, top_ranked_player;



select distinct TP.country from Tennis_Players TP where TP.name in
(select name from Years_Ranked_First where year % 4 != 0 or year > 2010)
order by TP.country;