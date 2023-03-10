USE [master]
GO
/****** Object:  Database [JAvilesExamenTecnico2]    Script Date: 1/10/2023 2:26:45 PM ******/
CREATE DATABASE [JAvilesExamenTecnico2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JAvilesExamenTecnico2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAvilesExamenTecnico2.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JAvilesExamenTecnico2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAvilesExamenTecnico2_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JAvilesExamenTecnico2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET ARITHABORT OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET RECOVERY FULL 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET  MULTI_USER 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JAvilesExamenTecnico2', N'ON'
GO
USE [JAvilesExamenTecnico2]
GO
/****** Object:  StoredProcedure [dbo].[AddMedicamento]    Script Date: 1/10/2023 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddMedicamento]
@Nombre varchar(50),
@Descripcion varchar(250),
@fechaCaducidad varchar(25),
@Preciounitario int,
@Stock int,
@IdProveedor int
as insert into Medicamentos(Nombre,Descripcion,fechaCaducidad,PrecioUnitario,Stock,IdProveedor)
values (@Nombre,@Descripcion,Convert(date,@fechaCaducidad,108),@Preciounitario,@Stock,@IdProveedor)



GO
/****** Object:  StoredProcedure [dbo].[MedicamentosGetAll]    Script Date: 1/10/2023 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[MedicamentosGetAll]
as select  
Medicamentos.IdMedicamento,
Medicamentos.Nombre,
Medicamentos.Descripcion,
Medicamentos.fechaCaducidad,
Medicamentos.PrecioUnitario,
Medicamentos.Stock,
Proveedor.IdProveedor,
Proveedor.Nombre as 'NombreProveedores'
from Medicamentos

inner join Proveedor on Medicamentos.IdProveedor= Proveedor.IdProveedor



GO
/****** Object:  StoredProcedure [dbo].[MedicamentosGetById]    Script Date: 1/10/2023 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[MedicamentosGetById]
@IdMedicamento int
as select
Medicamentos.IdMedicamento,  
Medicamentos.Nombre,
Medicamentos.Descripcion,
Medicamentos.fechaCaducidad,
Medicamentos.PrecioUnitario,
Medicamentos.Stock,
Proveedor.IdProveedor,
Proveedor.Nombre
from Medicamentos

inner join Proveedor on Medicamentos.IdProveedor= Proveedor.IdProveedor

where @IdMedicamento= Medicamentos.IdMedicamento
GO
/****** Object:  StoredProcedure [dbo].[ProveedorGetAll]    Script Date: 1/10/2023 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProveedorGetAll]
as select
IdProveedor,
Nombre as 'NommbreProveedores'
from Proveedor
GO
/****** Object:  Table [dbo].[Medicamentos]    Script Date: 1/10/2023 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medicamentos](
	[IdMedicamento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](255) NULL,
	[fechaCaducidad] [varchar](20) NULL,
	[PrecioUnitario] [int] NULL,
	[Stock] [int] NULL,
	[IdProveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 1/10/2023 2:26:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Medicamentos]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
USE [master]
GO
ALTER DATABASE [JAvilesExamenTecnico2] SET  READ_WRITE 
GO
