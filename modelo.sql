USE [master]
GO
/****** Object:  Database [modelo]    Script Date: 06/26/2017 18:05:21 ******/
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
/****** Object:  Table [dbo].[usuarios_perfiles]    Script Date: 06/26/2017 18:05:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_registro] [int] NULL,
	[id_usuario] [int] NULL,
	[id_perfil] [int] NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_usuarios_perfiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[usuarios_perfiles] ON
INSERT [dbo].[usuarios_perfiles] ([id], [id_usuario_registro], [id_usuario], [id_perfil], [fecha], [hora], [activo]) VALUES (1, 1, 1, 1, CAST(0xEE3C0B00 AS Date), CAST(0x07006030308F0000 AS Time), 1)
INSERT [dbo].[usuarios_perfiles] ([id], [id_usuario_registro], [id_usuario], [id_perfil], [fecha], [hora], [activo]) VALUES (2, 1, 1, 1, CAST(0xF23C0B00 AS Date), CAST(0x07E03890709F0000 AS Time), 1)
SET IDENTITY_INSERT [dbo].[usuarios_perfiles] OFF
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_select]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  Table [dbo].[acciones]    Script Date: 06/26/2017 18:05:32 ******/
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
SET IDENTITY_INSERT [dbo].[acciones] ON
INSERT [dbo].[acciones] ([id], [id_usuario_registro], [nombre], [definicion], [actividad], [fecha], [hora], [activo]) VALUES (1, 1, N'insertar', N'captura insertar', N'validar insertar', CAST(0x0000A79301029372 AS DateTime), CAST(0x07C09BBE84830000 AS Time), 1)
INSERT [dbo].[acciones] ([id], [id_usuario_registro], [nombre], [definicion], [actividad], [fecha], [hora], [activo]) VALUES (2, 1, N'update', N'lanzar update', N'actualizar', CAST(0x0000A7990117B0C7 AS DateTime), CAST(0x0720E209428E0000 AS Time), 0)
SET IDENTITY_INSERT [dbo].[acciones] OFF
/****** Object:  Table [dbo].[empresas]    Script Date: 06/26/2017 18:05:32 ******/
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
SET IDENTITY_INSERT [dbo].[empresas] ON
INSERT [dbo].[empresas] ([id], [id_usuario_registro], [nombre], [direccion], [rfc], [razon_social], [contacto], [fecha], [hora], [activo]) VALUES (1, 1, N'SOFTEAM', N'Queretaro', N'#0987', N'Software', N'Ing. Miguel', CAST(0xEE3C0B00 AS Date), CAST(0x036AD25603000000 AS Time), 1)
INSERT [dbo].[empresas] ([id], [id_usuario_registro], [nombre], [direccion], [rfc], [razon_social], [contacto], [fecha], [hora], [activo]) VALUES (2, 1, N'BSD', N'Monterrey', N'#765', N'Software', N'Filemon', CAST(0xF03C0B00 AS Date), CAST(0x031295F602000000 AS Time), 0)
INSERT [dbo].[empresas] ([id], [id_usuario_registro], [nombre], [direccion], [rfc], [razon_social], [contacto], [fecha], [hora], [activo]) VALUES (3, 1, N'Brounie', N'Queretaro', N'#9876', N'Software', N'Arturo Jamaica', CAST(0xF03C0B00 AS Date), CAST(0x0383A31003000000 AS Time), 1)
SET IDENTITY_INSERT [dbo].[empresas] OFF
/****** Object:  Table [dbo].[modulos]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [int] NULL,
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
SET IDENTITY_INSERT [dbo].[modulos] ON
INSERT [dbo].[modulos] ([id], [id_empresa], [nombre], [descripcion_actividad], [fecha], [hora], [activo]) VALUES (1, 1, N'Login', N'acceso a usuarios', CAST(0xEE3C0B00 AS Date), CAST(0x079043270E830000 AS Time), 1)
INSERT [dbo].[modulos] ([id], [id_empresa], [nombre], [descripcion_actividad], [fecha], [hora], [activo]) VALUES (3, 3, N'Usuarios', N'Altas', CAST(0xF33C0B00 AS Date), CAST(0x07A0FBCDB5C60000 AS Time), 1)
SET IDENTITY_INSERT [dbo].[modulos] OFF
/****** Object:  Table [dbo].[perfiles]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[perfiles] ON
INSERT [dbo].[perfiles] ([id], [id_empresa], [nombre], [descripcion], [fecha], [hora], [activo]) VALUES (1, 1, N'administrador', NULL, CAST(0xEE3C0B00 AS Date), CAST(0x07D041F8B2830000 AS Time), 0)
INSERT [dbo].[perfiles] ([id], [id_empresa], [nombre], [descripcion], [fecha], [hora], [activo]) VALUES (4, 3, N'Invitado', NULL, CAST(0xF43C0B00 AS Date), CAST(0x07F0ADA552AA0000 AS Time), 0)
SET IDENTITY_INSERT [dbo].[perfiles] OFF
/****** Object:  StoredProcedure [dbo].[modulos_update]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[modulos_select]    Script Date: 06/26/2017 18:05:32 ******/
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
ELSE IF @id = 100
BEGIN
SELECT * FROM modulos WHERE activo = 1
END
ELSE
BEGIN
SELECT descripcion_actividad,
	mo.id AS id,
	mo.nombre,
	em.nombre AS id_empresa,
	mo.activo,
	mo.id_empresa AS id_emp
	FROM modulos mo
	INNER JOIN empresas em
	ON mo.id_empresa = em.id
