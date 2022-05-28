--KULLANICI GÝRÝÞÝ STORE PROCEDURE'U
CREATE PROCEDURE sp_KullaniciGiris
@id varchar(30),@pw varchar(30)
AS
BEGIN
SELECT * FROM Kullanicilar
WHERE KullaniciAdi=@id AND Sifre=@pw
END

--KULLANICI KAYDI STORE PROCEDURE'Ü
CREATE PROCEDURE sp_KullaniciKayit
@id varchar(30),@pw varchar(30)
AS
BEGIN
INSERT INTO Kullanicilar (KullaniciAdi,Sifre)
VALUES(@id,@pw)
END

--KÝTAP EKLEME PROSEDURU
CREATE PROCEDURE sp_KitapEkle
@pKitapAdi varchar(50),@pYazar varchar(50),@pSayfaSayisi int,@pKitapTuru varchar(20)
AS
BEGIN
INSERT INTO Kitaplar(KitapAdi,KitapYazari,SayfaSayisi,KitapTuru)
VALUES(@pKitapAdi,@pYazar,@pSayfaSayisi,@pKitapTuru)
END

--KÝTAP SÝLME PROSEDURU
CREATE PROCEDURE sp_KitapSil
@id int
AS
BEGIN
DELETE FROM Kitaplar WHERE @id=id
END

--KÝTAP GÜNCELLEME PROSEDURU
CREATE PROCEDURE sp_Guncelleme
@id int,@pKitapAdi varchar(50),@pYazar varchar(50),@pSayfaSayisi int,@pKitapTuru varchar(20)
AS
BEGIN
UPDATE Kitaplar 
SET KitapAdi=@pKitapAdi,KitapYazari=@pYazar,SayfaSayisi=@pSayfaSayisi,KitapTuru=@pKitapTuru
WHERE id=@id
END

--KÝTAP LÝSTELEME PROSEDURU
CREATE PROCEDURE sp_Listeleme
AS
BEGIN
SELECT * FROM Kitaplar
END

--KÝTAP ARAMA PROSEDÜRÜ
CREATE PROCEDURE sp_KitapAra
@pKitapAdi varchar (50)
AS
BEGIN
SELECT * FROM Kitaplar 
WHERE KitapAdi LIKE '%'+@pKitapAdi+'%'
END