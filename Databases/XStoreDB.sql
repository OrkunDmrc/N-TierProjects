USE [XStoreDB]
GO
/****** Object:  Table [dbo].[Markalar]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Markalar](
	[MarkaId] [int] IDENTITY(1,1) NOT NULL,
	[MarkaAdi] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Markalar] PRIMARY KEY CLUSTERED 
(
	[MarkaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tedarikciler]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedarikciler](
	[TedarikciId] [int] IDENTITY(1,1) NOT NULL,
	[TedarikciAdi] [nvarchar](50) NOT NULL,
	[TedarikciAciklamasi] [nvarchar](100) NOT NULL,
	[TedarikciTel] [nvarchar](50) NOT NULL,
	[TedarikciAdres] [nvarchar](100) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Tedarikciler] PRIMARY KEY CLUSTERED 
(
	[TedarikciId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[TedarikciId] [int] NOT NULL,
	[MarkaId] [int] NOT NULL,
	[UrunAdi] [nvarchar](50) NOT NULL,
	[UrunAciklamasi] [nvarchar](100) NOT NULL,
	[UrunBirimFiyati] [decimal](14, 2) NOT NULL,
	[StockAdeti] [int] NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Urunler] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[UrunleriGoster]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[UrunleriGoster] as
select u.UrunId,t.TedarikciAdi, m.MarkaAdi, UrunAdi,UrunAciklamasi,UrunBirimFiyati,StockAdeti from Urunler u
join Tedarikciler t on u.TedarikciId = t.TedarikciId
join Markalar m on u.MarkaId = m.MarkaId
group by u.UrunId, t.TedarikciAdi, m.MarkaAdi, UrunAdi,UrunAciklamasi,UrunBirimFiyati,StockAdeti
GO
/****** Object:  Table [dbo].[Bolumler]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolumler](
	[BolumId] [int] IDENTITY(1,1) NOT NULL,
	[BolumAdi] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Bolumler] PRIMARY KEY CLUSTERED 
(
	[BolumId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[PersonelId] [int] IDENTITY(1,1) NOT NULL,
	[BolumId] [int] NOT NULL,
	[PersonelAdi] [nvarchar](50) NOT NULL,
	[PersonelSoyadi] [nvarchar](50) NOT NULL,
	[PersonelTel] [nvarchar](50) NOT NULL,
	[PersonelAdresi] [nvarchar](100) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[PersonelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[PersonelleriGoster]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[PersonelleriGoster] as
select p.PersonelId, b.BolumAdi,p.PersonelAdi,p.PersonelSoyadi,p.PersonelTel,p.PersonelAdresi from Personeller p
join Bolumler b on b.BolumId = p.BolumId
group by p.PersonelId,b.BolumAdi,p.PersonelAdi,p.PersonelSoyadi,p.PersonelTel,p.PersonelAdresi
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriId] [int] IDENTITY(1,1) NOT NULL,
	[MusteriAdi] [nvarchar](50) NOT NULL,
	[MusteriSoyadi] [nvarchar](50) NOT NULL,
	[MusteriPuani] [int] NOT NULL,
	[MusteriTel] [nvarchar](50) NOT NULL,
	[MusteriAdresi] [nvarchar](100) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisId] [int] IDENTITY(1,1) NOT NULL,
	[MusteriId] [int] NOT NULL,
	[SiparisTarihi] [date] NOT NULL,
	[SiparisAdresi] [nvarchar](100) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Siparisler] PRIMARY KEY CLUSTERED 
(
	[SiparisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SiparisleriGoster]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[SiparisleriGoster] as
select s.SiparisId,m.MusteriAdi, m.MusteriSoyadi, s.SiparisTarihi,s.SiparisAdresi from Siparisler s
join Musteriler m on s.MusteriId=m.MusteriId
group by s.SiparisId, m.MusteriAdi, m.MusteriSoyadi, s.SiparisTarihi,s.SiparisAdresi
GO
/****** Object:  Table [dbo].[SiparisDetaylari]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiparisDetaylari](
	[SiparisId] [int] NOT NULL,
	[UrunId] [int] NOT NULL,
	[SiparisEdilenUrunAdeti] [int] NOT NULL,
 CONSTRAINT [PK_SiparisDetaylari] PRIMARY KEY CLUSTERED 
(
	[SiparisId] ASC,
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SiparisleriDetayliGoster]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[SiparisleriDetayliGoster] as
select s.SiparisId, m.MusteriAdi, m.MusteriSoyadi, s.SiparisTarihi,s.SiparisAdresi,u.UrunAdi,u.UrunBirimFiyati,sd.SiparisEdilenUrunAdeti from Siparisler s
join SiparisDetaylari sd on sd.SiparisId=s.SiparisId
join Urunler u on sd.UrunId = u.UrunId
join Musteriler m on m.MusteriId = s.MusteriId
group by s.SiparisId, m.MusteriAdi, m.MusteriSoyadi, s.SiparisTarihi,s.SiparisAdresi,u.UrunAdi,u.UrunBirimFiyati,SiparisEdilenUrunAdeti
GO
SET IDENTITY_INSERT [dbo].[Bolumler] ON 

INSERT [dbo].[Bolumler] ([BolumId], [BolumAdi], [Durum]) VALUES (1, N'Yonetim', 1)
INSERT [dbo].[Bolumler] ([BolumId], [BolumAdi], [Durum]) VALUES (2, N'Pazarlama', 1)
INSERT [dbo].[Bolumler] ([BolumId], [BolumAdi], [Durum]) VALUES (3, N'Satin Alma', 1)
SET IDENTITY_INSERT [dbo].[Bolumler] OFF
GO
SET IDENTITY_INSERT [dbo].[Markalar] ON 

INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Durum]) VALUES (1, N'Lenovo', 1)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Durum]) VALUES (2, N'Puma', 1)
INSERT [dbo].[Markalar] ([MarkaId], [MarkaAdi], [Durum]) VALUES (3, N'Sutas', 1)
SET IDENTITY_INSERT [dbo].[Markalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriId], [MusteriAdi], [MusteriSoyadi], [MusteriPuani], [MusteriTel], [MusteriAdresi], [Durum]) VALUES (1, N'Abdullah', N'Kilicarslan', 100, N'0555 333 3333', N'Adres', 1)
INSERT [dbo].[Musteriler] ([MusteriId], [MusteriAdi], [MusteriSoyadi], [MusteriPuani], [MusteriTel], [MusteriAdresi], [Durum]) VALUES (2, N'Zeynep', N'Dincer', 100, N'0555 333 3333', N'Adres', 1)
INSERT [dbo].[Musteriler] ([MusteriId], [MusteriAdi], [MusteriSoyadi], [MusteriPuani], [MusteriTel], [MusteriAdresi], [Durum]) VALUES (3, N'Eda', N'Bicer', 100, N'0555 333 3333', N'Adres', 1)
INSERT [dbo].[Musteriler] ([MusteriId], [MusteriAdi], [MusteriSoyadi], [MusteriPuani], [MusteriTel], [MusteriAdresi], [Durum]) VALUES (4, N'Seda', N'Bicer', 100, N'0555 333 3333', N'Adres', 1)
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([PersonelId], [BolumId], [PersonelAdi], [PersonelSoyadi], [PersonelTel], [PersonelAdresi], [Durum]) VALUES (1, 1, N'Huseyin', N'Okutan', N'0555 555 5555', N'Adres', 1)
INSERT [dbo].[Personeller] ([PersonelId], [BolumId], [PersonelAdi], [PersonelSoyadi], [PersonelTel], [PersonelAdresi], [Durum]) VALUES (2, 2, N'Cemalettin', N'Okutan', N'0555 555 5555', N'Adres', 1)
INSERT [dbo].[Personeller] ([PersonelId], [BolumId], [PersonelAdi], [PersonelSoyadi], [PersonelTel], [PersonelAdresi], [Durum]) VALUES (3, 3, N'Senol', N'Okutan', N'0555 555 5555', N'Adres', 1)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
GO
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (1, 1, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (1, 2, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (2, 3, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (2, 4, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (3, 5, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (3, 6, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (4, 2, 5)
INSERT [dbo].[SiparisDetaylari] ([SiparisId], [UrunId], [SiparisEdilenUrunAdeti]) VALUES (4, 4, 5)
GO
SET IDENTITY_INSERT [dbo].[Siparisler] ON 

INSERT [dbo].[Siparisler] ([SiparisId], [MusteriId], [SiparisTarihi], [SiparisAdresi], [Durum]) VALUES (1, 1, CAST(N'2020-01-01' AS Date), N'Adres', 1)
INSERT [dbo].[Siparisler] ([SiparisId], [MusteriId], [SiparisTarihi], [SiparisAdresi], [Durum]) VALUES (2, 2, CAST(N'2020-01-01' AS Date), N'Adres', 1)
INSERT [dbo].[Siparisler] ([SiparisId], [MusteriId], [SiparisTarihi], [SiparisAdresi], [Durum]) VALUES (3, 3, CAST(N'2020-01-01' AS Date), N'Adres', 1)
INSERT [dbo].[Siparisler] ([SiparisId], [MusteriId], [SiparisTarihi], [SiparisAdresi], [Durum]) VALUES (4, 4, CAST(N'2020-01-01' AS Date), N'Adres', 1)
SET IDENTITY_INSERT [dbo].[Siparisler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tedarikciler] ON 

INSERT [dbo].[Tedarikciler] ([TedarikciId], [TedarikciAdi], [TedarikciAciklamasi], [TedarikciTel], [TedarikciAdres], [Durum]) VALUES (1, N'Zor Pazarlama A.S.', N'Elektronik', N'0555 444 4444', N'Adres', 1)
INSERT [dbo].[Tedarikciler] ([TedarikciId], [TedarikciAdi], [TedarikciAciklamasi], [TedarikciTel], [TedarikciAdres], [Durum]) VALUES (2, N'Cok Zor Pazarlama A.S.', N'Giyim', N'0555 444 4444', N'Adres', 1)
INSERT [dbo].[Tedarikciler] ([TedarikciId], [TedarikciAdi], [TedarikciAciklamasi], [TedarikciTel], [TedarikciAdres], [Durum]) VALUES (3, N'Hayal Pazarlama A.S.', N'Gida', N'0555 444 4444', N'Adres', 1)
SET IDENTITY_INSERT [dbo].[Tedarikciler] OFF
GO
SET IDENTITY_INSERT [dbo].[Urunler] ON 

INSERT [dbo].[Urunler] ([UrunId], [TedarikciId], [MarkaId], [UrunAdi], [UrunAciklamasi], [UrunBirimFiyati], [StockAdeti], [Durum]) VALUES (1, 1, 1, N'L10', N'Leptop', CAST(5000.00 AS Decimal(14, 2)), 10, 1)
INSERT [dbo].[Urunler] ([UrunId], [TedarikciId], [MarkaId], [UrunAdi], [UrunAciklamasi], [UrunBirimFiyati], [StockAdeti], [Durum]) VALUES (2, 1, 1, N'LT10', N'Tablet', CAST(1000.00 AS Decimal(14, 2)), 5, 1)
INSERT [dbo].[Urunler] ([UrunId], [TedarikciId], [MarkaId], [UrunAdi], [UrunAciklamasi], [UrunBirimFiyati], [StockAdeti], [Durum]) VALUES (3, 2, 2, N'P10', N'Ayakkabi', CAST(500.00 AS Decimal(14, 2)), 10, 1)
INSERT [dbo].[Urunler] ([UrunId], [TedarikciId], [MarkaId], [UrunAdi], [UrunAciklamasi], [UrunBirimFiyati], [StockAdeti], [Durum]) VALUES (4, 2, 2, N'PT6', N'T-Shirt', CAST(100.00 AS Decimal(14, 2)), 10, 1)
INSERT [dbo].[Urunler] ([UrunId], [TedarikciId], [MarkaId], [UrunAdi], [UrunAciklamasi], [UrunBirimFiyati], [StockAdeti], [Durum]) VALUES (5, 3, 3, N'Peynir', N'1000g', CAST(50.00 AS Decimal(14, 2)), 5, 1)
INSERT [dbo].[Urunler] ([UrunId], [TedarikciId], [MarkaId], [UrunAdi], [UrunAciklamasi], [UrunBirimFiyati], [StockAdeti], [Durum]) VALUES (6, 3, 3, N'Sut', N'1000g', CAST(25.00 AS Decimal(14, 2)), 10, 1)
SET IDENTITY_INSERT [dbo].[Urunler] OFF
GO
ALTER TABLE [dbo].[Bolumler] ADD  CONSTRAINT [DF_Bolumler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Markalar] ADD  CONSTRAINT [DF_Markalar_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Musteriler] ADD  CONSTRAINT [DF_Musteriler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [DF_Personeller_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Siparisler] ADD  CONSTRAINT [DF_Siparisler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Tedarikciler] ADD  CONSTRAINT [DF_Tedarikciler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Urunler] ADD  CONSTRAINT [DF_Urunler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Bolumler] FOREIGN KEY([BolumId])
REFERENCES [dbo].[Bolumler] ([BolumId])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Bolumler]
GO
ALTER TABLE [dbo].[SiparisDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetaylari_Siparisler] FOREIGN KEY([SiparisId])
REFERENCES [dbo].[Siparisler] ([SiparisId])
GO
ALTER TABLE [dbo].[SiparisDetaylari] CHECK CONSTRAINT [FK_SiparisDetaylari_Siparisler]
GO
ALTER TABLE [dbo].[SiparisDetaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisDetaylari_Urunler] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urunler] ([UrunId])
GO
ALTER TABLE [dbo].[SiparisDetaylari] CHECK CONSTRAINT [FK_SiparisDetaylari_Urunler]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Musteriler] FOREIGN KEY([MusteriId])
REFERENCES [dbo].[Musteriler] ([MusteriId])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Musteriler]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Markalar] FOREIGN KEY([MarkaId])
REFERENCES [dbo].[Markalar] ([MarkaId])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Markalar]
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Urunler_Tedarikciler] FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[Tedarikciler] ([TedarikciId])
GO
ALTER TABLE [dbo].[Urunler] CHECK CONSTRAINT [FK_Urunler_Tedarikciler]
GO
/****** Object:  StoredProcedure [dbo].[BolumEkle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BolumEkle]
(
@Adi nvarchar(50)
)
as
begin
insert Bolumler (BolumAdi) values (@Adi)
end
GO
/****** Object:  StoredProcedure [dbo].[MarkaEkle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MarkaEkle]
(
@Adi nvarchar(50)
)
as
begin
insert Markalar (MarkaAdi) values (@Adi)
end
GO
/****** Object:  StoredProcedure [dbo].[MusteriEkle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MusteriEkle]
(
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tel nvarchar(50),
@Adress nvarchar(50)
)
as
begin
insert Musteriler (MusteriAdi,MusteriSoyadi,MusteriPuani,MusteriTel,MusteriAdresi) values (@Adi,@Soyadi,100,@Tel,@Adress)
end
GO
/****** Object:  StoredProcedure [dbo].[MusteriGuncelle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MusteriGuncelle]
(
@Id int,
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tel nvarchar(50),
@Adress nvarchar(50)
)
as
begin
update Musteriler set MusteriAdi=@Adi,MusteriSoyadi=@Soyadi,MusteriPuani=100,MusteriTel=@Tel,MusteriAdresi=@Adress where MusteriId=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[PersonelEkle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PersonelEkle]
(
@Bolum int,
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tel nvarchar(50),
@Adress nvarchar(50)
)
as
begin
insert Personeller(BolumId,PersonelAdi,PersonelSoyadi,PersonelTel,PersonelAdresi) values (@Bolum,@Adi,@Soyadi,@Tel,@Adress)
end
GO
/****** Object:  StoredProcedure [dbo].[PersonelGuncelle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PersonelGuncelle]
(
@Id int,
@Bolum int,
@Adi nvarchar(50),
@Soyadi nvarchar(50),
@Tel nvarchar(50),
@Adress nvarchar(50)
)
as
begin
update Personeller set BolumId=@Bolum,PersonelAdi=@Adi,PersonelSoyadi=@Soyadi,PersonelTel=@Tel,PersonelAdresi=@Adress where PersonelId=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[TedarikciEkle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TedarikciEkle]
(
@Adi nvarchar(50),
@Aciklamasi nvarchar(50),
@Tel nvarchar(50),
@Adress nvarchar(50)
)
as
begin
insert Tedarikciler (TedarikciAdi,TedarikciAciklamasi,TedarikciTel,TedarikciAdres) values (@Adi,@Aciklamasi,@Tel,@Adress)
end
GO
/****** Object:  StoredProcedure [dbo].[TedarikciGuncelle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TedarikciGuncelle]
(
@Id int,
@Adi nvarchar(50),
@Aciklamasi nvarchar(50),
@Tel nvarchar(50),
@Adress nvarchar(50)
)
as
begin
update Tedarikciler set TedarikciAdi=@Adi,TedarikciAciklamasi=@Aciklamasi,TedarikciTel=@Tel,TedarikciAdres=@Adress where TedarikciId=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[UrunEkle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UrunEkle]
(
@Tedarikci int,
@Marka int,
@Adi nvarchar(50),
@Aciklamasi nvarchar(50),
@Fiyat decimal(14,2),
@Adet int
)
as
begin
insert Urunler (TedarikciId,MarkaId,UrunAdi,UrunAciklamasi,UrunBirimFiyati,StockAdeti) values (@Tedarikci,@Marka,@Adi,@Aciklamasi,@Fiyat,@Adet)
end
GO
/****** Object:  StoredProcedure [dbo].[UrunGuncelle]    Script Date: 12.05.2022 09:36:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UrunGuncelle]
(
@Id int,
@Tedarikci int,
@Marka int,
@Adi nvarchar(50),
@Aciklamasi nvarchar(50),
@Fiyat decimal(14,2),
@Adet int
)
as
begin
	update Urunler set TedarikciId=@Tedarikci,MarkaId=@Marka,UrunAdi=@Adi,UrunAciklamasi=@Aciklamasi,UrunBirimFiyati=@Fiyat,StockAdeti=@Adet where UrunId=@Id
end
GO