WHERE mo.id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[modulos_insert]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  Table [dbo].[funciones]    Script Date: 06/26/2017 18:05:32 ******/
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
SET IDENTITY_INSERT [dbo].[funciones] ON
INSERT [dbo].[funciones] ([id], [id_usuario], [id_modulos], [id_acciones], [definicion], [fecha], [hora], [activo]) VALUES (1, 1, 1, 1, N'validar', CAST(0xEE3C0B00 AS Date), CAST(0x07B04FF095830000 AS Time), 0)
SET IDENTITY_INSERT [dbo].[funciones] OFF
/****** Object:  StoredProcedure [dbo].[empresas_update]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[empresas_select]    Script Date: 06/26/2017 18:05:32 ******/
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
ELSE IF @id = 100
    BEGIN
     SELECT * FROM empresas WHERE activo = 1
   
    END
    ELSE
    BEGIN
    SELECT * FROM empresas WHERE id = @id
    END
GO
/****** Object:  StoredProcedure [dbo].[empresas_insert]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[empresas_estado]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[acciones_update]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[acciones_select]    Script Date: 06/26/2017 18:05:32 ******/
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
	ELSE IF @id = 100
	BEGIN
		SELECT * FROM acciones WHERE activo = 1
	END
	ELSE
	BEGIN
	    SELECT * FROM acciones WHERE id = @id
    END
GO
/****** Object:  StoredProcedure [dbo].[acciones_insert]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[acciones_estado]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  Table [dbo].[perfiles_detalle]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[perfiles_detalle](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
SET IDENTITY_INSERT [dbo].[perfiles_detalle] ON
INSERT [dbo].[perfiles_detalle] ([id], [id_perfil], [id_modulo], [fecha], [hora], [activo]) VALUES (1, 1, 1, CAST(0xEE3C0B00 AS Date), CAST(0x0790CB02BE830000 AS Time), 1)
SET IDENTITY_INSERT [dbo].[perfiles_detalle] OFF
/****** Object:  StoredProcedure [dbo].[perfiles_update]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[perfiles_select]    Script Date: 06/26/2017 18:05:32 ******/
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
ELSE IF @id = 100
BEGIN 
SELECT * FROM perfiles WHERE activo = 1
END
ELSE
BEGIN
    SELECT 
	per.id AS #,
	per.nombre AS Nombre,
    em.nombre AS Empresa,
    per.id_empresa AS id_empresa,
    em.activo AS Activo
	FROM perfiles per
	INNER JOIN empresas em
	ON em.id = per.id_empresa
	WHERE per.id = @id
	END
