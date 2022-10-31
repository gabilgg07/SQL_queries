CREATE TABLE [dbo].[Category](
	[Id] int identity primary key,
	[Name] nvarchar(150) NOT NULL,
	[CreatedDate] datetime NOT NULL DEFAULT GETDATE())
	go

	insert into [dbo].[Category]([Name])
	values(N'Audio,video')
	,(N'Kompüter və ofis avadanlığı')
	,(N'Planşetlər')
	,(N'Telefonlar, Saatlar və Nömrələr');
	go

    create table dbo.Products( --cədvəli yenidən normallaşdırılmış halda yaradırıq
	Id		int identity primary key, --acar sahesi
	[Name]	nvarchar(150) not null,
	[Description]	nvarchar(250) null,
	[CategoryId]  int,--yenilendi
	[CreatedDate] [date] NOT NULL default getdate() --sisteme dusme tarixi
	)
    GO

    INSERT [dbo].[Products] ([Name], [Description], [CategoryId], [CreatedDate]) 
    VALUES (N'Wonlex GW100 Pink', NULL, 4, '2019-09-15')
    ,(N'Wonlex Q50 Charisma BLACK', NULL, 4, '2019-09-15')
    ,(N'Samsung Galaxy S10 Dual (SM-G973) White', NULL, 4, '2019-09-15')
    ,(N'Xiaomi Mi A3 4/128GB White', NULL, 4, '2019-09-15')
    ,(N'Blackview BV1000 yellow', NULL, 4, '2019-09-15')
    ,(N'Huawei Y9 2019 4/64GB Red', NULL, 4, '2019-09-15')
    ,(N'FLY TS114 BLACK', NULL, 4, '2019-09-15')
    ,(N'Blackview BV5500 Pro yellow', NULL, 4, '2019-09-15')
    ,(N'Lenovo TB 7104I/3G -Wi-Fi/7 BLACK', NULL, 3, '2019-09-15')
    ,(N'Samsung Galaxy Tab A 8.0 (SM-T295) Black', NULL, 3, '2019-09-15')
    ,(N'Lenovo TAB E10 TB-X104F/10.1 BLACK', NULL, 3, '2019-09-15')
    ,(N'Lenovo TAB 4 10 LTE (TB-X304L) black', NULL, 3, '2019-09-15')
    ,(N'Samsung Galaxy Tab A (SM-T385) GOLD', NULL, 3, '2019-09-15')
    ,(N'Huawei M5 Lite 3+32 Space Grey', NULL, 3, '2019-09-15')
    ,(N'Apple MacBook Air 13″ MVFK2', NULL, 2, '2019-09-15')
    ,(N'Apple MacBook Air 13″ MVFH2', NULL, 2, '2019-09-15')
    ,(N'Monoblok HP ENVY 27-B170ur i7/16/nv4/1tb128/win10', NULL, 2, '2019-09-15')
    ,(N'Noutbuk Asus Tuf Gaming FX505DD BQ121 ', NULL, 2, '2019-09-15')
    ,(N'Noutbuk Acer Predator Helios 300 PH315-52-718G ', NULL, 2, '2019-09-15')
    ,(N'Musiqi merkezi SONY MHC-V82D', NULL, 1, '2019-09-15')
    ,(N'Speaker Sony SRS-XB21 Wireless', NULL, 1, '2019-09-15')
    ,(N'JBL Pulse 3 Black', NULL, 1, '2019-09-15');
    GO

     
   INSERT [dbo].[Products] ([Name], [CategoryId], [CreatedDate]) 
   VALUES (N'Fotoaparat Canon EOS M100 15-45mm IS STM Kit Black', NULL, '2019-09-15');
   GO


   INSERT [dbo].[Category] ([Name]) 
   VALUES (N'Mebellər');

------------------------------------------------------------------------------------

select 
p.Id 
,p.Name
,p.CategoryId
,c.Name [CategoryName]
,p.CreatedDate 
from [dbo].[Products] p
inner join [dbo].[Category] c on p.CategoryId=c.Id;
GO


SELECT 
p.Id 
,p.Name
,p.CategoryId
,c.Name [CategoryName]
,p.CreatedDate 
from [dbo].[Products] p
left join [dbo].[Category] c on p.CategoryId=c.Id;
GO

SELECT 
p.Id 
,p.Name
,p.CategoryId
,c.Name [CategoryName]
,p.CreatedDate 
from [dbo].[Products] p
right join [dbo].[Category] c on p.CategoryId=c.Id;
GO

SELECT 
p.Id 
,p.Name
,p.CategoryId
,c.Name [CategoryName]
,p.CreatedDate 
from [dbo].[Products] p
full outer join [dbo].[Category] c on p.CategoryId=c.Id;
GO

------------------------------------------------------------

-- say tapmaq ucun bizim aqreqat funksiyalarimiz var:

SELECT COUNT([Id]) FROM [dbo].[Products]

-- her kategoriyadaki produkt sayini tapmaq ucun ise

SELECT 
c.[Name], COUNT(p.[Id]) [UmumiSay]
 FROM [dbo].[Products] p
JOIN [dbo].[Category] c on p.[CategoryId] = c.[Id]
GROUP BY c.[Name]

--- bele birlesmelerde agregat funksiyalardan
--- (count(), sum(), avg(), min(), max() ve s.)
--- her hansi biri istifade edilerse, yerde qalan parametrlere esasen qruplasdirilir
--- group by c.[Name] kimi
--- productu olmayan kategori de var, biz yuxarida esas terefi produkt goturduyumuze gore hemin kategorini getirmeyib.

SELECT 
c.[Name], COUNT(p.[Id]) [UmumiSay]
 FROM [dbo].[Products] p
RIGHT JOIN [dbo].[Category] c on p.[CategoryId] = c.[Id]
GROUP BY c.[Name]


------------------------------------------------------------

ALTER TABLE [dbo].[Products]
ADD [Price] DECIMAL(18,2)

------------------------------------------------------------

SELECT 
COUNT([Id]) [Count]
,SUM([Price]) [Sum Price]
,AVG([Price]) [Avg Price]
,MIN([Price]) [Min Price]
,MAX([Price]) [Max Price]
,MIN([CreatedDate]) [Min CreatedDate]
,MAX([CreatedDate]) [Max CreatedDate]
FROM [dbo].[Products]

------------------------------------------------------------
---- her kateqoriye gore orta qiymet, umumi cemm

SELECT 
c.[Id],c.[Name],
 COUNT(p.[Id]) [UmumiSay],
 isnull(AVG([Price]),0)  [Orta Qiymet],
 ISNULL(SUM([Price]),0)  [Cem]
 FROM [dbo].[Products] p
RIGHT JOIN [dbo].[Category] c on p.[CategoryId] = c.[Id]
GROUP BY c.[Name], c.[Id] --- aggregate funksiyalardan basqa hamisi group by-da yazilmalidir