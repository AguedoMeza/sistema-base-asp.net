Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class empresac
    Dim Cnn As New cclasecnn


#Region "Atributos"
    Dim mUsuario, mPassword, mNoEmpleado, mNombre, mApellido, mCorreo, mdireccion, mrfc, mContacto, mRazon_Social, mContact As String
    Dim midRegion, mIdUsuario, mNoRuta, mIdEmpresa, mActivo As Integer
    Dim mFecha As DateTime
    Dim mHora As DateTime





#End Region

#Region "Propiedades"
    ''' <summary>
    ''' Nombre de Usuario
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    ''' 

    Public Property Fecha As DateTime

        Get
            Return mFecha

        End Get
        Set(ByVal value As DateTime)
            mFecha = value
        End Set
    End Property
    Public Property Hora As DateTime

        Get
            Return mHora

        End Get
        Set(ByVal value As DateTime)
            mHora = value
        End Set
    End Property
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

    Public Property Contact As String
        Get
            Return mContact
        End Get
        Set(ByVal value As String)
            mContact = value
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
    Public Property Contacto As String
        Get
            Return mContacto

        End Get
        Set(ByVal value As String)
            mContacto = value
        End Set
    End Property
    Public Property RFC As String
        Get
            Return mrfc

        End Get
        Set(ByVal value As String)
            mrfc = value
        End Set
    End Property
    Public Property Direccion As String
        Get
            Return mdireccion

        End Get
        Set(ByVal value As String)
            mdireccion = value
        End Set
    End Property
    Public Property Razon_social As String
        Get
            Return mRazon_Social



        End Get
        Set(ByVal value As String)
            mRazon_Social = value
        End Set
    End Property

    ''' <summary>
    ''' Password del usuario
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    ''' 
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

    Public Property idEmpresa As Integer
        Get
            Return mIdEmpresa
        End Get
        Set(ByVal value As Integer)
            mIdEmpresa = value
        End Set
    End Property

    Public Property Activo As Integer
        Get
            Return mActivo
        End Get
        Set(ByVal value As Integer)
            mActivo = value
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

    Public Function estado() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer

        Try
            cnnDatos.Command("empresas_estado")
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)
            cnnDatos.AddParameter("@activo", SqlDbType.Int, mActivo)



            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

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



    Public Function UsuariosInsert() As Integer



        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer





        Try
            cnnDatos.Command("usuarios_insert")
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@ap_paterno", SqlDbType.VarChar, mApellido)

            cnnDatos.AddParameter("@nombre_usuario", SqlDbType.VarChar, mUsuario)
            cnnDatos.AddParameter("@contraseña", SqlDbType.VarChar, mPassword)
            cnnDatos.AddParameter("@curp", SqlDbType.Int, mNoEmpleado)

            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function UsuarioUpdate() As Integer
        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer
        Try
            cnnDatos.Command("empresas_update")
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@direccion", SqlDbType.VarChar, mApellido)
            cnnDatos.AddParameter("@rfc", SqlDbType.VarChar, mUsuario)
            cnnDatos.AddParameter("@razon_social", SqlDbType.VarChar, mPassword)
            cnnDatos.AddParameter("@contacto", SqlDbType.VarChar, mCorreo)
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)
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
            cnnDatos.Command("usuarios_select")
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

    Public Function Empresas_Insert() As Integer



        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer


        Try
            cnnDatos.Command("empresas_insert")


            cnnDatos.AddParameter("@id_usuario", SqlDbType.Int, mIdUsuario)
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@direccion", SqlDbType.VarChar, mdireccion)

            cnnDatos.AddParameter("@rfc", SqlDbType.VarChar, mrfc)
            cnnDatos.AddParameter("@razon_social", SqlDbType.VarChar, mRazon_Social)
            cnnDatos.AddParameter("@contacto", SqlDbType.VarChar, mContact)

            'cnnDatos.AddParameters.AddWithValue("@fecha", DateTimeOffset.Parse("16660902"))
            'cnnDatos.AddParameters.AddWithValue("@hora", DateTimeOffset.Parse("1:00:00"))



            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function
    'para seleccionar todos los datos de tabla Empresas
    Public Function EmpresaDetalle() As DataTable

        Dim cnnDatos As New cclasecnn

        Dim Resultado As New DataTable
        Try
            cnnDatos.Command("empresas_select")
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)
            cnnDatos.GetData(Resultado)
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return Resultado
    End Function

End Class
