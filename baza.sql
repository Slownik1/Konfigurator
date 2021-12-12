USE [master]
GO
/****** Object:  Database [konfigurator]    Script Date: 09.10.2021 12:01:02 ******/
CREATE DATABASE [konfigurator]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'konfigurator', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\konfigurator.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'konfigurator_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\konfigurator_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [konfigurator] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [konfigurator].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
EXEC sys.sp_db_vardecimal_storage_format N'konfigurator', N'ON'
GO
ALTER DATABASE [konfigurator] SET QUERY_STORE = OFF
GO
USE [konfigurator]
GO
CREATE TABLE [dbo].[Opcje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NOT NULL,
	[Wersja] [varchar](20) NOT NULL,
	[Kategoria] [int] NOT NULL,
	[Cena] [decimal](18, 0) NULL,
	[Wykluczajacy] [int]  NOT NULL,
	[Opis] [varchar](150),
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
ALTER DATABASE [konfigurator] SET  READ_WRITE 
GO



--PRZYK£ADOWE DANE:
USE [konfigurator]
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
		   ,[Wykluczajacy]
		   ,[Opis])
     VALUES
			    ('benzyna 1.6',1,1,90000,1,'Skrzynia manuala, napêd FWD, zu¿ycie paliwa œrednie: 5.2 l/100 km, œrednia emisja CO2: 115.0 g/km.'),
('benzyna 2.0',1,1,95000,1,'Skrzynia manuala, napêd FWD, zu¿ycie paliwa œrednie: 4.6 l/100 km, œrednia emisja CO2: 119.0 g/km.'),
('diesel 1.8',1,1,100000,1,'Skrzynia manuala, napêd FWD, zu¿ycie paliwa œrednie: 4.3 l/100 km, œrednia emisja CO2: 125.0 g/km.'),
('diesel 2.0',1,1,120000,1,'Skrzynia automatyczna, napêd RWD, zu¿ycie paliwa œrednie: 4.5 l/100 km, œrednia emisja CO2: 127.0 g/km.'),
('elektryczny',1,1,140000,1,'Skrzynia automatyczna, napêd AWD, zu¿ycie pr¹du 15 kWh/100 km'),
('awd',1,2,10000,1,'awd'),
('fwd',1,2,12000,1,'fwd'),
('czarny',1,3,2000,1,'Czarny to synonim uniwersalnoœci, a zarazem elegancja'),
('srebrny',1,3,2000,1,'Srebrny to synonim dostatku i presti¿u'),
('siwy',1,3,2000,1,'Szary to rozwaga i ostro¿noœæ'),
('zielony',1,3,2000,1,'Jeœli przywi¹zujesz wagê do walorów estetycznych ten kolor jest dla Ciebie!'),
('¿ó³ty',1,3,2000,1,'Jesteœ ³owc¹ przygód? ¯ó³y to jest to!'),
('czerwony',1,3,3000,1,'Lubisz wyró¿niaæ siê w t³umie? Ten kolor jest idealny dla Ciebie!'),
('letnie 17''',1,4,2000,1,'Fenomenalna przyczepnoœæ, krótka droga hamowania'),
('letnie 18''',1,4,3500,1,'Fenomenalna przyczepnoœæ, krótka droga hamowania'),
('przyciemniane szyby',1,5,1000,0,'Przyciemnianie szyb poprawia komfort jazdy, zabezpiecza auto przed nagrzewaniem'),
('listwy chrom',1,5,3000,0,'Chromowane listwy wykonane z polerowanej stali nierdzewnej dodadz¹ elegancji oraz podkreœl¹ wyj¹tkowy charakter Twojego auta'),
('relingi',1,5,1000,0,'Relingi dachowe to element, który znacz¹co u³atwia monta¿ dodatkowego baga¿nika na dachu samochodu'),
('przednia dok³adka zewnêtrzna',1,5,500,0,'Dok³adka wykonana jest z w³ókna wêglowego i jest w b³yszcz¹cym wykoñczeniu'),
('tylna dok³adka zewnêtrzna',1,5,500,0,'Dok³adka wykonana jest z w³ókna wêglowego i jest w b³yszcz¹cym wykoñczeniu'),
('skórzana',1,6,7000,1,'skórzana'),
('ekoskóra',1,6,3000,1,'ekoskóra'),
('Materia³',1,6,1000,1,'Materia³'),
('Park Assist',1,7,2000,0,'System wspomagaj¹cy parkowanie samochodów, ca³y manewr jest wykonywany automatycznie'),
('Navigation',1,7,3000,0,'Do¿ywotnia aktualizacja map, informacja o parkingach '),
('Power Seats',1,7,1000,0,'Elektryczna regulacja fotela kierowcy, zapamiêtuje do trzech ustawieñ')

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