GO
/****** Object:  StoredProcedure [dbo].[perfiles_insert]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[perfiles_estado]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  Table [dbo].[usuarios]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_registro] [int] NULL,
	[id_empresa] [int] NULL,
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
SET IDENTITY_INSERT [dbo].[usuarios] ON
INSERT [dbo].[usuarios] ([id], [id_usuario_registro], [id_empresa], [nombre], [ap_paterno], [ap_materno], [curp], [correo], [nombre_usuario], [contrasena], [fecha], [hora], [activo]) VALUES (1, 1, 2, N'jose', N'serna', N'serna', N'SEMA97', N'aguedo@hotmail.com', N'aguedo', N'123', CAST(0xEE3C0B00 AS Date), CAST(0x07B024F58A820000 AS Time), 1)
SET IDENTITY_INSERT [dbo].[usuarios] OFF
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_update]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuario_perfiles_update]

@id int,
@id_usuario int,
@id_perfil int

AS
UPDATE usuarios_perfiles
SET 
id_usuario = @id_usuario,
id_perfil = @id_perfil
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuarios_pefiles_estado]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_pefiles_estado]
@id int,
@activo bit
AS
UPDATE usuarios_perfiles
SET
activo = @activo WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulos_estado]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[usuario_perfiles_insert]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuario_perfiles_insert]
@id_usuario_registro int,
@id_usuario int,
@id_perfil int,
@activo bit
AS
INSERT INTO usuarios_perfiles (
id_usuario_registro,
id_usuario,
id_perfil,
activo
) 
VALUES (
@id_usuario_registro,
@id_usuario,
@id_perfil,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[usuarios_validar]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[usuarios_update]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[usuarios_sesion]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_sesion]
@correo nvarchar(250)
AS
SELECT * FROM usuarios WHERE correo = @correo
GO
/****** Object:  StoredProcedure [dbo].[usuarios_select]    Script Date: 06/26/2017 18:05:32 ******/
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
ELSE IF @id = 100
	BEGIN 
	SELECT * FROM usuarios WHERE activo = 1
	END
ELSE 
BEGIN
SELECT us.id AS #,(us.nombre + '  ' + ap_paterno + '  ' + ap_materno) as Persona,
    us.nombre AS Nombre,
    us.ap_paterno AS Ap_Paterno,
    us.ap_materno AS Ap_Materno,
	curp AS CURP,
	em.nombre AS Empresa,
	nombre_usuario AS Usuario,
	us.activo AS Activo,
	us.id_empresa AS id_empresa,
	us.correo AS correo,
	us.contrasena AS Contraseña,
	em.activo AS Activo
	FROM usuarios us
	INNER JOIN empresas em
	ON us.id_empresa = em.id
	WHERE us.id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[usuarios_perfiles_select]    Script Date: 06/26/2017 18:05:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarios_perfiles_select]
@id int
AS
IF @id = 0
	BEGIN
	SELECT 
	us.id,
	per.nombre AS Perfil,
	usu.nombre_usuario AS Usuario,
	us.activo
	FROM usuarios_perfiles us
	INNER JOIN perfiles per
	ON us.id_perfil = per.id
	INNER JOIN usuarios usu
	ON us.id_usuario = usu.id
	END
ELSE
	SELECT 
	us.id,
	per.nombre AS Perfil,
	usu.nombre_usuario AS Usuario,
	us.activo,
	us.id_usuario AS id_usuario,
	us.id_perfil AS id_perfil,
	usu.activo AS Activo,
	per.activo AS Activo_perfil
	
	FROM usuarios_perfiles us
	INNER JOIN perfiles per
	ON us.id_perfil = per.id
	INNER JOIN usuarios usu
	ON us.id_usuario = usu.id
	WHERE us.id = @id
GO
/****** Object:  StoredProcedure [dbo].[usuarios_insert]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[usuarios_estado]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_update]    Script Date: 06/26/2017 18:05:32 ******/
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
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_select]    Script Date: 06/26/2017 18:05:33 ******/
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
	pe.id AS id,
	mo.nombre AS Modulo,
	perf.nombre AS Perfil,
	pe.activo AS activo,
	pe.id_modulo AS id_modulo,
	pe.id_perfil AS id_perfil
	
	FROM perfiles_detalle pe
	INNER JOIN modulos mo
	ON pe.id_modulo = mo.id
	INNER JOIN perfiles perf
	ON perf.id = pe.id_perfil
    WHERE pe.id  = @id
