-- set order U_DISPATCH_WH according to BP's address State
-- 1:北倉, 2:中倉 otherwise 0
-- 
with T3 AS (
    SELECT 
        T0.[DocNum] as [DocNum]
        ,T0.[U_DISPATCH_WH] as[U_DISPATCH_WH]
        ,T0.[ShipToCode] as [ShipToCode]
        ,T1.[Address] as [Address]
        ,T1.[State] as [State]
        ,T2.Code as Code
        ,T2.U_WH as U_WH
        ,T2.Name as Name
    FROM ORDR T0 
        LEFT JOIN CRD1 T1 ON T0.[ShipToCode] = T1.[Address]
        LEFT JOIN [dbo].[@MRL_DISPATCH_WH] T2 ON T1.State = T2.Code
    WHERE 
        T0.[U_DISPATCH_WH] = 0 
)
UPDATE ORDR 
SET ORDR.[U_DISPATCH_WH] =     
    (CASE  
        WHEN [DocNum] in (
            SELECT [DocNum]
            FROM T3
            WHERE T3.U_WH = '北倉'                
        ) THEN 1
        WHEN [DocNum] in (
            SELECT [DocNum]
            FROM T3
            WHERE T3.U_WH = '中倉'
        ) THEN 2
        ELSE 0
     END)
