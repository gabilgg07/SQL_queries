
-- =============================================
-- Author:      Gabil GG
-- Create date: 2022-10-29
-- Description: Həmişə Azərbaycan,Bakı saatını versin
-- =============================================

-- CREATE FUNCTION [dbo].[fnSYSDATETIME]()
-- RETURNS DATETIME
-- AS
-- BEGIN
--     RETURN DATEADD(HOUR,4,getutcdate())
-- END
-- GO

SELECT dbo.fnSYSDATETIME()

--- 2 parametr kimi qebul eden ededleri toplayan func. misal:

-- CREATE FUNCTION [dbo].[fnAddition](
--     @a DECIMAL(18,2),
--     @b DECIMAL(18,2)
-- )
-- RETURNS DECIMAL(18,2)
-- AS
-- BEGIN
--     DECLARE @cavab DECIMAL(18,2);
--     SET @cavab = @a + @b;
--     RETURN @cavab;
-- END
-- go

SELECT dbo.fnAddition(7,8);