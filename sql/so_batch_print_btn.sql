DECLARE @StartDocDate date;
DECLARE @EndDocDate date;
DECLARE @StartItemDate date;
DECLARE @EndItemDate date;
DECLARE @Dispatch_WH INT;
DECLARE @NullDate date;
DECLARE @FutureDate date;

SET @StartDocDate= [%0];
SET @EndDocDate=[%1];
SET @StartItemDate=[%2];
SET @EndItemDate=[%3];
SET @Dispatch_WH =[%4];

DECLARE @values TABLE
(
    Value varchar(1000)
)
IF @Dispatch_WH <> '1' AND @Dispatch_WH <> '2'
BEGIN
    INSERT INTO @values VALUES('1')
    INSERT INTO @values VALUES('2')
    INSERT INTO @values VALUES('0')
END
ELSE
BEGIN
    INSERT INTO @values VALUES(@Dispatch_WH)
END

SET @NullDate = '17530101';
SET @FutureDate = '20991231';

IF @StartDocDate <> @NullDate AND @EndDocDate = @NullDate  BEGIN SET @EndDocDate = @FutureDate END
IF @StartItemDate <> @NullDate AND @EndItemDate = @NullDate BEGIN  SET @EndItemDate = @FutureDate END

IF @EndDocDate <> @NullDate AND @EndItemDate <> @NullDate
BEGIN
SELECT DISTINCT *
FROM(
        SELECT '' AS "Checkbox",
             T0.DocEntry AS DocEntryC1,
             T0.DocNum,
             T0.CardName,
             T0.DocDate,
             T0.U_Dispatch_WH,
             R1.U_item_ldeli
 FROM ORDR T0 
 LEFT JOIN RDR1 R1 ON T0.DocEntry = R1.DocEntry  
 
 WHERE T0.DocStatus = 'O' AND T0.U_Dispatch_WH IN (SELECT value FROM @values )

  AND ((T0.DocDate >=  @StartDocDate 
  AND T0.DocDate <=  @EndDocDate)
  AND (R1.U_item_ldeli >= @StartItemDate 
  AND R1.U_item_ldeli <= @EndItemDate))
) T99
END
IF @EndDocDate <> @NullDate AND @EndItemDate = @NullDate 
BEGIN
SELECT DISTINCT *
FROM(
        SELECT '' AS "Checkbox",
             T0.DocEntry AS DocEntryC2,
             T0.DocNum,
             T0.CardName,
             T0.DocDate,
T0.U_Dispatch_WH
 FROM ORDR T0  
 WHERE T0.DocStatus = 'O' AND T0.U_Dispatch_WH IN (SELECT value FROM @values ) 
  AND T0.DocDate >=  @StartDocDate 
  AND T0.DocDate <=  @EndDocDate
) T99
END
IF @EndDocDate = @NullDate AND @EndItemDate <> @NullDate 
BEGIN
SELECT DISTINCT *
FROM(
        SELECT '' AS "Checkbox",
             T0.DocEntry AS DocEntryC3,
             T0.DocNum,
             T0.CardName,
             T0.DocDate,
             R1.U_item_ldeli,
T0.U_Dispatch_WH
 FROM ORDR T0  
  LEFT JOIN RDR1 R1 ON T0.DocEntry = R1.DocEntry  
 WHERE T0.DocStatus = 'O' AND T0.U_Dispatch_WH IN (SELECT value FROM @values )
  AND R1.U_item_ldeli >= @StartItemDate 
  AND R1.U_item_ldeli <= @EndItemDate
) T99
END
