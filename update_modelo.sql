USE [master]
GO
/****** Object:  Database [modelo]    Script Date: 06/14/2017 15:45:23 ******/
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
/****** Object:  Table [dbo].[acciones]    Script Date: 06/14/2017 15:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[acciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_registro] [int] NULL,
	[nombre] [varchar](50) NULL,
	[definicion] [nvarchar](250) NULL,
	[actividad] [nvarchar](250) NULL,
	[fecha] [datetime] NULL,
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_acciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[empresas]    Script Date: 06/14/2017 15:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_registro] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[direccion] [nvarchar](250) NULL,
	[rfc] [nvarchar](50) NULL,
	[razon_social] [nvarchar](250) NULL,
	[contacto] [nvarchar](250) NULL,
	[fecha] [date] NULL,
	[hora] [time](3) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_empresas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfiles]    Script Date: 06/14/2017 15:45:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_registro] [int] NULL,
	[id_empresa] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion] [nvarchar](250) NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_update]    Script Date: 06/14/2017 15:45:30 ******/
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
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_select]    Script Date: 06/14/2017 15:45:30 ******/
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
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_insert]    Script Date: 06/14/2017 15:45:30 ******/
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
/****** Object:  Table [dbo].[modulos]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [int] NULL,
	[id_usuario_registro] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[descripcion_actividad] [nvarchar](250) NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_modulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[modulos_update]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulos_update] 
@id int,
--@id_usuario int,
@id_empresa int,
@nombre nvarchar(50),
@descripcion nvarchar(250)
AS

UPDATE modulos 
SET 
--id_usuario = @id_usuario,
id_empresa = @id_empresa,
nombre = @nombre,
descripcion_actividad = @descripcion
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulos_select]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulos_select]
@id int
AS
IF @id = 0
	BEGIN
	SELECT descripcion_actividad,
	mo.id AS id,
	mo.nombre,
	em.nombre AS id_empresa,
	mo.activo
	FROM modulos mo
	INNER JOIN empresas em
	ON mo.id_empresa = em.id
	END
ELSE
SELECT * FROM modulos WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulos_insert]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulos_insert]
--@id_usuario int,
@id_empresa int,
@nombre nvarchar(50),
@descripcion nvarchar(250),
@activo bit
AS
INSERT INTO modulos (
--id_usuario,
id_empresa,
nombre,
activo,
descripcion_actividad
) 
VALUES (
--@id_usuario,
@id_empresa,
@nombre,
@activo,
@descripcion
)
GO
/****** Object:  StoredProcedure [dbo].[perfiles_update]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_update]
@id int,
--@id_usuario int,
@id_empresa int,
@nombre nvarchar(50)
AS 
UPDATE perfiles 
SET 
--id_usuario = @id_usuario,
id_empresa = @id_empresa,
nombre = @nombre
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfiles_select]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_select]
@id int

AS
IF @id = 0
	BEGIN
	SELECT 
	per.id AS #,
	per.nombre AS Nombre,
    em.nombre AS Empresa,
    per.id_empresa AS id_empresa,
    per.activo AS activo
	FROM perfiles per
	INNER JOIN empresas em
	ON em.id = per.id_empresa
	END
ELSE 
    SELECT 
	per.id AS #,
	per.nombre AS Nombre,
    em.nombre AS Empresa,
    per.id_empresa AS id_empresa
	FROM perfiles per
	INNER JOIN empresas em
	ON em.id = per.id_empresa
	WHERE per.id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfiles_insert]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_insert]
--@id_usuario int,
@id_empresa int,
@nombre nvarchar(50),
@activo bit
AS
INSERT INTO perfiles (
--id_usuario,
id_empresa,
nombre,
activo
) 
VALUES (
--@id_usuario,
@id_empresa,
@nombre,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[perfiles_estado]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_estado]
@id int,
@activo int

AS

UPDATE perfiles 
SET 
activo = @activo
WHERE id = @id
GO
/****** Object:  Table [dbo].[funciones]    Script Date: 06/14/2017 15:45:30 ******/
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
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_funciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[empresas_update]    Script Date: 06/14/2017 15:45:30 ******/
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
/****** Object:  StoredProcedure [dbo].[empresas_select]    Script Date: 06/14/2017 15:45:30 ******/
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
/****** Object:  StoredProcedure [dbo].[empresas_insert]    Script Date: 06/14/2017 15:45:30 ******/
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
@contacto nvarchar(100),
@activo bit

AS
SET NOCOUNT ON
DECLARE @CONTADOR tinyint --este tipo de dato permite hasta 254
select @CONTADOR = COUNT(*) FROM empresas WHERE nombre = @nombre --se almacena select en el contador
   
if @CONTADOR = 0 --se condiciona si no existen registros repetidos
	BEGIN 
INSERT INTO empresas (
id_usuario_registro,
nombre,
direccion,
rfc,
razon_social,
contacto,
activo
) 
VALUES (
@id_usuario,
@nombre,
@direccion,
@rfc,
@razon_social,
@contacto,
@activo
) 
	SELECT @@IDENTITY 
		END
ELSE 
		BEGIN
		select 'existe'
		END
GO
/****** Object:  StoredProcedure [dbo].[empresas_estado]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[empresas_estado]
@id int,
@activo bit 
AS
UPDATE empresas
SET
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[acciones_update]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[acciones_update]
@id int,
@nombre nvarchar(50),
@definicion nvarchar(250),
@actividad nvarchar(250)
--@id_usuario int

AS
UPDATE acciones 
SET 
--id_usuario_registro = @id_usuario,
nombre = @nombre,
definicion = @definicion,
actividad = @actividad
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[acciones_select]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[acciones_select]
@id INT
AS
IF @id = 0
	BEGIN
	SELECT * FROM acciones
	END
ELSE
    SELECT * FROM acciones WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[acciones_insert]    Script Date: 06/14/2017 15:45:30 ******/
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
		id_usuario_registro,
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
/****** Object:  StoredProcedure [dbo].[acciones_estado]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[acciones_estado]
@id int,
@activo bit
AS
UPDATE acciones
SET
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulos_estado]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulos_estado]
@id int,
@activo int
AS
UPDATE modulos 
SET
activo = @activo
WHERE id = @id
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_registro] [int] NULL,
	[id_empresa] [int] NULL,
	[id_perfil] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[ap_paterno] [nvarchar](50) NULL,
	[ap_materno] [nvarchar](50) NULL,
	[curp] [nvarchar](100) NULL,
	[correo] [nvarchar](250) NULL,
	[nombre_usuario] [nvarchar](100) NULL,
	[contrasena] [nvarchar](100) NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[perfiles_detalle]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfiles_detalle](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_registro] [int] NULL,
	[id_perfil] [int] NULL,
	[id_modulo] [int] NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_perfil_modulos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[usuarios_validar]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_validar]
@correo NVARCHAR(50),
@contra NVARCHAR(50)

as
SELECT COUNT(*) FROM usuarios WHERE correo = @correo AND contrasena = @contra
GO
/****** Object:  StoredProcedure [dbo].[usuarios_update]    Script Date: 06/14/2017 15:45:30 ******/
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
@empresa int,
@correo nvarchar(50)

AS 
UPDATE usuarios  
SET 
ap_paterno = @ap_paterno,
ap_materno = @ap_paterno,
nombre_usuario = @usuario,
contrasena = @contraseña,
curp = @curp,
id_empresa = @empresa,
correo = @correo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuarios_sesion]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_sesion]
@correo nvarchar(250)
AS
SELECT * FROM usuarios WHERE correo = @correo
GO
/****** Object:  StoredProcedure [dbo].[usuarios_select]    Script Date: 06/14/2017 15:45:30 ******/
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
	us.activo AS Activo,
	us.correo AS correo
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
	us.activo AS Activo,
	us.id_empresa AS id_empresa,
	us.correo AS correo
	FROM usuarios us
	INNER JOIN empresas em
	ON us.id_empresa = em.id
	WHERE us.id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuarios_insert]    Script Date: 06/14/2017 15:45:30 ******/
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
@activo int,
@id_usuario int,
@correo nvarchar(100)

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
activo,
id_usuario_registro,
correo
) 
VALUES(
@nombre,
@ap_paterno,
@ap_materno,
@curp,
@nombre_usuario,
@contraseña,
@empresa,
@activo,
@id_usuario,
@correo
)
SELECT @@IDENTITY 
		END
ELSE 
		BEGIN
		select 'existe'
		END
GO
/****** Object:  StoredProcedure [dbo].[usuarios_estado]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_estado]
@id int,
@activo bit
AS
UPDATE usuarios
SET activo = @activo 
WHERE id = @id
GO
/****** Object:  Table [dbo].[bitacoras]    Script Date: 06/14/2017 15:45:30 ******/
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
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_update]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_detalle_update]

@id int,
--@id_usuario int,
@id_perfil int,
@id_modulo int
AS

UPDATE perfiles_detalle
SET 
--id_usuario = @id_usuario,
id_perfil = @id_perfil,
id_modulo = @id_modulo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_select]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_detalle_select]
@id int
AS
IF @id = 0
	BEGIN 
	SELECT 
	pe.id AS id,
	mo.nombre AS Modulo,
	perf.nombre AS Perfil,
	pe.activo AS activo,
	pe.id_modulo AS id_modulo
	FROM perfiles_detalle pe
	INNER JOIN modulos mo
	ON pe.id_modulo = mo.id
	INNER JOIN perfiles perf
	ON perf.id = pe.id_perfil
    END
ELSE 
    SELECT 
    id,
    id_modulo,
    id_perfil
    FROM perfiles_detalle WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_insert]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_detalle_insert]
--@id_usuario int,
@id_modulo int,
@id_perfil int,
@activo bit
AS

INSERT INTO perfiles_detalle (
--id_usuario,
id_modulo,
id_perfil,
activo
) 
VALUES (
--@id_usuario,
@id_modulo,
@id_perfil,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_estado]    Script Date: 06/14/2017 15:45:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[perfiles_detalle_estado]
@id int,
@activo bit
AS
UPDATE perfiles_detalle
SET
activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[obtener_usuarios]    Script Date: 06/14/2017 15:45:31 ******/
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
/****** Object:  Table [dbo].[modulos_funciones]    Script Date: 06/14/2017 15:45:31 ******/
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
/****** Object:  StoredProcedure [dbo].[funciones_update]    Script Date: 06/14/2017 15:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[funciones_update] 
@id int,
--@id_usuario int,
@id_modulos int,
@id_acciones int,
@definicion nvarchar(250)
AS
UPDATE funciones 
SET 
--id_usuario = @id_usuario,
id_modulos = @id_modulos,
id_acciones = @id_acciones,
definicion = @definicion
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[funciones_select]    Script Date: 06/14/2017 15:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[funciones_select] 
@id int
AS
IF @id = 0
BEGIN
SELECT 
fu.id AS id,
fu.definicion AS Definicion,
mo.nombre AS Modulos,
acc.nombre AS Acciones,
fu.activo AS activo
FROM funciones fu
INNER JOIN modulos mo
ON fu.id_modulos = mo.id
INNER JOIN acciones acc
ON acc.id = fu.id_acciones
END
ELSE 
SELECT * FROM funciones WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[funciones_insert]    Script Date: 06/14/2017 15:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[funciones_insert]
@id_usuario int,
@id_modulos int,
@id_acciones int,
@definicion nvarchar(250),
@activo bit
AS
INSERT INTO funciones (
id_usuario,
id_modulos,
id_acciones,
definicion,
activo
) 
VALUES (
@id_usuario,
@id_modulos,
@id_acciones,
@definicion,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[funciones_estado]    Script Date: 06/14/2017 15:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[funciones_estado]
@id int,
@activo bit
AS
UPDATE funciones 
SET activo = @activo
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_update]    Script Date: 06/14/2017 15:45:31 ******/
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
/****** Object:  StoredProcedure [dbo].[modulo_funciones_select]    Script Date: 06/14/2017 15:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulo_funciones_select]
@id int
AS
IF @id = 0
BEGIN
SELECT
mo.nombre AS Modulos,
mofu.id AS id,
fun.definicion AS Funciones,
mofu.activo AS activo

FROM modulos_funciones mofu
INNER JOIN modulos mo
ON mo.id = mofu.id_modulos

INNER JOIN funciones fun
ON fun.id = mofu.id_funcion
END
ELSE
SELECT * FROM modulos_funciones WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_insert]    Script Date: 06/14/2017 15:45:31 ******/
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
/****** Object:  StoredProcedure [dbo].[bitacoras_update]    Script Date: 06/14/2017 15:45:31 ******/
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
/****** Object:  StoredProcedure [dbo].[bitacoras_select]    Script Date: 06/14/2017 15:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bitacoras_select]
@id INT
AS SELECT * FROM bitacoras WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[bitacoras_insert]    Script Date: 06/14/2017 15:45:31 ******/
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
/****** Object:  Default [DF_acciones_fecha]    Script Date: 06/14/2017 15:45:26 ******/
ALTER TABLE [dbo].[acciones] ADD  CONSTRAINT [DF_acciones_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_acciones_hora]    Script Date: 06/14/2017 15:45:26 ******/
ALTER TABLE [dbo].[acciones] ADD  CONSTRAINT [DF_acciones_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_empresas_fecha]    Script Date: 06/14/2017 15:45:26 ******/
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF_empresas_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_empresas_hora]    Script Date: 06/14/2017 15:45:26 ******/
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF_empresas_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_perfiles_fecha]    Script Date: 06/14/2017 15:45:26 ******/
ALTER TABLE [dbo].[perfiles] ADD  CONSTRAINT [DF_perfiles_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_perfiles_hora]    Script Date: 06/14/2017 15:45:26 ******/
ALTER TABLE [dbo].[perfiles] ADD  CONSTRAINT [DF_perfiles_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_modulos_fecha]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[modulos] ADD  CONSTRAINT [DF_modulos_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_modulos_hora]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[modulos] ADD  CONSTRAINT [DF_modulos_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_funciones_fecha]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[funciones] ADD  CONSTRAINT [DF_funciones_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_funciones_hora]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[funciones] ADD  CONSTRAINT [DF_funciones_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_usuarios_fecha]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_usuarios_hora]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_perfiles_detalle_fecha]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[perfiles_detalle] ADD  CONSTRAINT [DF_perfiles_detalle_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_perfiles_detalle_hora]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[perfiles_detalle] ADD  CONSTRAINT [DF_perfiles_detalle_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  ForeignKey [FK_funciones_acciones]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [FK_funciones_acciones] FOREIGN KEY([id_acciones])
REFERENCES [dbo].[acciones] ([id])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [FK_funciones_acciones]
GO
/****** Object:  ForeignKey [FK_funciones_modulos]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [FK_funciones_modulos] FOREIGN KEY([id_modulos])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [FK_funciones_modulos]
GO
/****** Object:  ForeignKey [FK_usuarios_empresas]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_empresas] FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresas] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_empresas]
GO
/****** Object:  ForeignKey [FK_perfil_modulos_perfiles]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[perfiles_detalle]  WITH CHECK ADD  CONSTRAINT [FK_perfil_modulos_perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfiles] ([id])
GO
ALTER TABLE [dbo].[perfiles_detalle] CHECK CONSTRAINT [FK_perfil_modulos_perfiles]
GO
/****** Object:  ForeignKey [FK_bitacoras_acciones]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_acciones] FOREIGN KEY([id_acciones])
REFERENCES [dbo].[acciones] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_acciones]
GO
/****** Object:  ForeignKey [FK_bitacoras_funciones]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_funciones]
GO
/****** Object:  ForeignKey [FK_bitacoras_modulos]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_modulos] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_modulos]
GO
/****** Object:  ForeignKey [FK_bitacoras_usuarios]    Script Date: 06/14/2017 15:45:30 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_usuarios]
GO
/****** Object:  ForeignKey [FK_modulos_funciones_funciones]    Script Date: 06/14/2017 15:45:31 ******/
ALTER TABLE [dbo].[modulos_funciones]  WITH CHECK ADD  CONSTRAINT [FK_modulos_funciones_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id])
GO
ALTER TABLE [dbo].[modulos_funciones] CHECK CONSTRAINT [FK_modulos_funciones_funciones]
GO
/****** Object:  ForeignKey [FK_modulos_funciones_modulos]    Script Date: 06/14/2017 15:45:31 ******/
ALTER TABLE [dbo].[modulos_funciones]  WITH CHECK ADD  CONSTRAINT [FK_modulos_funciones_modulos] FOREIGN KEY([id_modulos])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[modulos_funciones] CHECK CONSTRAINT [FK_modulos_funciones_modulos]
GO
