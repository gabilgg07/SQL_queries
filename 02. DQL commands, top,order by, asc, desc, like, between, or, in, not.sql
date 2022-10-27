-- DQL queries(sorgular)

SELECT * FROM [dbo].[Persons] --> * -> hamisini getirir

SELECT [Name] FROM [dbo].[Persons] --> ancaq adlari getirir

SELECT [Id], [Name] FROM [dbo].[Persons] --> ardicil olasraq id-leri ve adlaari getirir

SELECT [Id], [Name], [BirthDay], [CreatedDAte] FROM [dbo].[Persons] --> ardicil olaraq butun yazdiqlarimizi getirir

SELECT top(3) [Id], [Name], [BirthDay] FROM [dbo].[Persons] --> yuxardan ilk 3-nu getirir

SELECT [Id], [Name], [BirthDay] FROM [dbo].[Persons] ORDER BY [Id] --> id-ye gore aazdan coxa dogru siralayir (en ideali)

SELECT [Id], [Name], [BirthDay] FROM [dbo].[Persons] ORDER BY [Id] ASC --> asc default olaraqdi, yeni azdan coxa

SELECT [Id], [Name], [BirthDay] FROM [dbo].[Persons] ORDER BY [Id] desc --> bu zaman eksine, coxdan aza dogru getirir



SELECT top(2) [Id], [Name], [BirthDay] FROM [dbo].[Persons] ORDER BY [Id] desc --> bu zaman ise axirdan ikisini getirir

SELECT [Id], [Name], [BirthDay] FROM [dbo].[Persons] WHERE [Id] = 3 --> id-si 3 olani getir demekdir

SELECT [Id], [Name], [BirthDay] FROM [dbo].[Persons] WHERE [Name] = N'Qasım' --> adi 'Qasim' olani getir. 
-- Metinler tek dirnaqla yazilir ve icinde elave simvol varsa, evveline boyuk N herfi yazilir

SELECT [Id], [Name], [BirthDay] FROM [dbo].[Persons] WHERE [Name] LIKE N'E%' --> ada gore evveli 'E' ile baslayanlara oxsayanlari getir('E' ile baslayanlari getir)

SELECT [Id], [Name], [BirthDay] FROM [dbo].[Persons] WHERE [Name] LIKE N'%l' --> ada gore sonu 'l' ile bitenlere oxsayanlari getir('l' ile bitenleri getir) 

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Surname] LIKE N'%an%' --> soyada gore icinde 'an' olanlara oxsayanlari getir(icinde 'an' olanlari getir) 

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Surname] NOT LIKE N'%an%' --> icinde 'an' olmayanlari getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Id] BETWEEN 2 and 4 --> id-ye gore 2-4 araliginda olanlari getir, 2 ve 4 daxil olmaqla

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Id] NOT BETWEEN 2 and 4 --> id-ye gore 2-4 araliginda olmayanlari getir, 2 ve 4 daxil olmaqla

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Id] >= 4 --> id-ye gore 4-de beraber olmaqla boyuk olanlari getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE NOT [Id] >= 4 --> id-ye gore 4-de beraber olmaqla boyuk olmayanlari getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Id] = 4 or [Id] = 6 or [Id] = 1 --> id-ye gore 4-de ve ya 6-ya ve ya 1-e beraber olani getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE NOT ([Id] = 4 or [Id] = 6 or [Id] = 1) --> id-ye gore 4-de ve ya 6-ya ve ya 1-e beraber olmayanlari getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Id] in (2,3,5,7,8) --> id-si (2,3,5,7,8) massivin icindekilere beraber olanlari getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Id] not in (2,3,5,7,8) --> id-si (2,3,5,7,8) massivin icindekilere beraber olmayanlari getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [Name] = N'Qasım' and [Surname] = N'Səlimov'  --> adi 'Qasım' ve soyadi da 'Səlimov'-a  beraber olani getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE NOT ([Name] = N'Qasım' and [Surname] = N'Səlimov')  --> adi 'Qasım' ve soyadi da 'Səlimov'-a  beraber olmayanlari getir

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [BirthDay] BETWEEN '1991-07-01' and '1991-07-30' --> verilmis tarix arasinda olanlar

SELECT [Id], [Name], [Surname], [BirthDay] FROM [dbo].[Persons] WHERE [BirthDay] BETWEEN '1991' and '2000' --> verilmis iller arasi olanlar 

SELECT [Id], [Name], [Surname], [CreatedDate] FROM [dbo].[Persons] WHERE [CreatedDate] >= '2022-06-01' and [CreatedDate] < '2022-07-01' --> 1 ay ucun tam cixrilis

SELECT * FROM [dbo].[Persons] 