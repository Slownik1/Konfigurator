USE [master]
GO
/****** Object:  Database [Konfigurator]    Script Date: 09.10.2021 12:01:02 ******/
CREATE DATABASE [Konfigurator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Konfigurator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Konfigurator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Konfigurator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Konfigurator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Konfigurator] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Konfigurator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
EXEC sys.sp_db_vardecimal_storage_format N'Konfigurator', N'ON'
GO
ALTER DATABASE [Konfigurator] SET QUERY_STORE = OFF
GO
USE [Konfigurator]
GO
CREATE TABLE [dbo].[Opcje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nchar](50) NOT NULL,
	[Wersja] [nchar](20) NOT NULL,
	[Kategoria] [int] NOT NULL,
	[Cena] [decimal](18, 0) NULL,
	[Wykluczajacy] [int]  NOT NULL,
 CONSTRAINT [PK_Opcje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Wersja](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nchar](20) NOT NULL,
	[Opis] [nchar](300) NULL,
 CONSTRAINT [PK_Wersja] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Slownik](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nchar](20) NULL
)
GO

USE [master]
GO
ALTER DATABASE [Konfigurator] SET  READ_WRITE 
GO



--PRZYK£ADOWE DANE:
USE [Konfigurator]
GO

INSERT INTO [dbo].[Wersja]
           ([Nazwa]
           ,[Opis])
     VALUES
           ('Basic', 'Wersja wyposa¿enia Basic ³¹czy niesamowity design, inteligentn¹ technologiê i znakomicie wykonane elementy wykoñczenia nadwozia i kabiny.'), 
		   ('Komfort', 'Luksus w nowoczesnym wydaniu. Piêkne materia³y, wyj¹tkowe wyposa¿enie z zakresu komfortu plus intuicyjna technologia.'),
		   ('Premium', 'Wersja Premium to sportowa dusza, ³¹cz¹ca wyj¹tkowe elementy designu nadwozia i wnêtrza z obni¿onym sportowym zawieszeniem zwiêkszaj¹cym precyzjê prowadzenia.')
GO

INSERT INTO [dbo].[Opcje]
           ([Nazwa]
		   ,[Wersja] 
		   ,[Kategoria]
		   ,[Cena] 
		   ,[Wykluczajacy])
     VALUES
			    ('benzyna 1.6',1,1,90000,1),
				('benzyna 2.0',1,1,95000,1),
				('diesel 1.8',1,1,100000,1),
				('diesel 2.0',1,1,120000,1),
				('elektryczny',1,1,140000,1),
				('benzyna 1.6',2,1,99000,1),
				('benzyna 2.0',2,1,104000,1),
				('diesel 1.8',2,1,109000,1),
				('diesel 2.0',2,1,129000,1),
				('elektryczny',2,1,149000,1),
				('benzyna 1.6',3,1,105000,1),
				('benzyna 2.0',3,1,110000,1),
				('diesel 1.8',3,1,115000,1),
				('diesel 2.0',3,1,135000,1),
				('elektryczny',3,1,155000,1),
				('awd',1,2,10000,1),
				('fwd',1,2,12000,1),
				('awd',2,2,11000,1),
				('fwd',2,2,13000,1),
				('awd',3,2,12000,1),
				('fwd',3,2,14000,1),
				('czarny',1,3,2000,1),
				('bia³y',1,3,0,1),
				('srebrny',1,3,2000,1),
				('siwy',1,3,2000,1),
				('zielony',1,3,2000,1),
				('¿ó³ty',1,3,2000,1),
				('czerwony',1,3,3000,1),
				('czarny',2,3,2000,1),
				('bia³y',2,3,0,1),
				('srebrny',2,3,2000,1),
				('siwy',2,3,2000,1),
				('zielony',2,3,2000,1),
				('¿ó³ty',2,3,2000,1),
				('czerwony',2,3,3000,1),
				('czarny',3,3,4000,1),
				('bia³y',3,3,0,1),
				('srebrny',3,3,4000,1),
				('siwy',3,3,4000,1),
				('zielony',3,3,2000,1),
				('¿ó³ty',3,3,2000,1),
				('czerwony',3,3,5000,1),
				('letnie',1,4,2000,1),
				('letnie + zimowe',1,4,3500,1),
				('letnie',2,4,2000,1),
				('letnie + zimowe',2,4,3700,1),
				('letnie',3,4,3000,1),
				('letnie + zimowe',3,4,5000,1),
				('przyciemniane szyby',1,5,1000,0),
				('listwy chrom',1,5,3000,0),
				('relingi',1,5,1000,0),
				('przednia dok³adka zewnêtrzna',1,5,500,0),
				('tylna dok³adka zewnêtrzna',1,5,500,0),
				('przyciemniane szyby',2,5,1000,0),
				('listwy chrom',2,5,3000,0),
				('relingi',2,5,1000,0),
				('przednia dok³adka zewnêtrzna',2,5,500,0),
				('tylna dok³adka zewnêtrzna',2,5,500,0),
				('przyciemniane szyby',3,5,1000,0),
				('listwy chrom',3,5,4000,0),
				('relingi',3,5,1000,0),
				('przednia dok³adka zewnêtrzna',3,5,500,0),
				('tylna dok³adka zewnêtrzna',3,5,500,0),
				('spojler',3,5,3000,0),
				('skórzana',1,6,7000,1),
				('ekoskóra',1,6,3000,1),
				('Materia³',1,6,1000,1),
				('skórzana',2,6,8000,1),
				('ekoskóra',2,6,3500,1),
				('Materia³',2,6,2000,1),
				('skórzana',3,6,10000,1),
				('ekoskóra',3,6,4000,1),
				('Materia³',3,6,2000,1),
				('Park Assist',1,7,2000,0),
				('Navigation',1,7,3000,0),
				('Power Seats',1,7,1000,0),
				('Park Assist',2,7,2000,0),
				('Navigation',2,7,3000,0),
				('Power Seats',2,7,2000,0),
				('Park Assist',3,7,2000,0)
GO
INSERT INTO [dbo].[Slownik]
           ([Nazwa])
	 VALUES
		    ('Silnik'),
			('napêd'),
			('Kolor'),
			('opony'),
			('dodatki zewnêtrzne'),
			('tapicerka'),
			('dodatkowe pakiety')
GO