
-- IIF()
--- 1-ci p. sert,
--- 2-ci p. sertden true cixarsa qaytarilacaq olan,
--- 3-cu p. sertden false cixarsa qaytarilacaq olan

SELECT IIF(1=1, 'beli', 'xeyr') '1=1?',
       IIF(1=2, 'beli', 'xeyr') '1=2?';

SELECT *,IIF(Vat18=1,'EDV var','EDV-den azad') as EDV FROM [dbo].[ProductsTemp]
--- her sutunda Vat18 column-u yoxlayir

------------------------------------------------------

-- EOMONTH() 
--- 1-ci parametr kimi qebul etmis tarixdeki ayin son gununu qaytarir,

DECLARE @firstDate DATE = '20220801';
DECLARE @maxDay DATE = DATEADD(day, 1, eomonth(@firstDate));

-- SELECT @maxDay;

SELECT [Name],[CreatedDate] FROM [dbo].[PersonsTemp]
WHERE [CreatedDate] >= @firstDate and [CreatedDate] < @maxDay; 

GO

--- 2-ci p. nece ay evvelki(-) ve ya sonraki ayin son gununu tapmaq ucun

DECLARE @firstDate DATE = '20220801';

SELECT @firstDate '@firstDate'
,eomonth(@firstDate) 'eomonth'
,eomonth(@firstDate, 5) '+5'
,eomonth(@firstDate, -5) '-5'
,eomonth(@firstDate, 24) '24'
,eomonth(@firstDate, -24) '-24';

------------------------------------------------------

-- NEWID()
--- serial number kimi random string qaytarir

SELECT NEWID() 'new id 1';
SELECT NEWID() 'new id 2';
SELECT NEWID() 'new id 3';
SELECT NEWID() 'new id 4';
SELECT NEWID() 'new id 5';

--- misal, imtahan suallarinda her kese ayrica random ardicilliqla gelmesinde de istifade edile biler

SELECT * FROM [dbo].[PersonsTemp]
ORDER BY NEWID()