--How many entries in the countries table are from Africa?
select * from countries where continent like "Africa";

--What was the total population of the continent of Oceania in 2005?
select sum(pop.population) as "Total population Oceania 2005" from population_years pop join countries c on (pop.country_id=c.id) where pop.year = 2005 and c.continent like "Oceania";

--What is the average population of countries in South America in 2003?
select avg(pop.population) as "AVG South America 2003" from population_years pop join countries c on (pop.country_id=c.id) where c.continent like "South America" and year = 2003; 

--What country had the smallest population in 2007?
select c.name from countries c  join population_years pop on (pop.country_id=c.id) where year=2007 order by pop.population asc limit 1;

--What is the average population of Poland during the time period covered by this dataset?
select sum(pop.population)/count(c.id) from countries c join population_years pop on (c.id=pop.country_id) where c.name like "Poland";

-- How many countries have the word “The” in their name? --
select count(distinct c.name) from countries c join population_years pop on (c.id=pop.country_id) where c.name like "%The%";

-- What was the total population of each continent in 2010?--
select distinct c.continent, sum(pop.population) from countries c join  population_years pop on (c.id=pop.country_id) where pop.year=2010 group by c.continent;
