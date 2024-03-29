USE [master]
GO
/****** Object:  Database [Okul]    Script Date: 7.07.2023 19:42:26 ******/
CREATE DATABASE [Okul]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Okul', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Okul.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Okul_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Okul_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Okul] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Okul].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Okul] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Okul] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Okul] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Okul] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Okul] SET ARITHABORT OFF 
GO
ALTER DATABASE [Okul] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Okul] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Okul] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Okul] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Okul] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Okul] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Okul] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Okul] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Okul] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Okul] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Okul] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Okul] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Okul] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Okul] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Okul] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Okul] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Okul] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Okul] SET RECOVERY FULL 
GO
ALTER DATABASE [Okul] SET  MULTI_USER 
GO
ALTER DATABASE [Okul] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Okul] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Okul] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Okul] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Okul] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Okul] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Okul', N'ON'
GO
ALTER DATABASE [Okul] SET QUERY_STORE = OFF
GO
USE [Okul]
GO
/****** Object:  Table [dbo].[Dersler]    Script Date: 7.07.2023 19:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dersler](
	[DersID] [tinyint] IDENTITY(1,1) NOT NULL,
	[DersAd] [varchar](50) NULL,
 CONSTRAINT [PK_Dersler] PRIMARY KEY CLUSTERED 
(
	[DersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notlar]    Script Date: 7.07.2023 19:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notlar](
	[NotID] [int] IDENTITY(1,1) NOT NULL,
	[DersID] [tinyint] NULL,
	[OgrenciID] [int] NULL,
	[Sınav1] [tinyint] NULL,
	[Sınav2] [tinyint] NULL,
	[Sınav3] [tinyint] NULL,
	[Proje] [tinyint] NULL,
	[Ortalama] [decimal](5, 2) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [PK_Notlar] PRIMARY KEY CLUSTERED 
(
	[NotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 7.07.2023 19:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[OGRID] [int] IDENTITY(1,1) NOT NULL,
	[OGRAD] [varchar](50) NULL,
	[OGRSOYAD] [varchar](50) NULL,
	[OGRKULUP] [tinyint] NULL,
	[OGRCINSIYET] [varchar](5) NULL,
 CONSTRAINT [PK_Ogrenciler] PRIMARY KEY CLUSTERED 
(
	[OGRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogretmenler]    Script Date: 7.07.2023 19:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogretmenler](
	[OgretmenID] [tinyint] IDENTITY(1,1) NOT NULL,
	[OgretmenBrans] [tinyint] NULL,
	[OgretmenAdSoyad] [nchar](10) NULL,
 CONSTRAINT [PK_Ogretmenler] PRIMARY KEY CLUSTERED 
(
	[OgretmenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Kulupler]    Script Date: 7.07.2023 19:42:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Kulupler](
	[KulupID] [tinyint] IDENTITY(1,1) NOT NULL,
	[KulupAd] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Kulupler] PRIMARY KEY CLUSTERED 
(
	[KulupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dersler] ON 

INSERT [dbo].[Dersler] ([DersID], [DersAd]) VALUES (1, N'MATEMATİK')
INSERT [dbo].[Dersler] ([DersID], [DersAd]) VALUES (2, N'YAZILIM TASARLAMA')
INSERT [dbo].[Dersler] ([DersID], [DersAd]) VALUES (3, N'VERİ TABANI')
INSERT [dbo].[Dersler] ([DersID], [DersAd]) VALUES (4, N'ALGORİTMA')
INSERT [dbo].[Dersler] ([DersID], [DersAd]) VALUES (5, N'WEB PROGRAMLAMA')
INSERT [dbo].[Dersler] ([DersID], [DersAd]) VALUES (6, N'MAKİNE ÖĞRENİMİ')
SET IDENTITY_INSERT [dbo].[Dersler] OFF
GO
SET IDENTITY_INSERT [dbo].[Notlar] ON 

INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (1, 1, 1, 75, 75, NULL, NULL, NULL, NULL)
INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (2, 1, 2, 75, 65, NULL, NULL, NULL, NULL)
INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (3, 1, 3, 85, 35, NULL, NULL, NULL, NULL)
INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (4, 1, 4, 87, 46, NULL, NULL, NULL, NULL)
INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (5, 1, 5, 88, 28, NULL, NULL, NULL, NULL)
INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (6, 2, 1, 100, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (7, 2, 2, 23, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Notlar] ([NotID], [DersID], [OgrenciID], [Sınav1], [Sınav2], [Sınav3], [Proje], [Ortalama], [Durum]) VALUES (8, 2, 3, 63, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Notlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogrenciler] ON 

INSERT [dbo].[Ogrenciler] ([OGRID], [OGRAD], [OGRSOYAD], [OGRKULUP], [OGRCINSIYET]) VALUES (1, N'Mehmet', N'Sönmez', 1, N'Erkek')
INSERT [dbo].[Ogrenciler] ([OGRID], [OGRAD], [OGRSOYAD], [OGRKULUP], [OGRCINSIYET]) VALUES (2, N'Yılmaz', N'Mira', 2, N'Erkek')
INSERT [dbo].[Ogrenciler] ([OGRID], [OGRAD], [OGRSOYAD], [OGRKULUP], [OGRCINSIYET]) VALUES (3, N'Emel', N'Kaplan', 3, N'Kız')
INSERT [dbo].[Ogrenciler] ([OGRID], [OGRAD], [OGRSOYAD], [OGRKULUP], [OGRCINSIYET]) VALUES (4, N'Miray', N'Sari', 4, N'Kız')
INSERT [dbo].[Ogrenciler] ([OGRID], [OGRAD], [OGRSOYAD], [OGRKULUP], [OGRCINSIYET]) VALUES (5, NULL, NULL, 5, NULL)
SET IDENTITY_INSERT [dbo].[Ogrenciler] OFF
GO
SET IDENTITY_INSERT [dbo].[Ogretmenler] ON 

INSERT [dbo].[Ogretmenler] ([OgretmenID], [OgretmenBrans], [OgretmenAdSoyad]) VALUES (2, 1, N'Zeynep Kay')
INSERT [dbo].[Ogretmenler] ([OgretmenID], [OgretmenBrans], [OgretmenAdSoyad]) VALUES (3, 5, N'Veli Akça ')
SET IDENTITY_INSERT [dbo].[Ogretmenler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Kulupler] ON 

INSERT [dbo].[Tbl_Kulupler] ([KulupID], [KulupAd]) VALUES (1, N'Bilgisayar')
INSERT [dbo].[Tbl_Kulupler] ([KulupID], [KulupAd]) VALUES (2, N'Algoritma')
INSERT [dbo].[Tbl_Kulupler] ([KulupID], [KulupAd]) VALUES (3, N'Sağlık')
INSERT [dbo].[Tbl_Kulupler] ([KulupID], [KulupAd]) VALUES (4, N'Edebiyat')
INSERT [dbo].[Tbl_Kulupler] ([KulupID], [KulupAd]) VALUES (5, N'Kütüphane')
SET IDENTITY_INSERT [dbo].[Tbl_Kulupler] OFF
GO
ALTER TABLE [dbo].[Notlar]  WITH CHECK ADD  CONSTRAINT [FK_Notlar_Dersler] FOREIGN KEY([DersID])
REFERENCES [dbo].[Dersler] ([DersID])
GO
ALTER TABLE [dbo].[Notlar] CHECK CONSTRAINT [FK_Notlar_Dersler]
GO
ALTER TABLE [dbo].[Notlar]  WITH CHECK ADD  CONSTRAINT [FK_Notlar_Ogrenciler] FOREIGN KEY([OgrenciID])
REFERENCES [dbo].[Ogrenciler] ([OGRID])
GO
ALTER TABLE [dbo].[Notlar] CHECK CONSTRAINT [FK_Notlar_Ogrenciler]
GO
ALTER TABLE [dbo].[Ogrenciler]  WITH CHECK ADD  CONSTRAINT [FK_Ogrenciler_Tbl_Kulupler] FOREIGN KEY([OGRKULUP])
REFERENCES [dbo].[Tbl_Kulupler] ([KulupID])
GO
ALTER TABLE [dbo].[Ogrenciler] CHECK CONSTRAINT [FK_Ogrenciler_Tbl_Kulupler]
GO
ALTER TABLE [dbo].[Ogretmenler]  WITH CHECK ADD  CONSTRAINT [FK_Ogretmenler_Dersler] FOREIGN KEY([OgretmenBrans])
REFERENCES [dbo].[Dersler] ([DersID])
GO
ALTER TABLE [dbo].[Ogretmenler] CHECK CONSTRAINT [FK_Ogretmenler_Dersler]
GO
USE [master]
GO
ALTER DATABASE [Okul] SET  READ_WRITE 
GO
