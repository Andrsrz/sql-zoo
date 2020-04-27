--How many stops are in the database.
SELECT COUNT(*)
FROM stops;

--Find the id value for the stop 'Craiglockhart'
SELECT id
FROM stops
WHERE name = 'Craiglockhart';

--Give the id and the name for the stops on the '4' 'LRT' service.
SELECT stops.id, stops.name
FROM route LEFT JOIN stops
ON (route.stop = stops.id)
WHERE route.num = '4' AND route.company = 'LRT';

--The query shown gives the number of routes that visit either
--London Road (149) or Craiglockhart (53). Run the query and notice
--the two services that link these stops have a count of 2.
--Add a HAVING clause to restrict the output to these two routes.
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2;

--Execute the self join shown and observe that b.stop gives
--all the places you can get to from Craiglockhart, without
--changing routes. Change the query so that it shows the services
--from Craiglockhart to London Road.
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop = 149;

--Change the query so that the services between 'Craiglockhart' and 'London Road' are shown.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road';

--Give a list of all the services which connect stops 115 and 137
SELECT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop = 115 AND b.stop = 137
GROUP BY a.company, a.num;

--Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='Tollcross';
