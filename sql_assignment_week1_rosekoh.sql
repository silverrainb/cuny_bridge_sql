<<<<<<< Local Changes
/*
Assignment: SQL Select and Aggregations
Please use the tables in the flights database. Your deliverable should include the SQL queries that you write in support of your conclusions.
*/


-- 1. Which destination in the flights database is the furthest distance away, based on information in the flights table. Show the SQL query(s) that support your conclusion.
SELECT 
dest, distance
FROM flights 
GROUP BY 1,2
ORDER BY 2 DESC ;

-- 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have the most number of seats? Show the SQL statement(s) that support your result.
-- > 6 engines
SELECT 
COUNT(DISTINCT(engine))
FROM planes;

SELECT 
engines
, max(seats)
FROM planes
GROUP BY 1;

-- 3. Show the total number of flights.
SELECT COUNT(*) FROM flights;

-- 4. Show the total number of flights by airline (carrier).
SELECT DISTINCT(COUNT(carrier)) FROM airlines;

-- 5. Show all of the airlines, ordered by number of flights in descending order.
SELECT
name as airlines
, count(*) as number_of_flights
FROM flights f
JOIN airlines a ON a.carrier = f.carrier
GROUP BY 1
ORDER BY 2 DESC;

-- 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
SELECT
name as airlines
, count(*) as number_of_flights
FROM flights f
JOIN airlines a ON a.carrier = f.carrier
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of flights in descending order.
SELECT
name as airlines
, count(*) as number_of_flights
FROM flights f
JOIN airlines a ON a.carrier = f.carrier
WHERE f.distance >= 1000
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and write down both the question, and the query that answers the question.=======
-- Q: Show the number of carrier type per destination in december, where the distance was beyond 2000 miles and had no departure delay.

SELECT dest, count(distinct(carrier)) 
FROM flights 
WHERE month = 12 
AND distance > 2000 
AND dep_delay = 0
GROUP BY 1
ORDER BY 2 DESC;
