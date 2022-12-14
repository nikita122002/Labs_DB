SELECT * FROM BRANCH
 INNER JOIN CAR ON BRANCH.BRANCHID = CAR.BRANCHID

SELECT b.branchid,c.brand,E.PERSONALDATAID,D.PERSONNAME
FROM BRANCH AS B
INNER JOIN CAR AS C ON B.BRANCHID = c.carid
INNER JOIN EMPLOYEE AS E ON B.BRANCHID = E.BRANCHID
INNER JOIN PERSONALDATA AS D ON E.PERSONALDATAID = D.PERSONALDATAID

SELECT *
FROM CAR AS C 
RIGHT JOIN BRANCH AS B 
ON C.BRANCHID=B.BRANCHID

SELECT *
FROM CAR AS C 
LEFT JOIN BRANCH AS B 
ON C.BRANCHID=B.BRANCHID

SELECT *
FROM CAR AS C 
FULL JOIN BRANCH AS B 
ON C.BRANCHID=B.BRANCHID

SELECT *
FROM CAR AS C 
FULL JOIN BRANCH AS B 
ON C.BRANCHID=B.BRANCHID
WHERE CARPRICE BETWEEN 100000 AND 500000
ORDER BY COLOR DESC

SELECT *
FROM CAR  CROSS JOIN BRANCH

SELECT C.BRANCHID , CA.CARID FROM CAR  AS C
INNER JOIN CAR AS CA ON C.BRANCHID = CA.CARID 
