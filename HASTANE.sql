
use sys;

CREATE TABLE Hastaneler
(
    id char (4) primary key,
    isim varchar(30),
    sehir varchar(30),
    ozel char
);
INSERT INTO Hastaneler VALUES ('H101', 'ACI MADEM HASTANESI', 'ISTANBUL', 'Y');
INSERT INTO Hastaneler VALUES ('H102', 'HASZEKI HASTANESI', 'ISTANBUL', 'N');
INSERT INTO Hastaneler VALUES ('H103', 'MEDIKOL HASTANESI', 'IZMIR', 'Y');
INSERT INTO Hastaneler VALUES ('H104', 'NEMORYIL HASTANESI', 'ANKARA', 'Y');
CREATE TABLE Hastalar 
(
    kimlik_no char(11) primary key,
    isim varchar(30), 
    teshis varchar(50)
);
INSERT INTO Hastalar VALUES ('12345678901', 'Ali Can', 'Gizli Seker');
INSERT INTO Hastalar VALUES ('45678901121', 'Ayse Yilmaz', 'Hipertansyon');
INSERT INTO Hastalar VALUES ('78901123451','Steve Job','Pankreatit');
INSERT INTO Hastalar VALUES ('12344321251','Tom Hanks','COVID 19');
CREATE TABLE Bolumler_tablosu 
(
    bolum_id CHAR(5) primary key,
    bolum_adi VARCHAR(50)
);
INSERT INTO bolumler_tablosu VALUES ('DHL','Dahiliye');
INSERT INTO bolumler_tablosu VALUES ('KBB','Kulak-Burun-Bogaz');
INSERT INTO bolumler_tablosu VALUES ('NRJ','Noroloji');
INSERT INTO bolumler_tablosu VALUES ('GAST','Gastroloji');
INSERT INTO bolumler_tablosu VALUES ('KARD','Kardioloji');
INSERT INTO bolumler_tablosu VALUES ('PSK','Psikiyatri');
INSERT INTO bolumler_tablosu VALUES ('GOZ','Goz Hastaliklari');
CREATE TABLE Hasta_kayitlar
(
kimlik_no char(11) primary key,
hasta_isim varchar(30),
hastane_adi varchar(50),
bolum_adi varchar(50),
teshis varchar(50)
);
INSERT INTO hasta_kayitlar VALUES ('1111','NONAME','NULL','NULL','NULL');
INSERT INTO hasta_kayitlar VALUES ('2222','NONAME','NULL','NULL','NULL');
INSERT INTO hasta_kayitlar VALUES ('3333','NONAME','NULL','NULL','NULL');

-- 1.soru
update hasta_kayitlar
set hasta_isim='Salvador Dali',
 hastane_adi='John Hopins', bolum_adi='Nuroloji',
 teshis='Parkinson', kimlik_no='99991111222' 
where kimlik_no='3333';
select * from hasta_kayitlar;

-- 2.soru
update hasta_kayitlar
set hasta_isim=(select isim from hastalar where isim='Ali Can'),
hastane_adi=(select isim from Hastaneler where id='H104'),
bolum_adi=(select bolum_id from Bolumler_tablosu where adi='DHL'),
teshis=(select teshis from hastalar where isim='Ali Can'),
kimlik_no=(select kimlik_no from hastalar where isim='Ali Can')
where kimlik_no='1111';
-- 3.soru
update hasta_kayitlar 
set hasta_isim=(select isim from hastalar where isim='Ayse Yilmaz'), 
hastane_adi=(select isim from hastaneler where id='H103'), 
bolum_adi=(select bolum_adi from bolumler_tablosu where bolum_adi='KBB'),
teshis=(select teshis from hastalar where isim='Tom Hanks'), 
kimlik_no= (select kimlik_no from hastalar where isim='Steve Job')
where kimlik_no='2222';
select*from hasta_kayitlar;
