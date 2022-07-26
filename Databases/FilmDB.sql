USE [FilmDB]
GO
/****** Object:  Table [dbo].[FilmDetay]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FilmDetay](
	[FilmId] [int] NOT NULL,
	[KategoriId] [int] NOT NULL,
	[YapimSirketiId] [int] NOT NULL,
 CONSTRAINT [PK_FilmDetay] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filmler]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filmler](
	[FilmId] [int] IDENTITY(1,1) NOT NULL,
	[FilmAdi] [nvarchar](50) NOT NULL,
	[FilmKapakResmi] [nvarchar](100) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Filmler] PRIMARY KEY CLUSTERED 
(
	[FilmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriId] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YapimSirketleri]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YapimSirketleri](
	[YapimSirketiId] [int] IDENTITY(1,1) NOT NULL,
	[YapimSirketiAdi] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_YapimSirketleri] PRIMARY KEY CLUSTERED 
(
	[YapimSirketiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FilmGoster]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[FilmGoster] as
select f.FilmId,f.FilmAdi,f.FilmKapakResmi,k.KategoriAdi,ys.YapimSirketiAdi from Filmler f
join FilmDetay fd on f.FilmId=fd.FilmId
join YapimSirketleri ys on ys.YapimSirketiId=fd.YapimSirketiId
join Kategoriler k on k.KategoriId=fd.KategoriId
group by f.FilmId,f.FilmAdi,f.FilmKapakResmi,k.KategoriAdi,ys.YapimSirketiAdi
GO
/****** Object:  Table [dbo].[Gorevler]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gorevler](
	[GorevId] [int] IDENTITY(1,1) NOT NULL,
	[GorevAdi] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Gorevler] PRIMARY KEY CLUSTERED 
(
	[GorevId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kisiler]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kisiler](
	[KisiId] [int] IDENTITY(1,1) NOT NULL,
	[KisiAdi] [nvarchar](50) NOT NULL,
	[KisiSoyadi] [nvarchar](50) NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_Kisiler] PRIMARY KEY CLUSTERED 
(
	[KisiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KisilerFilmler]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KisilerFilmler](
	[KisiFilmlerId] [int] IDENTITY(1,1) NOT NULL,
	[FilmId] [int] NOT NULL,
	[KisiId] [int] NOT NULL,
	[GorevId] [int] NOT NULL,
	[Durum] [bit] NOT NULL,
 CONSTRAINT [PK_KisilerFilmler] PRIMARY KEY CLUSTERED 
(
	[KisiFilmlerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FilmDetayGoster]    Script Date: 12.05.2022 08:11:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[FilmDetayGoster] as
select f.FilmId,f.FilmAdi,f.FilmKapakResmi,k.KategoriAdi,ys.YapimSirketiAdi,g.GorevAdi,ki.KisiAdi,ki.KisiSoyadi from Filmler f
join FilmDetay fd on f.FilmId=fd.FilmId
join YapimSirketleri ys on ys.YapimSirketiId=fd.YapimSirketiId
join Kategoriler k on k.KategoriId=fd.KategoriId
join KisilerFilmler kf on kf.FilmId=f.FilmId
join Kisiler ki on kf.KisiId=ki.KisiId
join Gorevler g on g.GorevId=kf.GorevId
group by f.FilmId, f.FilmAdi,f.FilmKapakResmi,k.KategoriAdi,ys.YapimSirketiAdi,g.GorevAdi,ki.KisiAdi,ki.KisiSoyadi
GO
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (1, 2, 3)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (2, 3, 1)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (3, 4, 1)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (4, 2, 4)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (5, 1, 3)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (6, 1, 2)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (7, 3, 4)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (8, 1, 2)
INSERT [dbo].[FilmDetay] ([FilmId], [KategoriId], [YapimSirketiId]) VALUES (9, 2, 4)
GO
SET IDENTITY_INSERT [dbo].[Filmler] ON 

INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (1, N'Terminator', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (2, N'Terminator 2', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (3, N'Terminator 3', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (4, N'Terminator 4', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (5, N'Terminator 5', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (6, N'Star Wars', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (7, N'Star Wars 2', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (8, N'Star Wars 3', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
INSERT [dbo].[Filmler] ([FilmId], [FilmAdi], [FilmKapakResmi], [Durum]) VALUES (9, N'Star Wars 4', N'https://images.mubicdn.net/images/cast_member/46476/cache-157147-1466989476/image-w856.jpg?size=800x', 1)
SET IDENTITY_INSERT [dbo].[Filmler] OFF
GO
SET IDENTITY_INSERT [dbo].[Gorevler] ON 

INSERT [dbo].[Gorevler] ([GorevId], [GorevAdi], [Durum]) VALUES (1, N'Oyuncu', 1)
INSERT [dbo].[Gorevler] ([GorevId], [GorevAdi], [Durum]) VALUES (2, N'Yonetmen', 1)
INSERT [dbo].[Gorevler] ([GorevId], [GorevAdi], [Durum]) VALUES (3, N'Senarist', 1)
SET IDENTITY_INSERT [dbo].[Gorevler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Durum]) VALUES (1, N'Komedi', 1)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Durum]) VALUES (2, N'Aksiyon', 1)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Durum]) VALUES (3, N'Dram', 1)
INSERT [dbo].[Kategoriler] ([KategoriId], [KategoriAdi], [Durum]) VALUES (4, N'Romantik', 1)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Kisiler] ON 

INSERT [dbo].[Kisiler] ([KisiId], [KisiAdi], [KisiSoyadi], [Durum]) VALUES (1, N'Arnold', N'Schwazrzenegger', 1)
INSERT [dbo].[Kisiler] ([KisiId], [KisiAdi], [KisiSoyadi], [Durum]) VALUES (2, N'Linda', N'Hamilton', 1)
INSERT [dbo].[Kisiler] ([KisiId], [KisiAdi], [KisiSoyadi], [Durum]) VALUES (3, N'Michael', N'Biehn', 1)
INSERT [dbo].[Kisiler] ([KisiId], [KisiAdi], [KisiSoyadi], [Durum]) VALUES (4, N'Paul', N'Winfield', 1)
INSERT [dbo].[Kisiler] ([KisiId], [KisiAdi], [KisiSoyadi], [Durum]) VALUES (5, N'Lance', N'Henriksen', 1)
INSERT [dbo].[Kisiler] ([KisiId], [KisiAdi], [KisiSoyadi], [Durum]) VALUES (6, N'Earl', N'Boen', 1)
INSERT [dbo].[Kisiler] ([KisiId], [KisiAdi], [KisiSoyadi], [Durum]) VALUES (7, N'Rick', N'Rossovich', 1)
SET IDENTITY_INSERT [dbo].[Kisiler] OFF
GO
SET IDENTITY_INSERT [dbo].[KisilerFilmler] ON 

INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (1, 1, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (2, 1, 5, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (3, 1, 7, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (4, 1, 2, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (5, 1, 7, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (6, 2, 5, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (7, 2, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (8, 2, 1, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (9, 2, 7, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (10, 2, 3, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (11, 3, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (12, 3, 3, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (13, 3, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (14, 3, 3, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (15, 3, 4, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (16, 4, 7, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (17, 4, 3, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (18, 4, 4, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (19, 4, 7, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (20, 4, 6, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (21, 5, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (22, 5, 6, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (23, 5, 3, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (24, 5, 3, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (25, 5, 7, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (26, 6, 6, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (27, 6, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (28, 6, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (29, 6, 5, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (30, 6, 1, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (31, 7, 5, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (32, 7, 4, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (33, 7, 1, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (34, 7, 4, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (35, 7, 5, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (36, 8, 4, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (37, 8, 5, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (38, 8, 5, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (39, 8, 7, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (40, 8, 2, 3, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (41, 9, 1, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (42, 9, 2, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (43, 9, 5, 1, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (44, 9, 1, 2, 1)
INSERT [dbo].[KisilerFilmler] ([KisiFilmlerId], [FilmId], [KisiId], [GorevId], [Durum]) VALUES (45, 9, 1, 3, 1)
SET IDENTITY_INSERT [dbo].[KisilerFilmler] OFF
GO
SET IDENTITY_INSERT [dbo].[YapimSirketleri] ON 

INSERT [dbo].[YapimSirketleri] ([YapimSirketiId], [YapimSirketiAdi], [Durum]) VALUES (1, N'WB', 1)
INSERT [dbo].[YapimSirketleri] ([YapimSirketiId], [YapimSirketiAdi], [Durum]) VALUES (2, N'Marvel', 1)
INSERT [dbo].[YapimSirketleri] ([YapimSirketiId], [YapimSirketiAdi], [Durum]) VALUES (3, N'DC', 1)
INSERT [dbo].[YapimSirketleri] ([YapimSirketiId], [YapimSirketiAdi], [Durum]) VALUES (4, N'20th Century Fox', 1)
SET IDENTITY_INSERT [dbo].[YapimSirketleri] OFF
GO
ALTER TABLE [dbo].[Filmler] ADD  CONSTRAINT [DF_Filmler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Gorevler] ADD  CONSTRAINT [DF_Gorevler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Kategoriler] ADD  CONSTRAINT [DF_Kategoriler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[Kisiler] ADD  CONSTRAINT [DF_Kisiler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[KisilerFilmler] ADD  CONSTRAINT [DF_KisilerFilmler_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[YapimSirketleri] ADD  CONSTRAINT [DF_YapimSirketleri_Durum]  DEFAULT ((1)) FOR [Durum]
GO
ALTER TABLE [dbo].[FilmDetay]  WITH CHECK ADD  CONSTRAINT [FK_FilmDetay_Filmler] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Filmler] ([FilmId])
GO
ALTER TABLE [dbo].[FilmDetay] CHECK CONSTRAINT [FK_FilmDetay_Filmler]
GO
ALTER TABLE [dbo].[FilmDetay]  WITH CHECK ADD  CONSTRAINT [FK_FilmDetay_Kategoriler] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriId])
GO
ALTER TABLE [dbo].[FilmDetay] CHECK CONSTRAINT [FK_FilmDetay_Kategoriler]
GO
ALTER TABLE [dbo].[FilmDetay]  WITH CHECK ADD  CONSTRAINT [FK_FilmDetay_YapimSirketleri] FOREIGN KEY([YapimSirketiId])
REFERENCES [dbo].[YapimSirketleri] ([YapimSirketiId])
GO
ALTER TABLE [dbo].[FilmDetay] CHECK CONSTRAINT [FK_FilmDetay_YapimSirketleri]
GO
ALTER TABLE [dbo].[KisilerFilmler]  WITH CHECK ADD  CONSTRAINT [FK_KisilerFilmler_Filmler] FOREIGN KEY([FilmId])
REFERENCES [dbo].[Filmler] ([FilmId])
GO
ALTER TABLE [dbo].[KisilerFilmler] CHECK CONSTRAINT [FK_KisilerFilmler_Filmler]
GO
ALTER TABLE [dbo].[KisilerFilmler]  WITH CHECK ADD  CONSTRAINT [FK_KisilerFilmler_Gorevler] FOREIGN KEY([GorevId])
REFERENCES [dbo].[Gorevler] ([GorevId])
GO
ALTER TABLE [dbo].[KisilerFilmler] CHECK CONSTRAINT [FK_KisilerFilmler_Gorevler]
GO
ALTER TABLE [dbo].[KisilerFilmler]  WITH CHECK ADD  CONSTRAINT [FK_KisilerFilmler_Kisiler] FOREIGN KEY([KisiId])
REFERENCES [dbo].[Kisiler] ([KisiId])
GO
ALTER TABLE [dbo].[KisilerFilmler] CHECK CONSTRAINT [FK_KisilerFilmler_Kisiler]
GO
/****** Object:  StoredProcedure [dbo].[FilmEkle]    Script Date: 12.05.2022 08:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FilmEkle]
(
@Adi nvarchar(50),
@Resim nvarchar(100),
@KategoriId int,
@SirketId int,
@KisiId1 int,
@KisiId2 int,
@KisiId3 int,
@KisiId4 int,
@KisiId5 int
)
as
begin
insert Filmler (FilmAdi,FilmKapakResmi) values (@Adi,@Resim)
insert FilmDetay (FilmId,KategoriId,YapimSirketiId) values (IDENT_CURRENT('Filmler'),@KategoriId,@SirketId)
insert KisilerFilmler (FilmId,KisiId,GorevId) values (IDENT_CURRENT('Filmler'),@KisiId1,1)
insert KisilerFilmler (FilmId,KisiId,GorevId) values (IDENT_CURRENT('Filmler'),@KisiId2,1)
insert KisilerFilmler (FilmId,KisiId,GorevId) values (IDENT_CURRENT('Filmler'),@KisiId3,1)
insert KisilerFilmler (FilmId,KisiId,GorevId) values (IDENT_CURRENT('Filmler'),@KisiId4,2)
insert KisilerFilmler (FilmId,KisiId,GorevId) values (IDENT_CURRENT('Filmler'),@KisiId5,3)
end
GO
/****** Object:  StoredProcedure [dbo].[FilmGuncelle]    Script Date: 12.05.2022 08:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FilmGuncelle]
(
@Id int,
@Adi nvarchar(50),
@Resim nvarchar(100),
@KategoriId int,
@SirketId int,
@KisiId1 int,
@KisiId2 int,
@KisiId3 int,
@KisiId4 int,
@KisiId5 int
)
as
begin
update Filmler set FilmAdi=@Adi,FilmKapakResmi=@Resim where FilmId = @Id
update FilmDetay set KategoriId=@KategoriId,YapimSirketiId=@SirketId where FilmId=@Id
update KisilerFilmler set KisiId=@KisiId1 where FilmId=@Id
update KisilerFilmler set KisiId=@KisiId2 where FilmId=@Id
update KisilerFilmler set KisiId=@KisiId3 where FilmId=@Id
update KisilerFilmler set KisiId=@KisiId4 where FilmId=@Id
update KisilerFilmler set KisiId=@KisiId5 where FilmId=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[KisiEkle]    Script Date: 12.05.2022 08:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KisiEkle](
@Adi nvarchar(50),
@Soyadi nvarchar(50)
)
as
begin
insert Kisiler(KisiAdi,KisiSoyadi) values (@Adi,@Soyadi)
end
GO
/****** Object:  StoredProcedure [dbo].[SirketEkle]    Script Date: 12.05.2022 08:11:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SirketEkle](
@Adi nvarchar(50)
)
as
begin
insert YapimSirketleri (YapimSirketiAdi) values (@Adi)
end
GO
