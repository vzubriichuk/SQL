CREATE TABLE #MyTest (a int, b int, d int, e int)

INSERT INTO #MyTest (a,b,d,e) VALUES(1,2,4,5)

SELECT * FROM #MyTest

ALTER TABLE #MyTest ADD c int
ALTER TABLE #MyTest ADD d_new int
ALTER TABLE #MyTest ADD e_new int

UPDATE #MyTest SET d_new = d, e_new = e

ALTER TABLE #MyTest DROP COLUMN d
ALTER TABLE #MyTest DROP COLUMN e

USE tempdb
GO
EXEC SP_RENAME '#MyTest.d_new', 'd';
EXEC SP_RENAME '#MyTest.e_new', 'e';

SELECT * FROM #MyTest 

DROP TABLE #MyTest