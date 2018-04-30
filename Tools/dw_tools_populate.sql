/*
1.0 Populate Tally
*/
DECLARE @id INT = 1

WHILE @id <= 1000000
BEGIN
INSERT INTO dw_tools.tools.tally
(
N
)
SELECT @id 
SET @id+=1
END

/*
2.0 Populate TallyDate
*/
DECLARE @dt DATE = '01-01-0001'

WHILE @dt < '9999-12-31'
BEGIN
INSERT INTO dw_tools.tools.tallydate
(
dt
)
SELECT @dt
SET @dt = DATEADD(DAY,1,@dt)
END