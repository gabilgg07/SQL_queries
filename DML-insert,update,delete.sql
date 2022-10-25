
-- DML - Data Manipulation Language

--- Insert
--- Update
--- Delete

-- 1. Insert 

INSERT INTO [dbo].[Persons]([Name],[Surname],[BirthDay],[CreatedDate]) VALUES( N'Nail', N'Kərimli', '1987-08-10', '2022-09-20 16:12:33')

set IDENTITY_INSERT [dbo].[Persons] on -- identity-liyini legv edib ozumuz data elave etmek isteyirikse

insert into [dbo].[Persons]([Id],[Name],[Surname]) VALUES(19 , N'Emin', N'Salahov')

set IDENTITY_INSERT [dbo].[Persons] off -- insert-imizi etdikden sonra yeniden identity olmasi ucun

-- var olan tehlukeli cedvelin kopyasini yaratmaq:

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonsTemp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[BirthDay] [date] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonsTemp] ADD PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PersonsTemp] ADD  DEFAULT (dateadd(hour,(4),getutcdate())) FOR [CreatedDate]
GO

-- kohne cedvelden yaranmis yeni cedvele butun melumatlari(data-lari) kopyalamaq, elave etmek

set IDENTITY_INSERT [dbo].[PersonsTemp] on

INSERT INTO [dbo].[PersonsTemp]([Id],[Name],[Surname],[BirthDay],[CreatedDate]) 
select [Id],[Name],[Surname],[BirthDay],[CreatedDate] from [dbo].[Persons]

set IDENTITY_INSERT [dbo].[PersonsTemp] off

insert into [dbo].[Persons]([Name],[Surname],[BirthDay]) -- bir nece setir birden elave etmek
VALUES( N'Elvin', N'Sultanov','1993-12-22'),
( N'Samir', N'Qurbanov','1999-06-14'),
( N'Yahya', N'Qurbanov','1996-12-17'),
( N'Emil', N'Babayev','1994-07-17')

-- Update

UPDATE 
-- SELECT * FROM
[dbo].[PersonsTemp]
 set [BirthDay] = '2001-11-01' 
 WHERE [Id] = 19

UPDATE 
[dbo].[PersonsTemp]
 set [BirthDay] = '1997-10-04', -- bir nece column birden deyisende
     [Name] = N'Ehtiram',
     [Surname] = N'Əsədli' 
 WHERE [Id] = 5

 -- Delete

 DELETE 
--  SELECT *
 FROM 
 [dbo].[PersonsTemp]
 WHERE [Id] = 12

--- eslinde her hansi melumati silmek duzgun deyil, bunun yerine silinmis kimi qeyd etmek olar,
--- misal, deleteddate column-u elave edib, icinde date varsa silinmis olsun, yoxdursa silinmemis olsun demek oplar

 --- table-e yeni column elave etdikde alter-den istifade edilir

 ALTER TABLE [dbo].[PersonsTemp]
 ADD [DeletedDate] DATETIME

 --- silme emeliyyati evezine her hansi datani silinmis kimi qeyd etmek:

 UPDATE [dbo].[PersonsTemp]
 set [DeletedDate] = DATEADD(hour, 4, getutcdate())
 WHERE [Id] = 8

 --- silinmemis olanlari getirmek ucun:
 SELECT * FROM [dbo].[PersonsTemp]
 WHERE [DeletedDate] is NULL

 --- silinmis olanlar lazimdirsa:
 SELECT * FROM [dbo].[PersonsTemp]
 WHERE [DeletedDate] is NOT NULL


-- ------------------------------------------

SELECT * FROM [dbo].[Persons]
SELECT * FROM [dbo].[PersonsTemp]

SELECT * FROM [dbo].[PersonsTemp]
WHERE [DeletedDate] = NULL