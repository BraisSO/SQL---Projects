SELECT *
FROM nomnom;

select distinct neighborhood from nomnom;

select distinct cuisine from nomnom;

select * from nomnom where cuisine = "Chinese";

select * from nomnom where review>4;

select * from nomnom where cuisine="Italian" and price="$$$";

select * from nomnom where name like "%meatball%";

select * from nomnom where neighborhood = "Midtown" or neighborhood = "Downtown" or neighborhood = "Chinatown";

select * from nomnom where health is null;

select * from nomnom order by review desc limit 10;

select *,
case
when  review > 4.5 then "Extraordinary"
when  review > 4 then "Excellent"
when  review > 3 then "Good"
when  review > 2 then "Fair"
else "Poor"
end as "Review"
from nomnom;
