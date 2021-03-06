USE [mavi]
GO
/****** Object:  StoredProcedure [dbo].[satisBilgiEkrani]    Script Date: 10.12.2015 09:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[satisBilgiEkrani] 

@barkod int

AS 

BEGIN

select ur.uAdi,ur.uKisaAciklama,sep.adet, ur.uFiyat,se.sBaslik,be.bBaslik,re.rAdi,st.kalanAdet ,sep.durum ,sep.tarih from urunler ur 
inner join sezonlar se on ur.sezonID=se.sezonID
inner join bedenler be on be.bedenID=ur.bedenID
inner join renkler re on ur.renkID=re.renkID
inner join sepet sep on sep.urunID=ur.urunID
inner join stoklar st on st.urunID=ur.urunID
where ur.barkodNo=@barkod
 
END
GO
