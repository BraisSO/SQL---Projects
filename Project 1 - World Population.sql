-- This is the first query:

SELECT DISTINCT year from population_years;

-- Add your additional queries below:

--What is the largest population size for Gabon in this dataset?
select max(population) from population_years where country like "Gabon";

-- What were the 10 lowest population countries in 2005?
select distinct country from population_years order by population asc limit 10;

--What are all the distinct countries with a population of over 100 million in the year 2010?

select distinct country from population_years  where population>100 and year=2010 order by population desc;

--How many countries in this dataset have the word “Islands” in their name?
select distinct country from population_years where country like "%Islands%";

--What is the difference in population between 2000 and 2010 in Indonesia?
select
(select population as "Poblacion" from population_years where country like "Indonesia" and year="2010") - (select population as "pop2000" from population_years where country like "Indonesia" and year="2000") as "Poblacion comparada";


