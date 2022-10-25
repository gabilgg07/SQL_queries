-- DDL Advanced

-- Create

create TABLE [dbo].[ProductsTemp](
    [Id] int PRIMARY KEY IDENTITY,
    [Name] NVARCHAR(200) NOT NULL,
    [Price] DECIMAL(18,2) NOT NULL,
    [CreatedDate] DATETIME NOT NULL DEFAULT DATEADD(hour,4,GETUTCDATE()),
    [DeletedDate] DATETIME
)

-- INSERT INTO [dbo].[ProductsTemp]([Name],[Price])
-- VALUES(N'Zeytun',4.5),
-- (N'Banan', 2.5),
-- (N'Şəkər tozu', 2.3),
-- (N'Toyuq döş əti', 7.5),
-- (N'Milla - Süd', 2.8),
-- (N'Yumurta', 0.15)


UPDATE [dbo].[ProductsTemp]
SET [DeletedDate] = DATEADD(HOUR,4,GETUTCDATE())
WHERE [Id] IN(2,5)

--- her defe silinmisleri getirmeye uzun kod yazmayaq deye, sql de view create edirik:

CREATE VIEW [dbo].[VwProductsTemp]
AS SELECT [Id],[Name],[Price],[CreatedDate]
FROM [dbo].[ProductsTemp]
WHERE [DeletedDate] IS NULL

--- view-nu cagiranda da adi cedvel kimi cagrilir:

SELECT * FROM [dbo].[VwProductsTemp]


SELECT * FROM [dbo].[ProductsTemp]