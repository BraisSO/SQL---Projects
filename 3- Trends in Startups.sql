SELECT *
FROM startups;

select count(*) from startups;

select sum(valuation) from startups;

select max(raised) from startups;

select max(raised) from startups where stage="Seed";

select min (founded) from startups;

select avg(valuation) from startups;

select valuation from startups group by category;

select round(avg(valuation),2) from startups group by category;

select category, round(avg(valuation),2) from startups group by category order by valuation desc;

SELECT category, COUNT(*)
FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY 2 DESC;

SELECT location, AVG(employees)
FROM startups
GROUP BY location;

SELECT location, AVG(employees)
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;