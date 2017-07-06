Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class moduloc
    Dim Cnn As New cclasecnn


#Region "Atributos"
    Dim mNombre, mDescripcion As String
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



    Public Function UsuariosInsert() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer


        Try
            cnnDatos.Command("modulos_insert")
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@descripcion", SqlDbType.VarChar, mDescripcion)


            cnnDatos.AddParameter("@id_empresa", SqlDbType.Int, mEmpresa)
            cnnDatos.AddParameter("@activo", SqlDbType.Int, mActivo)

            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function ModulosUpdate() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer

        Try
            cnnDatos.Command("modulos_update")
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@descripcion", SqlDbType.VarChar, mDescripcion)
            cnnDatos.AddParameter("@id_empresa", SqlDbType.Int, mEmpresa)
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)
            'cnnDatos.AddParameter("@activo", SqlDbType.Int, mActivo)



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
            cnnDatos.Command("modulos_estado")
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)
            cnnDatos.AddParameter("@activo", SqlDbType.Int, mActivo)



            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function
    Public Function ModuloDetalle() As DataTable
        Dim cnnDatos As New cclasecnn

        Dim Resultado As New DataTable
        Try
            cnnDatos.Command("modulos_select")
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)



            cnnDatos.GetData(Resultado)

        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return Resultado
    End Function

    Public Function ModulosAccesoUsuario() As DataTable
        Dim cnnDatos As New cclasecnn

        Dim Resultado As New DataTable
        Try
            cnnDatos.Command("validar_accesos")
            cnnDatos.AddParameter("@id_perfil", SqlDbType.Int, mIdUsuario)



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