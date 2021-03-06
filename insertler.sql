USE [mavi]
GO
/****** Object:  StoredProcedure [dbo].[insertSatis]    Script Date: 12/10/2015 2:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertSatis]
	@ref varchar(100),
	@perID int ,
	@fiyat money,
	@odemeTipi tinyint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
insert into satis values(@ref,@perID,@fiyat,@odemeTipi,GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[insertSepet]    Script Date: 12/10/2015 2:03:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[insertSepet]
	@RefKod varchar(50),
	@PerID int,
	@barkod varchar(100)



AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   INSERT INTO [dbo].[sepet]
           ([refKodu]
           ,[personelID]
           ,[urunID]
           ,[urunFiyat]
           ,[adet]
           ,[durum]
           ,[tarih])
     VALUES
          ( @RefKod,@PerID,(select urunID from urunler where barkodNo=@barkod)
          
          
           ,(select uFiyat from urunler where barkodNo=@barkod)
           ,1
           ,0
           ,GETDATE())
END

GO
