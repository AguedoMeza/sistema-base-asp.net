USE [master]
GO
/****** Object:  Database [modelo]    Script Date: 06/04/2017 20:53:28 ******/
CREATE DATABASE [modelo] ON  PRIMARY 
( NAME = N'modelo', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\modelo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'modelo_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\modelo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [modelo] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [modelo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [modelo] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [modelo] SET ANSI_NULLS OFF
GO
ALTER DATABASE [modelo] SET ANSI_PADDING OFF
GO
ALTER DATABASE [modelo] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [modelo] SET ARITHABORT OFF
GO
ALTER DATABASE [modelo] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [modelo] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [modelo] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [modelo] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [modelo] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [modelo] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [modelo] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [modelo] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [modelo] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [modelo] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [modelo] SET  DISABLE_BROKER
GO
ALTER DATABASE [modelo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [modelo] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [modelo] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [modelo] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [modelo] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [modelo] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [modelo] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [modelo] SET  READ_WRITE
GO
ALTER DATABASE [modelo] SET RECOVERY SIMPLE
GO
ALTER DATABASE [modelo] SET  MULTI_USER
GO
ALTER DATABASE [modelo] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [modelo] SET DB_CHAINING OFF
GO
USE [modelo]
GO
/****** Object:  Table [dbo].[empresas]    Script Date: 06/04/2017 20:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](250) NULL,
	[rfc] [nvarchar](50) NULL,
	[razon_social] [nvarchar](250) NULL,
	[contacto] [nvarchar](250) NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_empresas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[empresas] ON
INSERT [dbo].[empresas] ([id], [id_usuario], [nombre], [direccion], [rfc], [razon_social], [contacto], [fecha], [hora], [activo]) VALUES (2, 1, N'SOFTEAM', N'Queretaro', N'#123456', N'Software', N'Miguel Barrera', NULL, NULL, 1)
INSERT [dbo].[empresas] ([id], [id_usuario], [nombre], [direccion], [rfc], [razon_social], [contacto], [fecha], [hora], [activo]) VALUES (3, 1, N'BSD', N'Monterrey', N'#123', N'Software', N'Filemon Treviño', NULL, NULL, 1)
INSERT [dbo].[empresas] ([id], [id_usuario], [nombre], [direccion], [rfc], [razon_social], [contacto], [fecha], [hora], [activo]) VALUES (12, 0, N'Msion', N'Linares', N'comercio', N'@098', N'Ing. Itonio', CAST(0xDE3C0B00 AS Date), NULL, NULL)
SET IDENTITY_INSERT [dbo].[empresas] OFF
/****** Object:  Table [dbo].[acciones]    Script Date: 06/04/2017 20:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[acciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[nombre] [varchar](50) NULL,
	[definicion] [nvarchar](250) NULL,
	[actividad] [nvarchar](250) NULL,
	[fecha] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_acciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[acciones] ON
INSERT [dbo].[acciones] ([id], [id_usuario], [nombre], [definicion], [actividad], [fecha], [activo]) VALUES (1, 9, N'algo', N'algo', N'algo', CAST(0x0000A774013FE5B5 AS DateTime), 1)
INSERT [dbo].[acciones] ([id], [id_usuario], [nombre], [definicion], [actividad], [fecha], [activo]) VALUES (2, 9, N'ALGO2', N'ALGO2', N'ALGO2', CAST(0x0000A7740140985E AS DateTime), 1)
INSERT [dbo].[acciones] ([id], [id_usuario], [nombre], [definicion], [actividad], [fecha], [activo]) VALUES (3, 9, N'algo3', N'algo3', N'algo3', CAST(0x0000A77501004406 AS DateTime), 1)
INSERT [dbo].[acciones] ([id], [id_usuario], [nombre], [definicion], [actividad], [fecha], [activo]) VALUES (4, 3, N'algo5', N'algo5', N'algo5', CAST(0x0000A775010959A1 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[acciones] OFF
/****** Object:  Table [dbo].[modulos]    Script Date: 06/04/2017 20:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [int] NULL,
	[id_usuario] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion_actividad] [nvarchar](250) NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_modulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfiles]    Script Date: 06/04/2017 20:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_empresa] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 06/04/2017 20:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_empresa] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[ap_paterno] [nvarchar](50) NULL,
	[ap_materno] [nvarchar](50) NULL,
	[curp] [nvarchar](100) NULL,
	[nombre_usuario] [nvarchar](100) NULL,
	[contrasena] [nvarchar](100) NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuarios] ON
INSERT [dbo].[usuarios] ([id], [id_usuario], [id_empresa], [nombre], [ap_paterno], [ap_materno], [curp], [nombre_usuario], [contrasena], [fecha], [hora], [activo]) VALUES (74, NULL, 3, N'José', N'Serna', N'Serna', N'SEMA97', N'Aguedo', N'123', NULL, NULL, 1)
INSERT [dbo].[usuarios] ([id], [id_usuario], [id_empresa], [nombre], [ap_paterno], [ap_materno], [curp], [nombre_usuario], [contrasena], [fecha], [hora], [activo]) VALUES (75, NULL, 2, N'Jose Alberto', N'Villarreal', N'Villarreal', N'BETO97', N'beto', N'', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
/****** Object:  Table [dbo].[perfil_modulos]    Script Date: 06/04/2017 20:53:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfil_modulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_perfil] [int] NULL,
	[id_modulo] [int] NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_perfil_modulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[acciones_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[acciones_update]
@id int,
@nombre nvarchar(50),
@definicion nvarchar(250),
@actividad nvarchar(250),
@id_usuario int,
@fecha date,
@hora datetime,
@activo bit

AS
UPDATE acciones 
SET 
id_usuario = @id_usuario,
nombre = @nombre,
definicion = @definicion,
actividad = @actividad,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[acciones_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[acciones_select]
@id INT
AS
SELECT * FROM acciones WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[acciones_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[acciones_insert]

@id_usuario int,
@nombre nvarchar(50),
@definicion nvarchar(250),
@actividad nvarchar(250),
@activo bit

AS
SET NOCOUNT ON
DECLARE @CONTADOR tinyint --este tipo de dato permite hasta 254
select @CONTADOR = COUNT(*) FROM acciones WHERE nombre = @nombre --se almacena select en el contador
   
if @CONTADOR = 0 --se condiciona si no existen registros repetidos
	BEGIN 
		INSERT INTO acciones (
		id_usuario,
		nombre,
		definicion,
		actividad,
		activo
		) 
		VALUES(
		@id_usuario,
		@nombre,
		@definicion,
		@actividad,
		@activo
		)
		SELECT @@IDENTITY 
		END
ELSE 
		BEGIN
		select 'existe'
		END
GO
/****** Object:  StoredProcedure [dbo].[modulos_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulos_update] 
@id int,
@id_usuario int,
@id_empresa int,
@nombre nvarchar(50),
@descripcion_actividad nvarchar(250),
@fecha date,
@hora datetime,
@activo bit

AS

UPDATE modulos 
SET 
id_usuario = @id_usuario,
id_empresa = @id_empresa,
nombre = @nombre,
descripcion_actividad = @descripcion_actividad,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulos_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulos_select]
@id int
AS
SELECT * FROM modulos WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulos_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulos_insert]
@id_usuario int,
@id_empresa int,
@nombre nvarchar(50),
@descripcion_actividad nvarchar(250),
@fecha date,
@hora datetime,
@activo bit
AS
INSERT INTO modulos (
id_usuario,
id_empresa,
nombre,
descripcion_actividad
) 
VALUES (
@id_usuario,
@id_empresa,
@nombre,
@descripcion_actividad
)
GO
/****** Object:  Table [dbo].[funciones]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_modulos] [int] NULL,
	[id_acciones] [int] NULL,
	[definicion] [nvarchar](250) NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_funciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[empresas_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[empresas_update] 

@id int,
@nombre nvarchar(50),
@direccion nvarchar(50),
@rfc nvarchar(50),
@razon_social nvarchar(100),
@contacto nvarchar(100)

AS 
UPDATE empresas
SET 

nombre = @nombre,
direccion = @direccion,
rfc = @rfc,
razon_social = @razon_social,
contacto = @contacto
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[empresas_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[empresas_select]
@id INT

AS 
IF @id = 0
	BEGIN
	SELECT * FROM empresas 
END
ELSE
    SELECT * FROM empresas WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[empresas_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[empresas_insert]
@id_usuario int,
@nombre nvarchar(50),
@direccion nvarchar(250),
@rfc nvarchar(50),
@razon_social nvarchar(250),
@contacto nvarchar(100)

AS
SET NOCOUNT ON
DECLARE @CONTADOR tinyint --este tipo de dato permite hasta 254
select @CONTADOR = COUNT(*) FROM empresas WHERE nombre = @nombre --se almacena select en el contador
   
if @CONTADOR = 0 --se condiciona si no existen registros repetidos
	BEGIN 
INSERT INTO empresas (
id_usuario,
nombre,
direccion,
rfc,
razon_social,
contacto
) 
VALUES (
@id_usuario,
@nombre,
@direccion,
@rfc,
@razon_social,
@contacto
) 
	SELECT @@IDENTITY 
		END
ELSE 
		BEGIN
		select 'existe'
		END
GO
/****** Object:  StoredProcedure [dbo].[perfiles_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_update]
@id int,
@id_usuario int,
@id_empresa int,
@nombre nvarchar(50),
@fecha date,
@hora datetime,
@activo bit
AS 
UPDATE perfiles 
SET 
id_usuario = @id_usuario,
id_empresa = @id_empresa,
nombre = @nombre,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfiles_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_select]
@id int

AS
SELECT * FROM perfiles
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfiles_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_insert]
@id_usuario int,
@id_empresa int,
@nombre nvarchar(50),
@fecha date,
@hora datetime,
@activo bit
AS
INSERT INTO perfiles (
id_usuario,
id_empresa,
nombre,
fecha,
hora,
activo
) 
VALUES (
@id_usuario,
@id_empresa,
@nombre,
@fecha,
@hora,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[usuarios_validar]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_validar]
@usuario NVARCHAR(50),
@contra NVARCHAR(50)

as
SELECT COUNT(*) FROM usuarios WHERE nombre_usuario = @usuario AND contrasena = @contra
GO
/****** Object:  StoredProcedure [dbo].[usuarios_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_update]

@id int,
@nombre nvarchar(50),
@ap_paterno nvarchar(50),
@usuario nvarchar(50),
@curp nvarchar(100),
@contraseña nvarchar(100),
@empresa int

AS 
UPDATE usuarios  
SET 

nombre = @nombre,
ap_paterno = @ap_paterno,
ap_materno = @ap_paterno,
nombre_usuario = @usuario,
contrasena = @contraseña,
curp = @curp,
id_empresa = @empresa
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuarios_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_select]
@id int
AS
IF @id = 0
BEGIN
	SELECT us.id AS #,(us.nombre + '  ' + ap_paterno + '  ' + ap_materno) as Persona,
	us.nombre AS Nombre,
	curp AS CURP,
	em.nombre AS Empresa,
	nombre_usuario AS Usuario,
	us.activo AS Activo
	FROM usuarios us
	INNER JOIN empresas em
	ON us.id_empresa = em.id
	
END
ELSE
SELECT us.id AS #,(us.nombre + '  ' + ap_paterno + '  ' + ap_materno) as Persona,
    us.nombre AS Nombre,
    us.ap_paterno AS Ap_Paterno,
    us.ap_materno AS Ap_Materno,
	curp AS CURP,
	em.nombre AS Empresa,
	nombre_usuario AS Usuario,
	us.activo AS Activo
	FROM usuarios us
	INNER JOIN empresas em
	ON us.id_empresa = em.id
	WHERE us.id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuarios_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_insert]

@nombre nvarchar(50),
@ap_paterno nvarchar(50),
@ap_materno  nvarchar(50),
@curp nvarchar(100),
@nombre_usuario nvarchar(100),
@contraseña nvarchar(50),
@empresa int,
@activo int

AS
SET NOCOUNT ON
DECLARE @CONTADOR tinyint --este tipo de dato permite hasta 254
select @CONTADOR = COUNT(*) FROM usuarios WHERE nombre_usuario = @nombre_usuario --se almacena select en el contador
   
if @CONTADOR = 0 --se condiciona si no existen registros repetidos
	BEGIN 
INSERT INTO usuarios(
nombre,
ap_paterno,
ap_materno,
curp,
nombre_usuario,
contrasena,
id_empresa,
activo
) 
VALUES(
@nombre,
@ap_paterno,
@ap_materno,
@curp,
@nombre_usuario,
@contraseña,
@empresa,
@activo
)
SELECT @@IDENTITY 
		END
ELSE 
		BEGIN
		select 'existe'
		END
GO
/****** Object:  Table [dbo].[bitacoras]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacoras](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_funcion] [int] NULL,
	[id_modulo] [int] NULL,
	[id_acciones] [int] NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_bitacoras] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[perfil_modulos_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfil_modulos_update]

@id int,
@id_usuario int,
@id_perfil int,
@id_modulo int,
@fecha date,
@hora datetime,
@activo bit
AS

UPDATE perfil_modulos 
SET 
id_usuario = @id_usuario,
id_perfil = @id_perfil,
id_modulo = @id_modulo,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfil_modulos_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfil_modulos_select]
@id int
AS
SELECT * FROM perfil_modulos WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfil_modulos_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfil_modulos_insert]
@id_usuario int,
@id_modulo int,
@id_perfil int,
@fecha date,
@hora datetime,
@activo bit
AS

INSERT INTO perfil_modulos (
id_usuario,
id_modulo,
id_perfil,
fecha,
hora,
activo
) 
VALUES (
@id_usuario,
@id_modulo,
@id_perfil,
@fecha,
@hora,
@activo
)
GO
/****** Object:  Table [dbo].[modulos_funciones]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulos_funciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_modulos] [int] NULL,
	[id_funcion] [int] NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_modulos_funciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[funciones_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[funciones_update] 
@id int,
@id_usuario int,
@id_modulos int,
@id_acciones int,
@definicion nvarchar(250),
@fecha date,
@hora datetime,
@activo bit
AS
UPDATE funciones 
SET 
id_usuario = @id_usuario,
id_modulos = @id_modulos,
id_acciones = @id_acciones,
definicion = @definicion,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[funciones_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[funciones_select] 
@id int
AS
SELECT * FROM funciones WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[funciones_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[funciones_insert]
@id_usuario int,
@id_modulos int,
@id_acciones int,
@definicion nvarchar(250),
@fecha date,
@hora datetime,
@activo bit
AS
INSERT INTO funciones (
id_usuario,
id_modulos,
id_acciones,
definicion,
fecha,
hora,
activo
) 
VALUES (
@id_usuario,
@id_modulos,
@id_acciones,
@definicion,
@fecha,
@hora,
@activo
)
GO
/****** Object:  Table [dbo].[usuario_perfiles]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario_perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_perfil] [int] NULL,
	[id_empresa] [int] NULL,
	[fecha] [date] NULL,
	[hora] [datetime] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_usuario_perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[obtener_usuarios]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtener_usuarios]
@id int,
@usuario nvarchar(50),
@contra nvarchar(50)
AS
SELECT COUNT(*) FROM usuarios WHERE 
nombre_usuario = @usuario 
OR
contrasena = @contra
OR
id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuario_perfiles_update]

@id int,
@id_usuario int,
@id_perfil int,
@id_empresa int,
@fecha date,
@hora datetime,
@activo bit

AS
UPDATE usuario_perfiles
SET 
id_usuario = @id_usuario,
id_perfil = @id_perfil,
id_empresa = @id_empresa,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuario_perfiles_select] 
@id int 
AS
SELECT * FROM usuario_perfiles
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuario_perfiles_insert]
@id_usuario int,
@id_empresa int,
@id_perfil int,
@fecha date,
@hora datetime,
@activo bit
AS
INSERT INTO usuario_perfiles (
id_usuario,
id_empresa,
id_perfil,
fecha,
hora,
activo
) 
VALUES (
@id_usuario,
@id_empresa,
@id_perfil,
@fecha,
@hora,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulo_funciones_update] 
@id int,
@id_usuario int,
@id_modulos int,
@id_funcion int,
@fecha date,
@hora datetime,
@activo bit
AS

UPDATE modulos_funciones 
SET 
id_usuario = @id_usuario,
id_modulos = @id_modulos,
id_funcion = @id_funcion,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id_usuario
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulo_funciones_select]
@id int
AS
SELECT * FROM modulos_funciones WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulo_funciones_insert]
@id_usuario int,
@id_modulos int,
@id_funcion int,
@fecha date,
@hora datetime,
@activo bit
AS
INSERT INTO modulos_funciones (
id_usuario,
id_modulos,
id_funcion,
fecha,
hora,
activo
) 
VALUES (
@id_usuario,
@id_modulos,
@id_funcion,
@fecha,
@hora,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[bitacoras_update]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bitacoras_update]
@id_usuario int,
@id int,
@id_funcion int,
@id_modulo int,
@id_acciones int,
@fecha date,
@hora datetime,
@activo bit
AS UPDATE bitacoras 
SET 
id_usuario = @id_usuario,
id_funcion = @id_funcion,
id_modulo = @id_modulo,
id_acciones = @id_acciones,
fecha = @fecha,
hora = @hora,
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[bitacoras_select]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bitacoras_select]
@id INT
AS SELECT * FROM bitacoras WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[bitacoras_insert]    Script Date: 06/04/2017 20:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bitacoras_insert]
@id_usuario int,
@id_funcion int,
@id_modulo int,
@id_acciones int,
@fecha date,
@hora datetime,
@activo bit

AS INSERT INTO bitacoras (
id_usuario,
id_funcion,
id_modulo,
id_acciones,
fecha,
hora,
activo
) 
VALUES (
@id_usuario,
@id_funcion,
@id_modulo,
@id_acciones,
@fecha,
@hora,
@activo
)
GO
/****** Object:  Default [DF_empresas_fecha]    Script Date: 06/04/2017 20:53:30 ******/
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF_empresas_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_acciones_fecha]    Script Date: 06/04/2017 20:53:30 ******/
ALTER TABLE [dbo].[acciones] ADD  CONSTRAINT [DF_acciones_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  ForeignKey [FK_usuarios_empresas]    Script Date: 06/04/2017 20:53:30 ******/
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_empresas] FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresas] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_empresas]
GO
/****** Object:  ForeignKey [FK_perfil_modulos_perfiles]    Script Date: 06/04/2017 20:53:30 ******/
ALTER TABLE [dbo].[perfil_modulos]  WITH CHECK ADD  CONSTRAINT [FK_perfil_modulos_perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfiles] ([id])
GO
ALTER TABLE [dbo].[perfil_modulos] CHECK CONSTRAINT [FK_perfil_modulos_perfiles]
GO
/****** Object:  ForeignKey [FK_funciones_acciones]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [FK_funciones_acciones] FOREIGN KEY([id_acciones])
REFERENCES [dbo].[acciones] ([id])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [FK_funciones_acciones]
GO
/****** Object:  ForeignKey [FK_funciones_modulos]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [FK_funciones_modulos] FOREIGN KEY([id_modulos])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [FK_funciones_modulos]
GO
/****** Object:  ForeignKey [FK_bitacoras_acciones]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_acciones] FOREIGN KEY([id_acciones])
REFERENCES [dbo].[acciones] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_acciones]
GO
/****** Object:  ForeignKey [FK_bitacoras_funciones]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_funciones]
GO
/****** Object:  ForeignKey [FK_bitacoras_modulos]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_modulos] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_modulos]
GO
/****** Object:  ForeignKey [FK_bitacoras_usuarios]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_usuarios]
GO
/****** Object:  ForeignKey [FK_modulos_funciones_funciones]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[modulos_funciones]  WITH CHECK ADD  CONSTRAINT [FK_modulos_funciones_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id])
GO
ALTER TABLE [dbo].[modulos_funciones] CHECK CONSTRAINT [FK_modulos_funciones_funciones]
GO
/****** Object:  ForeignKey [FK_modulos_funciones_modulos]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[modulos_funciones]  WITH CHECK ADD  CONSTRAINT [FK_modulos_funciones_modulos] FOREIGN KEY([id_modulos])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[modulos_funciones] CHECK CONSTRAINT [FK_modulos_funciones_modulos]
GO
/****** Object:  ForeignKey [FK_usuario_perfiles_perfiles]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[usuario_perfiles]  WITH CHECK ADD  CONSTRAINT [FK_usuario_perfiles_perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfiles] ([id])
GO
ALTER TABLE [dbo].[usuario_perfiles] CHECK CONSTRAINT [FK_usuario_perfiles_perfiles]
GO
/****** Object:  ForeignKey [FK_usuario_perfiles_usuarios]    Script Date: 06/04/2017 20:53:34 ******/
ALTER TABLE [dbo].[usuario_perfiles]  WITH CHECK ADD  CONSTRAINT [FK_usuario_perfiles_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[usuario_perfiles] CHECK CONSTRAINT [FK_usuario_perfiles_usuarios]
GO
