﻿Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class accionesc
    Dim Cnn As New cclasecnn


#Region "Atributos"
    Dim mNombre, mDescripcion, mActividad As String
    Dim mIdUsuario, mEmpresa, mActivo As Integer

#End Region

#Region "Propiedades"
    ''' <summary>
    ''' Nombre de Usuario
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>


    Public Property Nombre As String
        Get
            Return mNombre
        End Get
        Set(ByVal value As String)
            mNombre = value
        End Set
    End Property

    Public Property Descripcion As String
        Get
            Return mDescripcion

        End Get
        Set(ByVal value As String)
            mDescripcion = value
        End Set
    End Property

    Public Property Actividad As String
        Get
            Return mActividad

        End Get
        Set(ByVal value As String)
            mActividad = value
        End Set
    End Property


    ''' <summary>
    ''' Password del usuario
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>

    Public Property Activo As Integer
        Get
            Return mActivo

        End Get
        Set(ByVal value As Integer)
            mActivo = value
        End Set
    End Property

    Public Property Empresa As Integer
        Get
            Return mEmpresa
        End Get
        Set(ByVal value As Integer)
            mEmpresa = value
        End Set
    End Property

    Public Property idUsuario As Integer
        Get
            Return mIdUsuario
        End Get
        Set(ByVal value As Integer)
            mIdUsuario = value
        End Set
    End Property
#End Region

#Region "Funciones"
    ''' <summary>
    ''' Funcion que Valida el acceso al usuario
    ''' </summary>
    ''' <returns>Regresa un areeglo de String</returns>
    ''' <remarks></remarks>



    Public Function AccionesInsert() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer


        Try
            cnnDatos.Command("acciones_insert")
            cnnDatos.AddParameter("@id_usuario", SqlDbType.Int, mIdUsuario)
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@definicion", SqlDbType.VarChar, mDescripcion)
            cnnDatos.AddParameter("@actividad", SqlDbType.VarChar, mActividad)
            cnnDatos.AddParameter("@activo", SqlDbType.Int, mActivo)

            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function AccionesUpdate() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer

        Try
            cnnDatos.Command("acciones_update")
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@definicion", SqlDbType.VarChar, mDescripcion)
            cnnDatos.AddParameter("@actividad", SqlDbType.VarChar, mActividad)
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)




            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function estado() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer

        Try
            cnnDatos.Command("acciones_estado")
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)
            cnnDatos.AddParameter("@activo", SqlDbType.Int, mActivo)



            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function
    Public Function AccionesDetalle() As DataTable
        Dim cnnDatos As New cclasecnn

        Dim Resultado As New DataTable
        Try
            cnnDatos.Command("acciones_select")
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)



            cnnDatos.GetData(Resultado)

        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return Resultado
    End Function

    Public Function UsuariosValidaInformacionCompleta(idUsuario As Integer) As String
        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As String
        Try
            cnnDatos.Command("VALIDA_USUARIO_INFO_COMPLETA")
            cnnDatos.AddParameter("@IDUSUARIO", SqlDbType.Int, idUsuario)
            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function RecordarPassword(Correo As String) As DataTable
        Dim cnnDatos As New cclasecnn

        Dim Resultado As New DataTable
        Try
            cnnDatos.Command("WORK_FLOW_RECORDAR_PASSWORD")
            cnnDatos.AddParameter("@CORREO", SqlDbType.VarChar, Correo)
            cnnDatos.GetData(Resultado)
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return Resultado

    End Function
#End Region



End Class