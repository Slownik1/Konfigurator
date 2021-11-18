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
	   ('Silnik', 'benzyna 1.6', 'Skrzynia manuala, napêd FWD, zu¿ycie paliwa œrednie: 5.2 l/100 km, œrednia emisja CO2: 115.0 g/km.', 70000),
('Silnik', 'benzyna 2.0', 'Skrzynia manuala, napêd FWD, zu¿ycie paliwa œrednie: 4.6 l/100 km, œrednia emisja CO2: 119.0 g/km.', 80000),
('Silnik', 'diesel 1.8', 'Skrzynia manuala, napêd FWD, zu¿ycie paliwa œrednie: 4.3 l/100 km, œrednia emisja CO2: 125.0 g/km.', 90000),
('Silnik', 'diesel 2.0', 'Skrzynia automatyczna, napêd RWD, zu¿ycie paliwa œrednie: 4.5 l/100 km, œrednia emisja CO2: 127.0 g/km.', 100000),
('Silnik', 'elektryczny', 'Skrzynia automatyczna, napêd AWD, zu¿ycie pr¹du 15 kWh/100 km', 110000),
('Kolor', 'czarny', 'Czarny to synonim uniwersalnoœci, a zarazem elegancja', 0),
('Kolor', 'srebrny', 'Srebrny to synonim dostatku i presti¿u', 2000),
('Kolor', 'szary', 'Szary to rozwaga i ostro¿noœæ', 2000),
('Kolor', 'zielony', 'Jeœli przywi¹zujesz wagê do walorów estetycznych ten kolor jest dla Ciebie!', 2000),
('Kolor', '¿ó³ty', 'Jesteœ ³owc¹ przygód? ¯ó³y to jest to!', 2000),
('Kolor', 'czerwony', 'Lubisz wyró¿niaæ siê w t³umie? Ten kolor jest idealny dla Ciebie!', 3000),
('opony', 'letnie 17''', 'Fenomenalna przyczepnoœæ, krótka droga hamowania', 3000),
('opony', 'letnie 18''', 'Fenomenalna przyczepnoœæ, krótka droga hamowania', 4000),
('dodatki', 'przyciemniane szyby', 'Przyciemnianie szyb poprawia komfort jazdy, zabezpiecza auto przed nagrzewaniem', 2000),
('dodatki', 'listwy chrom', 'Chromowane listwy wykonane z polerowanej stali nierdzewnej dodadz¹ elegancji oraz podkreœl¹ wyj¹tkowy charakter Twojego auta', 3000),
('dodatki', 'relingi', 'Relingi dachowe to element, który znacz¹co u³atwia monta¿ dodatkowego baga¿nika na dachu samochodu', 1000),
('dodatki', 'przednia dok³adka zewnêtrzna', 'Dok³adka wykonana jest z w³ókna wêglowego i jest w b³yszcz¹cym wykoñczeniu', 1000),
('dodatki', 'tylna dok³adka zewnêtrzna', 'Dok³adka wykonana jest z w³ókna wêglowego i jest w b³yszcz¹cym wykoñczeniu', 1000),
('dodatki', 'spojler', 'Zapewniaj¹ oryginalny wygl¹d auta, ale te¿ polepsza jego w³asnoœci aerodynamiczne', 2000),
('dodatkowe pakiety', 'Park Assist', 'System wspomagaj¹cy parkowanie samochodów, ca³y manewr jest wykonywany automatycznie', 2000),
('dodatkowe pakiety', 'Navigation', 'Do¿ywotnia aktualizacja map, informacja o parkingach ', 3000),
('dodatkowe pakiety', 'Power Seats', 'Elektryczna regulacja fotela kierowcy, zapamiêtuje do trzech ustawieñ', 1000)


			   
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