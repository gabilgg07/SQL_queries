-- JOINS

--- LEFT JOIN
--- RIGHT JOIN
--- INNER JOIN (or JOIN)
--- FULL OUTER JOIN

select
* from [dbo].[Products] 
join [dbo].[Categories] on 
[dbo].[Products].[CategoryId] = [dbo].[Categories].[Id]

--- serti adlar vererek qisaltmalar
select
p.[Id],
p.[Name],
p.[CategoryId],
c.[Name] [CategoryName],
p.[Price],
p.[CreatedDate]
from [dbo].[Products] p
join [dbo].[Categories] c on 
p.[CategoryId] = c.[Id]

--- query seklinde cedvelleri elaqelendirmek
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO