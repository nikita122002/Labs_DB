SELECT RELEASEYEAR ,COUNT(*) FROM CAR
GROUP BY RELEASEYEAR

SELECT RELEASEYEAR, CARPRICE ,COUNT(*) FROM CAR
WHERE CARPRICE >100000
GROUP BY RELEASEYEAR,CARPRICE


SELECT RELEASEYEAR, CARPRICE ,COUNT(*) FROM CAR
GROUP BY RELEASEYEAR,CARPRICE
HAVING CARPRICE >100000

SELECT BRANCHID FROM CAR
UNION SELECT BRANCHID FROM PURCHASEORDER