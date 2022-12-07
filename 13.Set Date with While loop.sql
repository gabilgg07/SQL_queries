
-- INSERT INTO [dbo].[Blogs]
--     ([Title]
--     ,[Text]
--     ,[ImagePath]
--     ,[WrotedDate]
--     ,[Facebook]
--     ,[Twitter]
--     ,[Linkedin]
--     ,[Instagram]
--     ,[AuthorId])
-- SELECT [Title]
--       , [Text]
--       , [ImagePath]
--       , [WrotedDate]
--       , [Facebook]
--       , [Twitter]
--       , [Linkedin]
--       , [Instagram]
--       , [AuthorId]
-- FROM [dbo].[Blogs]

-- Update [dbo].[Blogs]
-- SET [WrotedDate] = DATETIME()

-- SELECT  @dateStr;
-- DECLARE @date DATETIME = @dateStr;
-- SELECT @date;
-- DECLARE @date DATETIME = Cast('2019-05-27' as DATETIME)

-- SET LANGUAGE us_english;
-- DECLARE @dateStr NVARCHAR(max) = '2019'+'-05-'+'28';
-- update [dbo].[Blogs] set [WrotedDate] = @dateStr WHERE id=74

-- SELECT * from [dbo].[Blogs] 
GO


DECLARE @dateStr NVARCHAR(max);
DECLARE @month int = 5;
DECLARE @day INT = 4;

DECLARE @counter INT = 1;
WHILE(@counter <= 70)
BEGIN
    WHILE(@day<=30)
    BEGIN
    SET @dateStr = '2019-'+IIF(@month<10,'0','')+cast(@month as NVARCHAR)+'-'+IIF(@day<10,'0','')+cast(@day as NVARCHAR);
    update [dbo].[Blogs] set [WrotedDate] = @dateStr WHERE id=@counter;

    set @day = @day + 1;
    
    set @counter = @counter + 1;
    END
    set @month = @month + 1;
    set @day = 1;
END