-- T-SQL codes

DECLARE @a int = 5;

SELECT @a 'a';

DECLARE @b int;

SET @b = 6;

DECLARE @c int;

SET @c = @a + @b;

select @c 'c';

--- var olan table-a yeni column elave etmek ucun:
ALTER TABLE [dbo].[ProductsTemp]
add [ProductCount] int

--- butun deyerleri 0 etmek ucun:
UPDATE [dbo].[ProductsTemp]
set [ProductCount] = 0
WHERE [ProductCount] is NULL

--- yeni column null, yeni bos olmamasi ucun:
ALTER TABLE [dbo].[ProductsTemp]
ALTER COLUMN [ProductCount] INT NOT NULL

--- constraint - mehdudlasdirici elave etmek ucun:
ALTER TABLE [dbo].[ProductsTemp]
ADD CONSTRAINT [dc_ProductsTemp_ProductCount]
DEFAULT 0 for [ProductCount]

--- productId variable-i declare edirik ve bir alpha adli miqdar declare edirik:
DECLARE @productId int = 2;
DECLARE @alpha int = 15;

--- bu productId variable-na uygun productun count-unu secirik:
SELECT [ProductCount] from [dbo].[ProductsTemp]
WHERE [Id] = @productId

--- tapdigimiz bu ProductCount-un uzerine @alpha deyerini gelmek:
UPDATE [dbo].[ProductsTemp]
SET [ProductCount] = [ProductCount] + @alpha
WHERE [Id] = @productId

--- her defe bele emeliyyatlari uzun - uzadi yazib secmemek ucun sql-de procedure-lar var:
/*
CREATE PROCEDURE [dbo].[spChangeStockCount]
@productId int,
@alpha INT
AS

BEGIN

UPDATE [dbo].[ProductsTemp]
SET [ProductCount] = [ProductCount] + @alpha
WHERE [Id] = @productId

END
*/

--- procedure-u isletmek ucun:

-- EXEC --- bele qisa da yazila bilir
EXECUTE [dbo].[spChangeStockCount]
 @productId = 1, @alpha = 8

EXECUTE [dbo].[spChangeStockCount]
 @productId = 1, @alpha = 5

--- Sql - de error throw etmek:
-- throw 50001, N'Bu məhsul mövcud deyil',1

--- var olan procedure-u deyismek ucun:
-- ALTER PROCEDURE [dbo].[spChangeStockCount]
-- @productId int,
-- @alpha INT
-- AS
-- BEGIN
--     DECLARE @delDate DATETIME = NULL;
--     SELECT @delDate = [DeletedDate]
--     FROM [dbo].[ProductsTemp]
--     WHERE [Id] = @productId

--     if(@delDate is null)
--         BEGIN
--             UPDATE [dbo].[ProductsTemp]
--             SET [ProductCount] = [ProductCount] + @alpha
--             WHERE [Id] = @productId
--         END

--     ELSE
--         BEGIN
--             throw 50001, N'Bu məhsul mövcud deyil',1
--         END

-- END

EXECUTE [dbo].[spChangeStockCount]
 @productId = 4, @alpha = 5


SELECT * FROM [dbo].[ProductsTemp]