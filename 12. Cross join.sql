SELECT TOP (1000) [Id]
      ,[Name]
      ,[Price]
      ,[ShortDescription]
      ,[Weight]
      ,[UnitId]
      ,[CategoryId]
      ,[Description]
      ,[Information]
      ,[Reviews]
  FROM [Ogani].[dbo].[Products]


-- Tekrar eyni produktdan elave etmek:

-- INSERT into [dbo].[Products]([Name]
--       ,[Price]
--       ,[ShortDescription]
--       ,[Weight]
--       ,[UnitId]
--       ,[CategoryId]
--       ,[Description]
--       ,[Information]
--       ,[Reviews])
--   SELECT [Name]
--       ,[Price]
--       ,[ShortDescription]
--       ,[Weight]
--       ,[UnitId]
--       ,[CategoryId]
--       ,[Description]
--       ,[Information]
--       ,[Reviews] FROM [dbo].[Products]


-- Product-un adi tekrar olmamasi ucun, evveline Id-sini elave etmek:

--   UPDATE [dbo].[Products]
--   SET [Name] = STR([Id])+ N' - ' + [Name]

-- Product adinda yaranmis bosluqlari silmek sag,sol:

--   UPDATE [dbo].[Products]
--   SET [Name] = TRIM([Name])

-- Elave olunmus Productlarla ProductImageler elave etmek ucun:

-- SELECT * FROM Products p
-- CROSS JOIN ProductImages
-- WHERE p.Id <> 1

-- Sonra ProructImages-in de icini doldururuq:

-- INSERT INTO [dbo].[ProductImages]([ImagePath]
--       ,[IsMain]
--       ,[ProductId])
-- SELECT [ImagePath]
--       ,[IsMain]
--       ,p.Id FROM Products p
-- CROSS JOIN ProductImages
-- WHERE p.Id <> 1

