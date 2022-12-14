USE [master]
GO
/****** Object:  Database [BANCOBD]    Script Date: 2/09/2022 11:07:12 ******/
CREATE DATABASE [BANCOBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BANCOBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BANCOBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BANCOBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BANCOBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BANCOBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BANCOBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BANCOBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BANCOBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BANCOBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BANCOBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BANCOBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BANCOBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BANCOBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BANCOBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BANCOBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BANCOBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BANCOBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BANCOBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BANCOBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BANCOBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BANCOBD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BANCOBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BANCOBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BANCOBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BANCOBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BANCOBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BANCOBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BANCOBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BANCOBD] SET RECOVERY FULL 
GO
ALTER DATABASE [BANCOBD] SET  MULTI_USER 
GO
ALTER DATABASE [BANCOBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BANCOBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BANCOBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BANCOBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BANCOBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BANCOBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BANCOBD', N'ON'
GO
ALTER DATABASE [BANCOBD] SET QUERY_STORE = OFF
GO
USE [BANCOBD]
GO
/****** Object:  Table [dbo].[Accionista]    Script Date: 2/09/2022 11:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accionista](
	[IdAccionista] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Apellido] [varchar](255) NULL,
	[DNI] [int] NULL,
	[nCuenta] [int] NULL,
	[Distrito] [varchar](255) NULL,
	[Direccion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAccionista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANK]    Script Date: 2/09/2022 11:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANK](
	[idBanco] [int] NULL,
	[Nombre] [varchar](255) NULL,
	[Sucursal] [varchar](255) NULL,
	[Direccion] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 2/09/2022 11:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Apellido] [varchar](255) NULL,
	[DNI] [int] NULL,
	[Celular] [int] NULL,
	[Distrito] [varchar](255) NULL,
	[nCuenta] [int] NULL,
	[Direccion] [varchar](255) NULL,
	[idBanco] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarjetas]    Script Date: 2/09/2022 11:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarjetas](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[nTarjeta] [int] NULL,
	[nCuenta] [int] NULL,
	[nCodigoCuenta] [int] NULL,
	[fechaAfiliacion] [date] NULL,
	[fechaCaducidad] [date] NULL,
	[saldo] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCuentas]    Script Date: 2/09/2022 11:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCuentas](
	[nCuenta] [int] NULL,
	[Describir] [varchar](255) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accionista] ON 

INSERT [dbo].[Accionista] ([IdAccionista], [Nombre], [Apellido], [DNI], [nCuenta], [Distrito], [Direccion]) VALUES (1, N'Kat', N'Lev', 111, 1111, N'AAA', N'AAA')
INSERT [dbo].[Accionista] ([IdAccionista], [Nombre], [Apellido], [DNI], [nCuenta], [Distrito], [Direccion]) VALUES (2, N'Keren', N'Lev', 222, 2222, N'BBB', N'BBB')
INSERT [dbo].[Accionista] ([IdAccionista], [Nombre], [Apellido], [DNI], [nCuenta], [Distrito], [Direccion]) VALUES (3, N'Titti', N'Lev', 333, 3333, N'CCC', NULL)
SET IDENTITY_INSERT [dbo].[Accionista] OFF
GO
INSERT [dbo].[BANK] ([idBanco], [Nombre], [Sucursal], [Direccion]) VALUES (1, N'AAAAA', N'A', N'A')
INSERT [dbo].[BANK] ([idBanco], [Nombre], [Sucursal], [Direccion]) VALUES (2, N'BBBBB', N'B', N'B')
INSERT [dbo].[BANK] ([idBanco], [Nombre], [Sucursal], [Direccion]) VALUES (3, N'CCCCC', N'C', NULL)
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [DNI], [Celular], [Distrito], [nCuenta], [Direccion], [idBanco]) VALUES (1, N'AAA', N'AAA', 11, 111, N'AAAA', 111, N'A', 1)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [DNI], [Celular], [Distrito], [nCuenta], [Direccion], [idBanco]) VALUES (2, N'BBB', N'BBB', 22, 222, N'BBBB', 222, N'B', 2)
INSERT [dbo].[Clientes] ([IdCliente], [Nombre], [Apellido], [DNI], [Celular], [Distrito], [nCuenta], [Direccion], [idBanco]) VALUES (3, N'CCC', N'CCC', 33, 333, N'CCCC', 333, N'C', 3)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Tarjetas] ON 

INSERT [dbo].[Tarjetas] ([IdCliente], [nTarjeta], [nCuenta], [nCodigoCuenta], [fechaAfiliacion], [fechaCaducidad], [saldo]) VALUES (1, 1222, 111, 11, CAST(N'2022-08-25' AS Date), CAST(N'2023-08-25' AS Date), 0)
INSERT [dbo].[Tarjetas] ([IdCliente], [nTarjeta], [nCuenta], [nCodigoCuenta], [fechaAfiliacion], [fechaCaducidad], [saldo]) VALUES (2, 1333, 222, 22, CAST(N'2022-09-02' AS Date), CAST(N'2023-09-02' AS Date), 0)
INSERT [dbo].[Tarjetas] ([IdCliente], [nTarjeta], [nCuenta], [nCodigoCuenta], [fechaAfiliacion], [fechaCaducidad], [saldo]) VALUES (3, 1444, 333, 33, CAST(N'2022-09-02' AS Date), CAST(N'2023-09-02' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Tarjetas] OFF
GO
INSERT [dbo].[TipoCuentas] ([nCuenta], [Describir]) VALUES (111, N'Debito')
INSERT [dbo].[TipoCuentas] ([nCuenta], [Describir]) VALUES (222, N'Credito')
INSERT [dbo].[TipoCuentas] ([nCuenta], [Describir]) VALUES (333, N'Debito')
GO
USE [master]
GO
ALTER DATABASE [BANCOBD] SET  READ_WRITE 
GO
