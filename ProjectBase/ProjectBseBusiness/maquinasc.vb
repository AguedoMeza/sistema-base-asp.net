Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient


Public Class maquinasc
    Dim Cnn As New cclasecnn


#Region "Atributos"
    Dim mNombre, mSerie As String
    Dim mIdUsuario, mLinea, mActivo As Integer

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

    Public Property Serie As String
        Get
            Return mSerie
        End Get
        Set(ByVal value As String)
            mSerie = value
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

    Public Property Linea As Integer
        Get
            Return mLinea
        End Get
        Set(ByVal value As Integer)
            mLinea = value
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



    Public Function MaquinasInsert() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer


        Try
            cnnDatos.Command("maquinas_insert")
            cnnDatos.AddParameter("@id_linea", SqlDbType.Int, mLinea)
            cnnDatos.AddParameter("@nombre", SqlDbType.VarChar, mNombre)
            cnnDatos.AddParameter("@serie", SqlDbType.VarChar, mSerie)


            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function

    Public Function ModulosFuncionesUpdate() As Integer

        Dim cnnDatos As New cclasecnn

        Dim refIdUsuario As Integer

        Try
            cnnDatos.Command("modulo_funciones_update")
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
            cnnDatos.Command("mf_estado")
            cnnDatos.AddParameter("@id", SqlDbType.Int, mIdUsuario)
            cnnDatos.AddParameter("@activo", SqlDbType.Int, mActivo)



            refIdUsuario = cnnDatos.GetString
        Catch ex As Exception
            Throw cnnDatos.ErrorIT
        End Try
        Return refIdUsuario
    End Function
    Public Function MaquinaDetalle() As DataTable
        Dim cnnDatos As New cclasecnn

        Dim Resultado As New DataTable
        Try
            cnnDatos.Command("maquinas_select")
            cnnDatos.AddParameter("@id_linea", SqlDbType.Int, mIdUsuario)



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