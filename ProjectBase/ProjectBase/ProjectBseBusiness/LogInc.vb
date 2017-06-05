Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class LogInc
    Dim Cnn As New cclasecnn


#Region "Atributos"
    Dim mUsuario, mPassword, mNombre, mApellido, mCorreo As String
    Dim mNoEmpleado, midRegion, mIdUsuario, mNoRuta As Integer

#End Region

#Region "Propiedades"
    ''' <summary>
    ''' Nombre de Usuario
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Usuaio As String
        Get
            Return mUsuario
        End Get
        Set(ByVal value As String)
            mUsuario = value
        End Set
    End Property

    Public Property Nombre As String
        Get
            Return mNombre
        End Get
        Set(ByVal value As String)
            mNombre = value
        End Set
    End Property

    Public Property Apellido As String
        Get
            Return mApellido
        End Get
        Set(ByVal value As String)
            mApellido = value
        End Set
    End Property

    Public Property Correo As String
        Get
            Return mCorreo
        End Get
        Set(ByVal value As String)
            mCorreo = value
        End Set
    End Property

    ''' <summary>
    ''' Password del usuario
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Property Password As String
        Get
            Return mPassword
        End Get
        Set(ByVal value As String)
            mPassword = value
        End Set
    End Property

    Public Property NoEmpleado As String
        Get
            Return mNoEmpleado
        End Get
        Set(ByVal value As String)
            mNoEmpleado = value
        End Set
    End Property



    Public Property idREgion As Integer
        Get
            Return midRegion
        End Get
        Set(ByVal value As Integer)
            midRegion = value
        End Set
    End Property

    Public Property NoRuta As Integer
        Get
            Return mNoRuta
        End Get
        Set(ByVal value As Integer)
            mNoRuta = value
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
    Public Function ValidaUsuario() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer

        Try
            cnnDatos.Command("usuarios_validar")
            cnnDatos.AddParameter("@usuario", SqlDbType.VarChar, mUsuario)
            cnnDatos.AddParameter("@contra", SqlDbType.VarChar, mPassword)
            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function UsuariosInsert() As String
        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As String
        Try
            cnnDatos.Command("USUARIOS_INSERT")
            cnnDatos.AddParameter("@CUSR_NOMBRE", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@CUSR_APPELLIDOS", SqlDbType.VarChar, mApellido)
            cnnDatos.AddParameter("@CUSR_USUARIO", SqlDbType.VarChar, mUsuario)
            cnnDatos.AddParameter("@CUSR_PASSWORD", SqlDbType.VarChar, mPassword)
            cnnDatos.AddParameter("@CUSR_CORREO", SqlDbType.VarChar, mCorreo)
            cnnDatos.AddParameter("@NUSR_NOASOCIADO", SqlDbType.Int, mNoEmpleado)
            cnnDatos.AddParameter("@NREG_IDREGION", SqlDbType.Int, midRegion)
            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function UsuarioUpdate() As String
        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As String
        Try
            cnnDatos.Command("USUARIOS_UPDATE")
            cnnDatos.AddParameter("@CUSR_NOMBRE", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@CUSR_APPELLIDOS", SqlDbType.VarChar, mApellido)
            cnnDatos.AddParameter("@CUSR_USUARIO", SqlDbType.VarChar, mUsuario)
            cnnDatos.AddParameter("@CUSR_PASSWORD", SqlDbType.VarChar, mPassword)
            cnnDatos.AddParameter("@CUSR_CORREO", SqlDbType.VarChar, mCorreo)
            cnnDatos.AddParameter("@NUSR_NOASOCIADO", SqlDbType.Int, mNoEmpleado)
            cnnDatos.AddParameter("@NREG_IDREGION", SqlDbType.Int, midRegion)
            cnnDatos.AddParameter("@IDUSUARIO", SqlDbType.Int, mIdUsuario)
            cnnDatos.AddParameter("@NORUTA", SqlDbType.Int, mNoRuta)
            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function UsuarioDetalle() As DataTable
        Dim cnnDatos As New cclasecnn

        Dim Resultado As New DataTable
        Try
            cnnDatos.Command("USUARIO_DETALLE")
            cnnDatos.AddParameter("@NOEMPLEADO", SqlDbType.Int, mIdUsuario)
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