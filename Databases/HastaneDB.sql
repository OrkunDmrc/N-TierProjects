USE [HastaneDB]
GO
/****** Object:  Table [dbo].[Bolumler]    Script Date: 24.05.2022 14:33:47 ******/
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
/****** Object:  Table [dbo].[Doktorlar]    Script Date: 24.05.2022 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doktorlar](
	[DoktorId] [int] IDENTITY(1,1) NOT NULL,
	[BolumId] [int] NOT NULL,
	[DoktorAdi] [nvarchar](50) NOT NULL,
	[DoktorSoyadi] [nvarchar](50) NOT NULL,
	[DoktorDogumTarihi] [date] NOT NULL,
	[DoktorAdresi] [nvarchar](50) NOT NULL,
	[DoktorTel] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Doktorlar] PRIMARY KEY CLUSTERED 
(
	[DoktorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hastalar]    Script Date: 24.05.2022 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hastalar](
	[HastaId] [int] IDENTITY(1,1) NOT NULL,
	[HastaTC] [nvarchar](50) NOT NULL,
	[HastaAdi] [nvarchar](50) NOT NULL,
	[HastaSoyadi] [nvarchar](50) NOT NULL,
	[HastaDogumTarihi] [date] NOT NULL,
	[HastaAdresi] [nvarchar](50) NOT NULL,
	[HastaTel] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Hastalar] PRIMARY KEY CLUSTERED 
(
	[HastaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hemsireler]    Script Date: 24.05.2022 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hemsireler](
	[HemsireId] [int] IDENTITY(1,1) NOT NULL,
	[BolumId] [int] NOT NULL,
	[HemsireAdi] [nvarchar](50) NOT NULL,
	[HemsireSoyadi] [nvarchar](50) NOT NULL,
	[HemsireDogumTarihi] [date] NOT NULL,
	[HemsireAdresi] [nvarchar](50) NOT NULL,
	[HemsireTel] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Hemsireler] PRIMARY KEY CLUSTERED 
(
	[HemsireId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdariPersonel]    Script Date: 24.05.2022 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdariPersonel](
	[IdariPersonelId] [int] IDENTITY(1,1) NOT NULL,
	[IdariPersonelAdi] [nvarchar](50) NOT NULL,
	[IdariPersonelSoyadi] [nvarchar](50) NOT NULL,
	[IdariPersonelDogumTarihi] [date] NOT NULL,
	[IdariPersonelAdresi] [nvarchar](50) NOT NULL,
	[IdariPersonelTel] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_IdariPersonel] PRIMARY KEY CLUSTERED 
(
	[IdariPersonelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IdariPersonellerDoktorlar]    Script Date: 24.05.2022 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdariPersonellerDoktorlar](
	[IdariPersonelId] [int] NOT NULL,
	[DoktorId] [int] NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_IdariPersonellerDoktorlar] PRIMARY KEY CLUSTERED 
(
	[IdariPersonelId] ASC,
	[DoktorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Muayeneler]    Script Date: 24.05.2022 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Muayeneler](
	[MuayeneId] [int] IDENTITY(1,1) NOT NULL,
	[HastaId] [int] NOT NULL,
	[DoktorId] [int] NOT NULL,
	[MuayeneTarihi] [date] NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Muayeneler] PRIMARY KEY CLUSTERED 
(
	[MuayeneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personeller]    Script Date: 24.05.2022 14:33:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personeller](
	[PersonelId] [int] IDENTITY(1,1) NOT NULL,
	[BolumId] [int] NOT NULL,
	[PersonelAdi] [nvarchar](50) NOT NULL,
	[PersonelSoyadi] [nvarchar](50) NOT NULL,
	[PersonelDogumTarihi] [date] NOT NULL,
	[PersonelAdresi] [nvarchar](50) NOT NULL,
	[PersonelTel] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Personeller] PRIMARY KEY CLUSTERED 
(
	[PersonelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bolumler] ON 

INSERT [dbo].[Bolumler] ([BolumId], [BolumAdi], [Durum]) VALUES (1, N'Dahiliye', 1)
INSERT [dbo].[Bolumler] ([BolumId], [BolumAdi], [Durum]) VALUES (2, N'Kulak Burun Bogaz', 1)
INSERT [dbo].[Bolumler] ([BolumId], [BolumAdi], [Durum]) VALUES (3, N'Göz Hastalıkları', 1)
SET IDENTITY_INSERT [dbo].[Bolumler] OFF
GO
SET IDENTITY_INSERT [dbo].[Doktorlar] ON 

INSERT [dbo].[Doktorlar] ([DoktorId], [BolumId], [DoktorAdi], [DoktorSoyadi], [DoktorDogumTarihi], [DoktorAdresi], [DoktorTel], [Durum]) VALUES (1, 1, N'Adem', N'Ayik', CAST(N'1986-06-01' AS Date), N'Adres', N'0555 555 5553', 1)
INSERT [dbo].[Doktorlar] ([DoktorId], [BolumId], [DoktorAdi], [DoktorSoyadi], [DoktorDogumTarihi], [DoktorAdresi], [DoktorTel], [Durum]) VALUES (2, 2, N'Omer', N'Yilmaz', CAST(N'1990-05-01' AS Date), N'Adres', N'0555 555 5553', 1)
INSERT [dbo].[Doktorlar] ([DoktorId], [BolumId], [DoktorAdi], [DoktorSoyadi], [DoktorDogumTarihi], [DoktorAdresi], [DoktorTel], [Durum]) VALUES (3, 3, N'Hafize', N'Kazan', CAST(N'1996-07-01' AS Date), N'Adres', N'0555 555 5553', 1)
SET IDENTITY_INSERT [dbo].[Doktorlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hastalar] ON 

INSERT [dbo].[Hastalar] ([HastaId], [HastaTC], [HastaAdi], [HastaSoyadi], [HastaDogumTarihi], [HastaAdresi], [HastaTel], [Durum]) VALUES (1, N'1111111111111', N'Tugba', N'Aydogdu', CAST(N'1965-06-01' AS Date), N'Adres', N'0555 555 5551', 1)
INSERT [dbo].[Hastalar] ([HastaId], [HastaTC], [HastaAdi], [HastaSoyadi], [HastaDogumTarihi], [HastaAdresi], [HastaTel], [Durum]) VALUES (2, N'1111111111112', N'Tugce', N'Bostanci', CAST(N'1968-05-01' AS Date), N'Adres', N'0555 555 5551', 1)
INSERT [dbo].[Hastalar] ([HastaId], [HastaTC], [HastaAdi], [HastaSoyadi], [HastaDogumTarihi], [HastaAdresi], [HastaTel], [Durum]) VALUES (3, N'1111111111113', N'Firat', N'Kusuni', CAST(N'1966-07-01' AS Date), N'Adres', N'0555 555 5551', 1)
INSERT [dbo].[Hastalar] ([HastaId], [HastaTC], [HastaAdi], [HastaSoyadi], [HastaDogumTarihi], [HastaAdresi], [HastaTel], [Durum]) VALUES (4, N'1111111111114', N'Furkan', N'Nacar', CAST(N'1965-06-01' AS Date), N'Adres', N'0555 555 5551', 1)
INSERT [dbo].[Hastalar] ([HastaId], [HastaTC], [HastaAdi], [HastaSoyadi], [HastaDogumTarihi], [HastaAdresi], [HastaTel], [Durum]) VALUES (5, N'1111111111115', N'Betul', N'Nacar', CAST(N'1968-05-01' AS Date), N'Adres', N'0555 555 5551', 1)
INSERT [dbo].[Hastalar] ([HastaId], [HastaTC], [HastaAdi], [HastaSoyadi], [HastaDogumTarihi], [HastaAdresi], [HastaTel], [Durum]) VALUES (6, N'1111111111116', N'Ozgur', N'Medeniye', CAST(N'1966-07-01' AS Date), N'Adres', N'0555 555 5551', 1)
SET IDENTITY_INSERT [dbo].[Hastalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Hemsireler] ON 

INSERT [dbo].[Hemsireler] ([HemsireId], [BolumId], [HemsireAdi], [HemsireSoyadi], [HemsireDogumTarihi], [HemsireAdresi], [HemsireTel], [Durum]) VALUES (1, 1, N'Melda', N'Tanisman', CAST(N'1996-06-01' AS Date), N'Adres', N'0555 555 5554', 1)
INSERT [dbo].[Hemsireler] ([HemsireId], [BolumId], [HemsireAdi], [HemsireSoyadi], [HemsireDogumTarihi], [HemsireAdresi], [HemsireTel], [Durum]) VALUES (2, 2, N'Gulperi', N'Pekin', CAST(N'1996-05-01' AS Date), N'Adres', N'0555 555 5554', 1)
INSERT [dbo].[Hemsireler] ([HemsireId], [BolumId], [HemsireAdi], [HemsireSoyadi], [HemsireDogumTarihi], [HemsireAdresi], [HemsireTel], [Durum]) VALUES (3, 3, N'Ebru', N'Cuval', CAST(N'1995-07-01' AS Date), N'Adres', N'0555 555 5554', 1)
SET IDENTITY_INSERT [dbo].[Hemsireler] OFF
GO
SET IDENTITY_INSERT [dbo].[IdariPersonel] ON 

INSERT [dbo].[IdariPersonel] ([IdariPersonelId], [IdariPersonelAdi], [IdariPersonelSoyadi], [IdariPersonelDogumTarihi], [IdariPersonelAdresi], [IdariPersonelTel], [Durum]) VALUES (1, N'Berkay', N'Capraz', CAST(N'1976-06-01' AS Date), N'Adres', N'0555 555 5552', 1)
INSERT [dbo].[IdariPersonel] ([IdariPersonelId], [IdariPersonelAdi], [IdariPersonelSoyadi], [IdariPersonelDogumTarihi], [IdariPersonelAdresi], [IdariPersonelTel], [Durum]) VALUES (2, N'Omer', N'Yilmaz', CAST(N'1990-05-01' AS Date), N'Adres', N'0555 555 5553', 1)
SET IDENTITY_INSERT [dbo].[IdariPersonel] OFF
GO
SET IDENTITY_INSERT [dbo].[Muayeneler] ON 

INSERT [dbo].[Muayeneler] ([MuayeneId], [HastaId], [DoktorId], [MuayeneTarihi], [Durum]) VALUES (1, 1, 1, CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Muayeneler] ([MuayeneId], [HastaId], [DoktorId], [MuayeneTarihi], [Durum]) VALUES (2, 2, 2, CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Muayeneler] ([MuayeneId], [HastaId], [DoktorId], [MuayeneTarihi], [Durum]) VALUES (3, 3, 3, CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Muayeneler] ([MuayeneId], [HastaId], [DoktorId], [MuayeneTarihi], [Durum]) VALUES (4, 4, 1, CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Muayeneler] ([MuayeneId], [HastaId], [DoktorId], [MuayeneTarihi], [Durum]) VALUES (5, 5, 2, CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Muayeneler] ([MuayeneId], [HastaId], [DoktorId], [MuayeneTarihi], [Durum]) VALUES (6, 6, 3, CAST(N'2020-01-01' AS Date), 1)
INSERT [dbo].[Muayeneler] ([MuayeneId], [HastaId], [DoktorId], [MuayeneTarihi], [Durum]) VALUES (7, 1, 2, CAST(N'2022-05-24' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Muayeneler] OFF
GO
SET IDENTITY_INSERT [dbo].[Personeller] ON 

INSERT [dbo].[Personeller] ([PersonelId], [BolumId], [PersonelAdi], [PersonelSoyadi], [PersonelDogumTarihi], [PersonelAdresi], [PersonelTel], [Durum]) VALUES (1, 1, N'Huseyin', N'Capraz', CAST(N'1990-01-01' AS Date), N'Adres', N'0555 555 5555', 1)
INSERT [dbo].[Personeller] ([PersonelId], [BolumId], [PersonelAdi], [PersonelSoyadi], [PersonelDogumTarihi], [PersonelAdresi], [PersonelTel], [Durum]) VALUES (2, 2, N'Hasan', N'Capraz', CAST(N'1995-01-01' AS Date), N'Adres', N'0555 555 5555', 1)
INSERT [dbo].[Personeller] ([PersonelId], [BolumId], [PersonelAdi], [PersonelSoyadi], [PersonelDogumTarihi], [PersonelAdresi], [PersonelTel], [Durum]) VALUES (3, 3, N'Hayri', N'Capraz', CAST(N'1993-01-01' AS Date), N'Adres', N'0555 555 5555', 1)
SET IDENTITY_INSERT [dbo].[Personeller] OFF
GO
ALTER TABLE [dbo].[Bolumler] ADD  CONSTRAINT [DF_Bolumler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Doktorlar] ADD  CONSTRAINT [DF_Doktorlar_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Hastalar] ADD  CONSTRAINT [DF_Hastalar_HastaTC]  DEFAULT ((1111111111111.)) FOR [HastaTC]
GO
ALTER TABLE [dbo].[Hastalar] ADD  CONSTRAINT [DF_Hastalar_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Hemsireler] ADD  CONSTRAINT [DF_Hemsireler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[IdariPersonel] ADD  CONSTRAINT [DF_IdariPersonel_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[IdariPersonellerDoktorlar] ADD  CONSTRAINT [DF_IdariPersonellerDoktorlar_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Muayeneler] ADD  CONSTRAINT [DF_Muayeneler_MuayeneTarihi]  DEFAULT (getdate()) FOR [MuayeneTarihi]
GO
ALTER TABLE [dbo].[Muayeneler] ADD  CONSTRAINT [DF_Muayeneler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Personeller] ADD  CONSTRAINT [DF_Personeller_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Doktorlar]  WITH CHECK ADD  CONSTRAINT [FK_Doktorlar_Bolumler] FOREIGN KEY([BolumId])
REFERENCES [dbo].[Bolumler] ([BolumId])
GO
ALTER TABLE [dbo].[Doktorlar] CHECK CONSTRAINT [FK_Doktorlar_Bolumler]
GO
ALTER TABLE [dbo].[Hemsireler]  WITH CHECK ADD  CONSTRAINT [FK_Hemsireler_Bolumler] FOREIGN KEY([BolumId])
REFERENCES [dbo].[Bolumler] ([BolumId])
GO
ALTER TABLE [dbo].[Hemsireler] CHECK CONSTRAINT [FK_Hemsireler_Bolumler]
GO
ALTER TABLE [dbo].[IdariPersonellerDoktorlar]  WITH CHECK ADD  CONSTRAINT [FK_IdariPersonellerDoktorlar_Doktorlar] FOREIGN KEY([DoktorId])
REFERENCES [dbo].[Doktorlar] ([DoktorId])
GO
ALTER TABLE [dbo].[IdariPersonellerDoktorlar] CHECK CONSTRAINT [FK_IdariPersonellerDoktorlar_Doktorlar]
GO
ALTER TABLE [dbo].[IdariPersonellerDoktorlar]  WITH CHECK ADD  CONSTRAINT [FK_IdariPersonellerDoktorlar_IdariPersonel] FOREIGN KEY([IdariPersonelId])
REFERENCES [dbo].[IdariPersonel] ([IdariPersonelId])
GO
ALTER TABLE [dbo].[IdariPersonellerDoktorlar] CHECK CONSTRAINT [FK_IdariPersonellerDoktorlar_IdariPersonel]
GO
ALTER TABLE [dbo].[Muayeneler]  WITH CHECK ADD  CONSTRAINT [FK_Muayeneler_Doktorlar] FOREIGN KEY([DoktorId])
REFERENCES [dbo].[Doktorlar] ([DoktorId])
GO
ALTER TABLE [dbo].[Muayeneler] CHECK CONSTRAINT [FK_Muayeneler_Doktorlar]
GO
ALTER TABLE [dbo].[Muayeneler]  WITH CHECK ADD  CONSTRAINT [FK_Muayeneler_Hastalar] FOREIGN KEY([HastaId])
REFERENCES [dbo].[Hastalar] ([HastaId])
GO
ALTER TABLE [dbo].[Muayeneler] CHECK CONSTRAINT [FK_Muayeneler_Hastalar]
GO
ALTER TABLE [dbo].[Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Personeller_Bolumler] FOREIGN KEY([BolumId])
REFERENCES [dbo].[Bolumler] ([BolumId])
GO
ALTER TABLE [dbo].[Personeller] CHECK CONSTRAINT [FK_Personeller_Bolumler]
GO
