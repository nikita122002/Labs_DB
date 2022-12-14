SELECT BRANCHID FROM BRANCH 
WHERE EXISTS (SELECT BRANCHID FROM CAR WHERE BRANCHID = BRANCH.BRANCHID)


INSERT INTO BRANCH (BRANCHID,BRANCHADRESS,BRANCHNAME)
SELECT 7 AS BRANCHID , 'MOSCOW' AS BRANCHADRESS, 'TOPAUTO' AS BRANCHNAME

SELECT COLOR ,
CASE WHEN COLOR ='red'THEN 'red color'
WHEN COLOR ='black' THEN 'black color'
ELSE 'other colors'
	END
FROM CAR;

EXPLAIN SELECT * FROM CAR

EXPLAIN ANALYZE SELECT * FROM CAR
