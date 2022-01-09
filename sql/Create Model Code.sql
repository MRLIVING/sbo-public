declare @testcntv1 INT
declare @testcntvn INT
declare @testcntfl INT
declare @ifmd_exist INT
declare @ItemCode VARCHAR(50)
declare @cardcode VARCHAR(50)
declare @incno INT
declare @U_item_c1 VARCHAR(50)
declare @U_item_c2 VARCHAR(50)
declare @U_item_c3 VARCHAR(50)
declare @catename VARCHAR(50)
declare @U_tag_ccode_ver INT
declare @scode VARCHAR(50)
declare @U_fbname VARCHAR(50)
declare @fbcode VARCHAR(50)
declare @U_sname VARCHAR(50)
declare @U_pre_tag_ccode VARCHAR(50)
declare @incnostring VARCHAR(50)
declare @finalmodelcode VARCHAR(50)
declare @errmsg VARCHAR(200)

SET @testcntv1 = 0
SET @testcntvn = 0
SET @testcntfl = 0
-- 宣告指標變數
DECLARE _cursormcode CURSOR FOR
SELECT T0.[ItemCode],T0.[CardCode],T0.[U_item_c1],T0.[U_item_c2],T0.[U_item_c3],T0.[U_tag_ccode_ver],T0.[U_sname],T0.[U_pre_tag_ccode],T0.[U_fbname] FROM OITM T0 where T0.[U_item_tag_ccode] IS NULL AND T0.[U_item_status] != 8

-- 啟用指標變數
OPEN _cursormcode
-- 以指標變數為基準點, 將取出的欄位值,依序塞給我們自訂的變數，亦即將每筆s1 => @para1、 s2 => @para2 
FETCH NEXT FROM _cursormcode INTO @ItemCode,@cardcode,@U_item_c1,@U_item_c2,@U_item_c3,@U_tag_ccode_ver,@U_sname,@U_pre_tag_ccode,@U_fbname
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @finalmodelcode = 'n'
	
	-- if version 1 , go to create new code
	IF @U_tag_ccode_ver = 1
	BEGIN
		SET @testcntv1 = @testcntv1 +1
		IF @U_item_c1 = 'SF'
			BEGIN
				SET @scode = ( SELECT [Code] FROM [dbo].[@SSMODEL_LIST] WHERE [U_fcode] = @cardcode AND [Name] = @U_sname )
				SET @catename = (SELECT U_C3_name FROM [dbo].[@ITEM_CATEGORY] WHERE U_c3_code = @U_item_c3 AND U_c2_code = @U_item_c2 AND U_c1_code = @U_item_c1 )
				SET @fbcode = ( SELECT [Code] FROM [dbo].[@FABRIC_LIST] WHERE [U_fcode] = @cardcode AND [Name] = @U_fbname )
			
				-- UPDATE OITM SET U_item_tag_ccode = CONCAT(CAST( RIGHT(@cardcode,7) AS INT),'-',@scode,'-',@U_item_c3,'-',@fbcode,'-v',@U_tag_ccode_ver) WHERE ItemCode = @ItemCode
				SET @finalmodelcode = CONCAT(CAST( RIGHT(@cardcode,7) AS INT),'-',@scode,'-',@catename,'-',@fbcode,'-v',@U_tag_ccode_ver)
			END
		ELSE 
			 BEGIN
				
				SET @incno =(SELECT (U_latest_num +1) FROM [dbo].[@MRL_ITEM_GETNUM] WHERE [Code] = @cardcode)
				
				UPDATE [dbo].[@MRL_ITEM_GETNUM] SET U_latest_num = @incno WHERE Code = @cardcode
				
				--UPDATE OITM SET U_item_tag_ccode = CONCAT(@U_item_c1,@U_item_c2,'-',CAST( RIGHT(@cardcode,7) AS INT),'-',@incno,'-v',@U_tag_ccode_ver) WHERE ItemCode = @ItemCode
				SET @finalmodelcode = CONCAT(@U_item_c1,@U_item_c2,'-',CAST( RIGHT(@cardcode,7) AS INT),'-',@incno,'-v',@U_tag_ccode_ver)
				
			 END
	END
	
	-- if version greater than 1, got it pre version code 
	IF @U_tag_ccode_ver > 1
	BEGIN
		SET @testcntvn = @testcntvn +1
		-- @U_pre_tag_ccode is an ItemCode relation field with pre ver item 
		SET @incnostring = (SELECT [U_item_tag_ccode]  FROM OITM WHERE [ItemCode] = @U_pre_tag_ccode)
		SET @incnostring = (SELECT REVERSE( SUBSTRING( REVERSE(@incnostring), PATINDEX('%-%', REVERSE(@incnostring))+1, 100)))
		--UPDATE OITM SET U_item_tag_ccode = CONCAT (@incnostring,'-v',@U_tag_ccode_ver) WHERE ItemCode = @ItemCode
		SET @finalmodelcode = CONCAT(@incnostring,'-v',@U_tag_ccode_ver)
	END
	
	-- check if code had been used before
	SELECT @ifmd_exist=COUNT(*) FROM OITM WHERE [U_item_tag_ccode] = @finalmodelcode
	
	--IF( @ifmd_exist > 0 )
	--BEGIN		
	--	SET @errmsg = CONCAT (@finalmodelcode,' 此品項產生的 Model Code 已存在! 請重新檢查特徵值')
	--	SELECT @errmsg As 'errmsg' 
	--END
	--ELSE 
	--BEGIN
		UPDATE OITM SET U_item_tag_ccode = @finalmodelcode WHERE ItemCode = @ItemCode
		SET  @testcntfl  =  @testcntfl  + 1
	--END
	
    -- 指標變數往下移動, 並將取出的欄位值, 設定給我們自訂的變數
    FETCH NEXT FROM _cursormcode INTO @ItemCode,@cardcode,@U_item_c1,@U_item_c2,@U_item_c3,@U_tag_ccode_ver,@U_sname,@U_pre_tag_ccode,@U_fbname
END

-- 關閉指標變數
CLOSE _cursormcode
-- 釋放指標變數
DEALLOCATE _cursormcode


SELECT @testcntv1 as v1, @testcntvn as vn,  @testcntfl  as final_update