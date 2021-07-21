DECLARE @StartDocDate date;
DECLARE @EndDocDate date;
DECLARE @StartDVDate date;
DECLARE @EndDVDate date;
DECLARE @Dispatch_WH INT;
DECLARE @NullDate date;
DECLARE @FutureDate date;

SET @StartDocDate= [%0];
SET @EndDocDate=[%1];
SET @StartDVDate=[%2];
SET @EndDVDate=[%3];
SET @Dispatch_WH =[%4];
SET @NullDate = '17530101';
SET @FutureDate = '20991231';

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

IF @StartDocDate <> @NullDate AND @EndDocDate = @NullDate  BEGIN SET @EndDocDate = @FutureDate END
IF @StartDVDate <> @NullDate AND @EndDVDate = @NullDate BEGIN  SET @EndDVDate = @FutureDate END

IF @EndDocDate <> @NullDate AND @EndDVDate <> @NullDate
BEGIN
SELECT '' AS "Checkbox"
,T0.[DocEntry]
, T0.DocNum  AS '單號No.'
, T0.CardCode  AS '客戶編號'
, T0.CardName  AS '客戶名' 
, T0.DocDueDate AS '送貨日期'
, T0.DocDate AS '建立日期'
, T0.U_Dispatch_WH AS '分派倉庫'
 FROM ODLN T0
 WHERE T0.DocStatus = 'O' 
  AND T0.U_Dispatch_WH IN (SELECT value FROM @values )
  AND ((T0.DocDate >=  @StartDocDate AND T0.DocDate <=  @EndDocDate)
  AND (T0.DocDueDate >= @StartDVDate AND T0.DocDueDate <= @EndDVDate))
END

ELSE IF @EndDocDate <> @NullDate AND @EndDVDate = @NullDate 
BEGIN
SELECT '' AS "Checkbox"
,T0.[DocEntry]
, T0.DocNum  AS '單號No.'
, T0.CardCode  AS '客戶編號'
, T0.CardName  AS '客戶名' 
, T0.DocDueDate AS '送貨日期'
, T0.DocDate AS '建立日期'
, T0.U_Dispatch_WH AS '分派倉庫'
 FROM ODLN T0
 WHERE T0.DocStatus = 'O' 
  AND T0.U_Dispatch_WH IN (SELECT value FROM @values )
  AND T0.DocDate >=  @StartDocDate 
  AND T0.DocDate <=  @EndDocDate
END

ELSE IF @EndDocDate = @NullDate AND @EndDVDate <> @NullDate 
BEGIN
SELECT '' AS "Checkbox"
,T0.[DocEntry]
, T0.DocNum  AS '單號No.'
, T0.CardCode  AS '客戶編號'
, T0.CardName  AS '客戶名' 
, T0.DocDueDate AS '送貨日期'
, T0.DocDate AS '建立日期'
, T0.U_Dispatch_WH AS '分派倉庫'
 FROM ODLN T0
 WHERE T0.DocStatus = 'O' 
  AND T0.U_Dispatch_WH IN (SELECT value FROM @values )
  AND T0.DocDueDate  >= @StartDVDate 
  AND T0.DocDueDate  <= @EndDVDate

END

ELSE 
BEGIN

SELECT '' AS "Checkbox"
,'請至少輸入一個篩選值，請關閉此報表視窗' AS '提示訊息'

END
