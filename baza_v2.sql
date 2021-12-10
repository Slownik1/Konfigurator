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



--PRZYK�ADOWE DANE:
USE [Konfigurator]
GO

--INSERT INTO [dbo].[Wersja]
--           ([Nazwa]
--           ,[Opis])
--     VALUES
--           ('Basic', 'Wersja wyposa�enia Basic ��czy niesamowity design, inteligentn� technologi� i znakomicie wykonane elementy wyko�czenia nadwozia i kabiny.'), 
--		   ('Komfort', 'Luksus w nowoczesnym wydaniu. Pi�kne materia�y, wyj�tkowe wyposa�enie z zakresu komfortu plus intuicyjna technologia.'),
--		   ('Premium', 'Wersja Premium to sportowa dusza, ��cz�ca wyj�tkowe elementy designu nadwozia i wn�trza z obni�onym sportowym zawieszeniem zwi�kszaj�cym precyzj� prowadzenia.')
--GO

INSERT INTO [dbo].[Opcje]
           ([Kategoria]
		   ,[Rodzaj] 
		   ,[Opis]
		   ,[Cena] )
		   
     VALUES
	   ('Silnik', 'benzyna 1.6', 'Skrzynia manuala, nap�d FWD, zu�ycie paliwa �rednie: 5.2 l/100 km, �rednia emisja CO2: 115.0 g/km.', 70000),
('Silnik', 'benzyna 2.0', 'Skrzynia manuala, nap�d FWD, zu�ycie paliwa �rednie: 4.6 l/100 km, �rednia emisja CO2: 119.0 g/km.', 80000),
('Silnik', 'diesel 1.8', 'Skrzynia manuala, nap�d FWD, zu�ycie paliwa �rednie: 4.3 l/100 km, �rednia emisja CO2: 125.0 g/km.', 90000),
('Silnik', 'diesel 2.0', 'Skrzynia automatyczna, nap�d RWD, zu�ycie paliwa �rednie: 4.5 l/100 km, �rednia emisja CO2: 127.0 g/km.', 100000),
('Silnik', 'elektryczny', 'Skrzynia automatyczna, nap�d AWD, zu�ycie pr�du 15 kWh/100 km', 110000),
('Kolor', 'czarny', 'Czarny to synonim uniwersalno�ci, a zarazem elegancja', 0),
('Kolor', 'srebrny', 'Srebrny to synonim dostatku i presti�u', 2000),
('Kolor', 'szary', 'Szary to rozwaga i ostro�no��', 2000),
('Kolor', 'zielony', 'Je�li przywi�zujesz wag� do walor�w estetycznych ten kolor jest dla Ciebie!', 2000),
('Kolor', '��ty', 'Jeste� �owc� przyg�d? ��y to jest to!', 2000),
('Kolor', 'czerwony', 'Lubisz wyr�nia� si� w t�umie? Ten kolor jest idealny dla Ciebie!', 3000),
('opony', 'letnie 17''', 'Fenomenalna przyczepno��, kr�tka droga hamowania', 3000),
('opony', 'letnie 18''', 'Fenomenalna przyczepno��, kr�tka droga hamowania', 4000),
('dodatki', 'przyciemniane szyby', 'Przyciemnianie szyb poprawia komfort jazdy, zabezpiecza auto przed nagrzewaniem', 2000),
('dodatki', 'listwy chrom', 'Chromowane listwy wykonane z polerowanej stali nierdzewnej dodadz� elegancji oraz podkre�l� wyj�tkowy charakter Twojego auta', 3000),
('dodatki', 'relingi', 'Relingi dachowe to element, kt�ry znacz�co u�atwia monta� dodatkowego baga�nika na dachu samochodu', 1000),
('dodatki', 'przednia dok�adka zewn�trzna', 'Dok�adka wykonana jest z w��kna w�glowego i jest w b�yszcz�cym wyko�czeniu', 1000),
('dodatki', 'tylna dok�adka zewn�trzna', 'Dok�adka wykonana jest z w��kna w�glowego i jest w b�yszcz�cym wyko�czeniu', 1000),
('dodatki', 'spojler', 'Zapewniaj� oryginalny wygl�d auta, ale te� polepsza jego w�asno�ci aerodynamiczne', 2000),
('dodatkowe pakiety', 'Park Assist', 'System wspomagaj�cy parkowanie samochod�w, ca�y manewr jest wykonywany automatycznie', 2000),
('dodatkowe pakiety', 'Navigation', 'Do�ywotnia aktualizacja map, informacja o parkingach ', 3000),
('dodatkowe pakiety', 'Power Seats', 'Elektryczna regulacja fotela kierowcy, zapami�tuje do trzech ustawie�', 1000)


			   
GO
--INSERT INTO [dbo].[Slownik]
--           ([Nazwa])
--	 VALUES
--		    ('Silnik'),
--			('nap�d'),
--			('Kolor'),
--			('opony'),
--			('dodatki zewn�trzne'),
--			('tapicerka'),
--			('dodatkowe pakiety')
--GO