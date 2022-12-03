SELECT * FROM car
SELECT brand, color FROM car

SELECT * FROM car
WHERE brand = 'audi';

SELECT * FROM car
WHERE brand = 'audi' and carprice is NOT NULL;

UPDATE Car
SET carprice = carprice + 3000;

UPDATE Car
SET carprice = carprice + 3000
WHERE CARID=1

DELETE FROM Car
WHERE brand='Lada';

SELECT DISTINCT brand FROM car;

SELECT * FROM Products
ORDER BY ProductCount;

SELECT * FROM car
ORDER BY carprice;

SELECT * FROM car
ORDER BY carprice DESC/ASC;

SELECT * FROM car
ORDER BY carprice,brand;

SELECT * FROM Car
ORDER BY carprice
LIMIT 1;

SELECT * FROM Car
ORDER BY carprice
LIMIT 1 OFFSET 1;

SELECT * FROM CAR
WHERE brand LIKE 'a%';

SELECT SUM(carprice) FROM car;