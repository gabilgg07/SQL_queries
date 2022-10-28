--- Procedure kimi bizim funksiyalar kimi elave obyektlerimiz var,
--- funksiyalar dedikde yeni, misal 2 ededin toplanmasi, vurulmasi ve s kimi.

DECLARE @a int = -10;

-- ABS ededin modulunu cixartmaq:
SELECT abs(@a) 'ABS(-10)'


DECLARE @d DECIMAL(18,2) = -10.2;

SELECT ABS(@d) 'ABS(-10.2)', -- modulun cixarilmasi
       FLOOR(@d) 'floor(-10.2)', -- asagi yuvarlaqlasdirma
       CEILING(@d) 'ceiling(-10.2)', -- yuxari yuvarlaqlasdirma
       ROUND(@d,0) 'round(-10.2,0)' -- adi yuvarlaqlasdirma

SET @d = 10.25;

SELECT ROUND(@d,1) 'round(10.25,1)', -- round function-un ikinci parametri kesir hisseni nezerde tutur
       ROUND(10.24,1) 'round(10.24,1)'

SELECT POWER(4,3) 'POWER(4,3)', -- quvvet ustu
       POWER(64,1/2) 'POWER(64,1/2)', -- bele kok alti olur, amma 1/2 ni tam eded kimi goturduyunden 0 qaytarir
       POWER(64,1.0/2) 'POWER(64,1.0/2)' -- ona gore kesirdeki 2 ededden birini kesr kimi gostermek lazim