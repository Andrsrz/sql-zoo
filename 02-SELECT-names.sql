SELECT name FROM world
  WHERE name LIKE 'Y%';

SELECT name FROM world
  WHERE name LIKE '%y';

SELECT name FROM world
  WHERE name LIKE '%x%';

SELECT name FROM world
  WHERE name LIKE '%land';

SELECT name FROM world
  WHERE name LIKE 'C%ia';

SELECT name FROM world
  WHERE name LIKE '%oo%';

SELECT name FROM world
  WHERE name LIKE '%A%a%a%';

SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name;

SELECT name FROM world
 WHERE name LIKE '%o__o%';

SELECT name FROM world
 WHERE name LIKE '____';

SELECT name
  FROM world
 WHERE capital LIKE name;

SELECT name
  FROM world
 WHERE capital LIKE '%City';

SELECT capital, name
FROM world
WHERE capital LIKE CONCAT('%', name, '%');

SELECT capital, name
FROM world
WHERE capital LIKE CONCAT(name, '%') AND LENGTH(capital) > LENGTH(name);

SELECT name, REPLACE(capital, name,'')
FROM world
WHERE capital LIKE CONCAT(name, '%') AND LENGTH(capital) > LENGTH(name);
