-- USE KontaktHome

-- CREATE TABLE [dbo].[Products](   --> table-i yaratmaq
--     [Id] int,                    --> column adi ve type-i (int)
--     [Name] NVARCHAR(200),        --> string 200 chaar-liq
--     [CreatedDate] DATETIME.      --> DateTime
-- )

-- DROP TABLE [dbo].[Products] // table-i silmek


-- create table with primary key and identity
-- CREATE TABLE [dbo].[Products](   
--     [Id] int primary key IDENTITY,                    
--     [Name] NVARCHAR(200),        
--     [CreatedDate] DATETIME    
-- )

-- create table with primary key, identity and not null constrains
-- CREATE TABLE [dbo].[Products](   
--     [Id] int primary key IDENTITY,                    
--     [Name] NVARCHAR(200) NOT NULL,        
--     [CreatedDate] DATETIME NOT NULL   
-- )

SELECT GETDATE() bakiVaxti; 
SELECT GETUTCDATE() DunyaVaxti; 

SELECT DATEADD(HOUR,4,GETUTCDATE());

-- DROP TABLE [dbo].[Products]


-- create table with primary key, identity, not null constrains and default value
CREATE TABLE [dbo].[Products](   
    [Id] int primary key IDENTITY,                    
    [Name] NVARCHAR(200) NOT NULL,        
    [CreatedDate] DATETIME NOT NULL DEFAULT DATEADD(HOUR,4,GETUTCDATE())
)
