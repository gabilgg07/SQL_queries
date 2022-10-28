-- SQL Build In Functions 2

-----------------------------------------------------------

-- ISNULL()
--- eger 1ci parametr null deyilse onu goturur, null-dirsa 2ci parametri goturur:

DECLARE @a int;

SELECT ISNULL(@a,0);

set @a = 6;

SELECT ISNULL(@a,0);

-----------------------------------------------------------

-- DATEADD()
--- 1-ci parametr tarix vahididir, Year de daxil olmaqla,
--- 2-ci parametr miqdardi, 1-ci hissede yazilan vahidden bu qeder kimi,
--- 3-cu parametr ise miqdarin uzerine gelinecek olan tarix. 

DECLARE @d DATETIME = '2021-12-30 11:12:13';
DECLARE @dNew DATETIME;

set @dNew = DATEADD(DAY,2,@d);
-- 2 gun gelmek

SELECT @d 'Date', @dNew 'New Date';

set @dNew = DATEADD(MONTH,6,@d);
-- 6 ay gelmek

SELECT @d 'Date', @dNew 'New Date';

set @dNew = DATEADD(MONTH,-5,@d);
-- 5 ay cixmaq

SELECT @d 'Date', @dNew 'New Date';

set @dNew = DATEADD(YEAR,-1,@d);
-- 1 il cixmaq

SELECT @d 'Date', @dNew 'New Date';

-----------------------------------------------------------

-- DATEPART()
--- 1-ci parametr yene vahiddir: hour, month, year ve s.
--- 2-ci parametr tarix
---- return, verilmis tarixdeki, vermis vahid miqdari

DECLARE @myDate DATETIME = '2021-03-13 10:11:12.328';

SET datefirst 1;

SELECT DATEPART(YEAR,@myDate) 'years'
, DATEPART(MONTH,@myDate) 'months'
, DATEPART(DAY,@myDate) 'days'
, DATEPART(HOUR,@myDate) 'hours'
, DATEPART(MINUTE,@myDate) 'minutes'
, DATEPART(SECOND,@myDate) 'seconds'
, DATEPART(MILLISECOND,@myDate) 'mseconds'
, DATEPART(WEEKDAY,@myDate) 'weekday'
, DATEPART(WEEK,@myDate) 'week'

-----------------------------------------------------------

-- CHOOSE()
--- 1-ci parametr ededdir, hansiki, novbeti gelecek olan parametrlerden necencini sececeyini gosterir.
--- sonra gelen parametrler, secilecek olan parametrlerdir, secim sayi 1-den baslayir. 

SELECT CHOOSE(2,'birinci','ikinci','ucuncu') 'Necenci?';

-----------------------------------------------------------

-- CAST(variable as anytype)
--- yeni, variable-i anytype-e cast ele(cevir) demekdir
SELECT CAST(23 as nvarchar(2));

-----------------------------------------------------------

DECLARE @my_date DATETIME = '1991-07-07'
DECLARE @str NVARCHAR(200);

-- set @str = DATEPART(DAY,@my_date) --> bu yazilisda DATEPART bize eded qaytarir ve ustunluk ededde oldugu ucun digerlerini de edede cevirmeye calisir
-- ve buna gore CHOOSE qaytardigi string type-ni edede cevire bilmir ve error qaytarir
-- + ' '
-- + CHOOSE(DATEPART(MONTH,@my_date),'yanvar','fevral','mart','aprel','may','iyun','iyul','avqust','sentyabr','oktyabr','noyabr','dekabr')+ ' '
-- + DATEPART(YEAR,@my_date);

set @str = CAST(DATEPART(DAY,@my_date) as nvarchar(2))+ ' '
+ CHOOSE(DATEPART(MONTH,@my_date),'yanvar','fevral','mart','aprel','may','iyun','iyul','avqust','sentyabr','oktyabr','noyabr','dekabr')+ ' '
+ CAST(DATEPART(YEAR,@my_date) as nvarchar(4));

SELECT @str 'tarix';

-----------------------------------------------------------

DECLARE @test NVARCHAR(200);

SET @test = 23 + ' 43';
-- bele olarsa edede cevirib cemleyir ve 66 cixardir
SELECT @test;

-----------------------------------------------------------

-- CONCAT()
--- icindeki butun parametrleri stringe cevirib birlesdirir:

SELECT CONCAT('test',221,54,N' ədəd');

-- SELECT 6.8 + '65.9' --> error qaytarir
SELECT 45 + '65' + 8.9
SELECT '45' +7+ '65' + 8.9
--> en azi 1 eded int olmalidir

-----------------------------------------------------------

-- LEN(parametr) --> string-deki charlarin uzunlugu, sayi
-- DATALENGTH(parametr) --> parametrin yaddas tutumu

DECLARE @nv NVARCHAR(200) = 'code';
--> nvarchar 1 char - 2 byte
SELECT LEN(@nv) 'len', DATALENGTH(@nv) 'datalength';
--> 4 , 8
--> 4 (str uzunlugu)|  8 (byte)

DECLARE @v VARCHAR(200) = 'code';
--> nvarchar 1 char - 1 byte
SELECT LEN(@v) 'len', DATALENGTH(@v) 'datalength';
--> 4 , 4
--> 4 (str uzunlugu)|  4 (byte)

DECLARE @dv VARCHAR(200) = '2021-01-01 02:04:14';
DECLARE @dt DATETIME = '2021-01-01 02:04:14';
SELECT LEN(@dv) 'dv-len', DATALENGTH(@dv) 'dv-datalength';
SELECT LEN(@dt) 'dt-len', DATALENGTH(@dt) 'dt-datalength';
--> datetime 8 byte yer tutur
--- string yazsaqda datetime onun casting edib cevirir.

