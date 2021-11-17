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
	[Kategoria] [nchar](50) NOT NULL,
	[Rodzaj] [nchar](50) NOT NULL,
	[Opis] [nchar](200) NOT NULL,
	[Cena] [decimal](18, 0) NULL,
	
 CONSTRAINT [PK_Opcje] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--CREATE TABLE [dbo].[Wersja](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[Nazwa] [nchar](20) NOT NULL,
--	[Opis] [nchar](300) NULL,
-- CONSTRAINT [PK_Wersja] PRIMARY KEY CLUSTERED 
--(
--	[Id] ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
--) ON [PRIMARY]
--GO

--CREATE TABLE [dbo].[Slownik](
--	[Id] [int] IDENTITY(1,1) NOT NULL,
--	[Nazwa] [nchar](20) NULL
--)
--GO

USE [master]
GO
ALTER DATABASE [Konfigurator] SET  READ_WRITE 
GO



--PRZYK£ADOWE DANE:
USE [Konfigurator]
GO

--INSERT INTO [dbo].[Wersja]
--           ([Nazwa]
--           ,[Opis])
--     VALUES
--           ('Basic', 'Wersja wyposa¿enia Basic ³¹czy niesamowity design, inteligentn¹ technologiê i znakomicie wykonane elementy wykoñczenia nadwozia i kabiny.'), 
--		   ('Komfort', 'Luksus w nowoczesnym wydaniu. Piêkne materia³y, wyj¹tkowe wyposa¿enie z zakresu komfortu plus intuicyjna technologia.'),
--		   ('Premium', 'Wersja Premium to sportowa dusza, ³¹cz¹ca wyj¹tkowe elementy designu nadwozia i wnêtrza z obni¿onym sportowym zawieszeniem zwiêkszaj¹cym precyzjê prowadzenia.')
--GO

INSERT INTO [dbo].[Opcje]
           ([Kategoria]
		   ,[Rodzaj] 
		   ,[Opis]
		   ,[Cena] )
		   
     VALUES
	    ('Silnik', 'benzyna 1.6', 'manual, fwd, ekoskóra, pierdupierdu', 70000),
		('Silnik', 'benzyna 2.0', 'benzyna 2.0 opis', 80000),
		('Silnik', 'diesel 1.8', 'diesel 1.8 opis', 90000),
		('Silnik', 'diesel 2.0', 'diesel 2.0 opis', 100000),
		('Silnik', 'elektryczny', 'elektryczny opis', 110000),
		('Kolor', 'czarny', 'czarny opis', 0),
		('Kolor', 'srebrny', 'srebrny opis', 2000),
		('Kolor', 'szary', 'szary opis', 2000),
		('Kolor', 'zielony', 'zielony opis', 2000),
		('Kolor', '¿ó³ty', '¿ó³ty opis', 2000),
		('Kolor', 'czerwony', 'czerwony opis', 3000),
		('opony', 'letnie 17''', 'letnie 17'' opis', 3000),
		('opony', 'letnie 18''', 'letnie 18'' opis', 4000),
		('dodatki', 'przyciemniane szyby', 'przyciemniane szyby opis', 2000),
		('dodatki', 'listwy chrom', 'listwy chrom opis', 3000),
		('dodatki', 'relingi', 'relingi opis', 1000),
		('dodatki', 'przednia dok³adka zewnêtrzna', 'przednia dok³adka zewnêtrzna opis', 1000),
		('dodatki', 'tylna dok³adka zewnêtrzna', 'tylna dok³adka zewnêtrzna opis', 1000),
		('dodatki', 'spojler', 'spojler opis', 2000),
		('dodatkowe pakiety', 'Park Assist', 'asystent parkowania sam se parkuje super bajer ', 2000),
		('dodatkowe pakiety', 'Navigation', 'super navi do¿ywotnie mapy super duper ', 3000),
		('dodatkowe pakiety', 'Power Seats', 'nie wiem co to', 1000)

			   
GO
--INSERT INTO [dbo].[Slownik]
--           ([Nazwa])
--	 VALUES
--		    ('Silnik'),
--			('napêd'),
--			('Kolor'),
--			('opony'),
--			('dodatki zewnêtrzne'),
--			('tapicerka'),
--			('dodatkowe pakiety')
--GO