GO
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_insert]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  StoredProcedure [dbo].[perfiles_detalle_estado]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  StoredProcedure [dbo].[funciones_update]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  StoredProcedure [dbo].[funciones_select]    Script Date: 06/26/2017 18:05:33 ******/
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
ELSE IF @id = 100
BEGIN
SELECT * FROM funciones WHERE activo = 1
END
ELSE
BEGIN
SELECT 
fu.id AS id,
fu.definicion AS Definicion,
mo.nombre AS Modulos,
acc.nombre AS Acciones,
fu.activo AS activo,
fu.id_modulos AS id_modulos,
fu.id_acciones AS id_acciones
FROM funciones fu
INNER JOIN modulos mo
ON fu.id_modulos = mo.id
INNER JOIN acciones acc
ON acc.id = fu.id_acciones 
WHERE fu.id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[funciones_insert]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  StoredProcedure [dbo].[funciones_estado]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  Table [dbo].[bitacoras]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  StoredProcedure [dbo].[obtener_usuarios]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  Table [dbo].[modulos_funciones]    Script Date: 06/26/2017 18:05:33 ******/
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
	[hora] [time](7) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_modulos_funciones] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[modulos_funciones] ON
INSERT [dbo].[modulos_funciones] ([id], [id_usuario], [id_modulos], [id_funcion], [fecha], [hora], [activo]) VALUES (1, 1, 1, 1, NULL, NULL, 0)
INSERT [dbo].[modulos_funciones] ([id], [id_usuario], [id_modulos], [id_funcion], [fecha], [hora], [activo]) VALUES (2, 1, 1, 1, CAST(0xEE3C0B00 AS Date), CAST(0x0730C6F979860000 AS Time), 1)
INSERT [dbo].[modulos_funciones] ([id], [id_usuario], [id_modulos], [id_funcion], [fecha], [hora], [activo]) VALUES (3, 1, 1, 1, CAST(0xEE3C0B00 AS Date), CAST(0x07A0A0D49C890000 AS Time), 0)
SET IDENTITY_INSERT [dbo].[modulos_funciones] OFF
/****** Object:  StoredProcedure [dbo].[modulo_funciones_update]    Script Date: 06/26/2017 18:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulo_funciones_update] 
@id int,
@id_modulos int,
@id_funcion int
AS

UPDATE modulos_funciones 
SET 
id_modulos = @id_modulos,
id_funcion = @id_funcion
WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_select]    Script Date: 06/26/2017 18:05:33 ******/
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
SELECT
mo.nombre AS Modulos,
mofu.id AS id,
mofu.id_modulos AS id_modulos,
mofu.id_funcion AS id_funcion,
fun.definicion AS Funciones,
mofu.activo AS activo
FROM modulos_funciones mofu
INNER JOIN modulos mo
ON mo.id = mofu.id_modulos
INNER JOIN funciones fun
ON fun.id = mofu.id_funcion
WHERE mofu.id = @id
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_insert]    Script Date: 06/26/2017 18:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulo_funciones_insert]
@id_usuario int,
@id_modulos int,
@id_funcion int,
@activo bit
AS
INSERT INTO modulos_funciones (
id_usuario,
id_modulos,
id_funcion,
activo
) 
VALUES (
@id_usuario,
@id_modulos,
@id_funcion,
@activo
)
GO
/****** Object:  StoredProcedure [dbo].[modulo_funciones_estado]    Script Date: 06/26/2017 18:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modulo_funciones_estado]
@id int,
@activo bit
AS
UPDATE modulos_funciones
SET
activo = @activo WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[mf_estado]    Script Date: 06/26/2017 18:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[mf_estado]
@id int,
@activo bit
AS
UPDATE modulos_funciones
SET activo = @activo WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[bitacoras_update]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  StoredProcedure [dbo].[bitacoras_select]    Script Date: 06/26/2017 18:05:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[bitacoras_select]
@id INT
AS SELECT * FROM bitacoras WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[bitacoras_insert]    Script Date: 06/26/2017 18:05:33 ******/
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
/****** Object:  Default [DF_usuarios_perfiles_fecha]    Script Date: 06/26/2017 18:05:25 ******/
ALTER TABLE [dbo].[usuarios_perfiles] ADD  CONSTRAINT [DF_usuarios_perfiles_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_usuarios_perfiles_hora]    Script Date: 06/26/2017 18:05:25 ******/
ALTER TABLE [dbo].[usuarios_perfiles] ADD  CONSTRAINT [DF_usuarios_perfiles_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_acciones_fecha]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[acciones] ADD  CONSTRAINT [DF_acciones_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_acciones_hora]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[acciones] ADD  CONSTRAINT [DF_acciones_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_empresas_fecha]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF_empresas_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_empresas_hora]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[empresas] ADD  CONSTRAINT [DF_empresas_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_modulos_fecha]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[modulos] ADD  CONSTRAINT [DF_modulos_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_modulos_hora]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[modulos] ADD  CONSTRAINT [DF_modulos_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_perfiles_fecha]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[perfiles] ADD  CONSTRAINT [DF_perfiles_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_perfiles_hora]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[perfiles] ADD  CONSTRAINT [DF_perfiles_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_funciones_fecha]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[funciones] ADD  CONSTRAINT [DF_funciones_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_funciones_hora]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[funciones] ADD  CONSTRAINT [DF_funciones_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_perfiles_detalle_fecha]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[perfiles_detalle] ADD  CONSTRAINT [DF_perfiles_detalle_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_perfiles_detalle_hora]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[perfiles_detalle] ADD  CONSTRAINT [DF_perfiles_detalle_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_usuarios_fecha]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_usuarios_hora]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[usuarios] ADD  CONSTRAINT [DF_usuarios_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  Default [DF_modulos_funciones_fecha]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[modulos_funciones] ADD  CONSTRAINT [DF_modulos_funciones_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
/****** Object:  Default [DF_modulos_funciones_hora]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[modulos_funciones] ADD  CONSTRAINT [DF_modulos_funciones_hora]  DEFAULT (getdate()) FOR [hora]
GO
/****** Object:  ForeignKey [FK_usuarios_perfiles_perfiles]    Script Date: 06/26/2017 18:05:25 ******/
ALTER TABLE [dbo].[usuarios_perfiles]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_perfiles_perfiles] FOREIGN KEY([id])
REFERENCES [dbo].[usuarios_perfiles] ([id])
GO
ALTER TABLE [dbo].[usuarios_perfiles] CHECK CONSTRAINT [FK_usuarios_perfiles_perfiles]
GO
/****** Object:  ForeignKey [FK_funciones_acciones]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [FK_funciones_acciones] FOREIGN KEY([id_acciones])
REFERENCES [dbo].[acciones] ([id])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [FK_funciones_acciones]
GO
/****** Object:  ForeignKey [FK_funciones_modulos]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[funciones]  WITH CHECK ADD  CONSTRAINT [FK_funciones_modulos] FOREIGN KEY([id_modulos])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[funciones] CHECK CONSTRAINT [FK_funciones_modulos]
GO
/****** Object:  ForeignKey [FK_perfil_modulos_perfiles]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[perfiles_detalle]  WITH CHECK ADD  CONSTRAINT [FK_perfil_modulos_perfiles] FOREIGN KEY([id_perfil])
REFERENCES [dbo].[perfiles] ([id])
GO
ALTER TABLE [dbo].[perfiles_detalle] CHECK CONSTRAINT [FK_perfil_modulos_perfiles]
GO
/****** Object:  ForeignKey [FK_usuarios_empresas]    Script Date: 06/26/2017 18:05:32 ******/
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_usuarios_empresas] FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresas] ([id])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_usuarios_empresas]
GO
/****** Object:  ForeignKey [FK_bitacoras_acciones]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_acciones] FOREIGN KEY([id_acciones])
REFERENCES [dbo].[acciones] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_acciones]
GO
/****** Object:  ForeignKey [FK_bitacoras_funciones]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_funciones]
GO
/****** Object:  ForeignKey [FK_bitacoras_modulos]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_modulos] FOREIGN KEY([id_modulo])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_modulos]
GO
/****** Object:  ForeignKey [FK_bitacoras_usuarios]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[bitacoras]  WITH CHECK ADD  CONSTRAINT [FK_bitacoras_usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[bitacoras] CHECK CONSTRAINT [FK_bitacoras_usuarios]
GO
/****** Object:  ForeignKey [FK_modulos_funciones_funciones]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[modulos_funciones]  WITH CHECK ADD  CONSTRAINT [FK_modulos_funciones_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funciones] ([id])
GO
ALTER TABLE [dbo].[modulos_funciones] CHECK CONSTRAINT [FK_modulos_funciones_funciones]
GO
/****** Object:  ForeignKey [FK_modulos_funciones_modulos]    Script Date: 06/26/2017 18:05:33 ******/
ALTER TABLE [dbo].[modulos_funciones]  WITH CHECK ADD  CONSTRAINT [FK_modulos_funciones_modulos] FOREIGN KEY([id_modulos])
REFERENCES [dbo].[modulos] ([id])
GO
ALTER TABLE [dbo].[modulos_funciones] CHECK CONSTRAINT [FK_modulos_funciones_modulos]
GO
