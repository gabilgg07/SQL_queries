
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

-- ------------------------------------------

SELECT * FROM [dbo].[Persons]
SELECT * FROM [dbo].[PersonsTemp]