-----------------------------------------------------------

-- CAST(), PARSE(), TRY_PARSE() 

DECLARE @strD VARCHAR(200) = '2021-01-01 02:04:14';
DECLARE @dtimeCast DATETIME;
-- DECLARE @dtimeParse DATETIME;

SET @dtimeCast = CAST(@strD as datetime);
-- SET @dtimeParse = PARSE(@strD AS datetime); -- Azure Sql de islemir
-- TRY_PARSE da islemir

SELECT @dtimeCast 'dtimeCast';

go 
--> go yazdiqda asagida yeniden eyni adli variableni yeniden adlandirmaq olur. yeni sehife acarmis kimi

-----------------------------------------------------------

--================ For Windows ===================
-- PARSE()
--- cevire bilmese error qaytarir

-- TRY_PARSE()
--- cevire bilmese error evezine, null qaytarir, ona gore is null-la yoxlaya bilirik

declare @strD varchar(200) = '2021-22-02 12:22:13';

declare @dP datetime;
declare @dTryP datetime;

-- set @dP = PARSE(@strD as datetime); --> cevire bilmir ve ERROR QAYTARIR

set @dTryP = TRY_PARSE(@strD as datetime); --> cevire bilmir ve null qaytarir

if @dTryP is null
	begin
		select 'Tarix formati problemlidir' 'Error'
	end
else
	begin
		SELECT @dTryP '@dTryP'
	end
--================================================

-----------------------------------------------------------

-- CONVERT() 
--- 1-ci parametr - datatype,
--- 2-ci parametr - variable,
--- 3-cu parametr - [style] Input/Output (3)
---- convert format kodlari ile de isleyir
---- cevire bilmirse error qaytarir

DECLARE @dStr VARCHAR(200) = '20210316';
SELECT CONVERT(datetime,@dStr,112) '112';
--> style = input code 
DECLARE @dStr2 VARCHAR(200) = '210316';
SELECT CONVERT(datetime,@dStr2,12) '12';
--> style = input code 
DECLARE @dStr3 DATETIME = getdate();
SELECT CONVERT(VARCHAR(200),@dStr3,113) '113'; --> style = output code 

go

-- TRY_CONVERT() --> cevire bilmirse null qaytarir, error qaytarmir.

DECLARE @dStr VARCHAR(200) = '2021hgh0316';
DECLARE @d DATETIME = TRY_CONVERT(datetime,@dStr,112);

IF @d is NULL
       BEGIN
    SELECT 'Format problemlidir' 'errorMsg';
END
ELSE
       BEGIN
    SELECT @d;
END

-----------------------------------------------------------

-- FORMATMESSAGE('text %s', ...parametrs)
--- 1-ci hisse qaytarilacaq olan string,
--- sonrakilar, 1-ci stringin icinde yerlesdirilecek olan parametrler
--- %s -> stringler ucun
--- %d -> digit - ededler ucun
--- %08s ve ya %03d -> length-i 8-den azdirsa, 8 olana qeder evveline 0 elave edir
--- %5s ve ya %5d -> length-i 5-den azdirsa, 5 olana qeder evveline bosluq elave edir 

DECLARE @name NVARCHAR(80) = N'Sənan';
-- %s
SELECT FORMATMESSAGE('Salam, %s.', @name);
-- %s, %s
SELECT FORMATMESSAGE('Salam, %s, %s.', @name, 'Emin');
-- %d
SELECT FORMATMESSAGE('Salam, %s %d defe.', 'Emin', 56);
-- %8s
SELECT FORMATMESSAGE('Salam, %8s %d defe.', 'Emin', 56);
-- %08s
SELECT FORMATMESSAGE('Salam, %08s %d defe.', 'Emin', 56);
-- %03d
SELECT FORMATMESSAGE('Salam, %s %03d defe.', 'Emin', 56);
-- %6d
SELECT FORMATMESSAGE('Salam, %s %6d defe.', 'Emin', 5876);

-----------------------------------------------------------

-- FORMAT(datetime, stringFormat)
--- 1-ci p. datetime cinsinden tarix,
--- 2-ci p. string type-da tarix formati

--SELECT FORMAT(GETDATE(),'dd-MMM-yyyy HH:mm:ss'); --> sql Azure-de islemir
GO

-- DECLARE @d DATETIME = '12/01/2018';
-- SELECT FORMAT(@d, 'd');

-- SELECT FORMAT(123456789, '##-##-#####'); --out--> 12-34-56789


-----------------------------------------------------------

--================ For Windows ===================

-- FORMAT(datetime, stringFormat)
go
declare @d datetime = getdate();
select format(@d,'dd-MMM-yyyy HH:mm:ss') 'dd-MMM-yyyy HH:mm:ss'
,format(@d,'dd-MMM-yyyy') 'dd-MMM-yyyy'
,format(@d,'HH:mm:ss') 'HH:mm:ss'
,format(@d,'dd-MM-yyyy') 'dd-MM-yyyy'
,format(@d,'dd-MMMM-yy') 'dd-MMMM-yy'
,format(@d,'dd-MMMM-yyyy') 'dd-MMMM-yyyy';
go

DECLARE @d DATETIME = '12/01/2018';
SELECT FORMAT(@d, 'd');

SELECT FORMAT(123456789, '##-##-#####'); --out--> 12-34-56789
--================================================

-----------------------------------------------------------