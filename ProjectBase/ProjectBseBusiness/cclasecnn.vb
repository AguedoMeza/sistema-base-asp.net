Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Public Class cclasecnn

#Region "Configuracion"
    'Dim connectionString As String = "Data Source=db202.my-hosting-panel.com;Initial Catalog=wwyadmin_tlatlaniP;Persist Security Info=True;User ID=wwyadmin_usrtlatlani;Password=mars4all"
    'Dim connectionString As String = "Data Source=LMXMTYGSLDPX1\SQL2005;Initial Catalog=OUTWORK;Persist Security Info=True;User ID=sa;Password=mars4all"
    'Dim connectionString As String = "Data Source=10.110.8.15;Initial Catalog=FWORK_PROD;Persist Security Info=True;User ID=sa;Password=mexico13"
    'Dim connectionString As String = "Data Source=AGUEDO-PC\SQLEXPRESS;Initial Catalog=modelo;Integrated Security=True"
    'Dim connectionString As String = Configuration.ConfigurationSettings.AppSettings("modeloConnectionString") '"Data Source=10.110.8.15;Initial Catalog=FW;Persist Security Info=True;User ID=sa;Password=mexico13"
    'Dim connectionString As String = "Data Source=MTYS11;Initial Catalog=FW;Persist Security Info=True;User ID=FW;Password=mars4all"
    'Dim connectionString As String = "Data Source=MTYS11;Initial Catalog=FWork_produccion;Persist Security Info=True;User ID=FW;Password=mars4all"
    'Dim connectionString As String = "Password=Cl0udT31m3X;Persist Security Info=True;User ID=sa;Initial Catalog=FW;Data Source=SISTEMAS-1-1"


    'Nueva Cadena de Conexion, para utilizar solo la del WEB.config sin volver a declarar datos de nuestro servidor-----Agregado por Aguedo"
    Dim connectionString As String = ConfigurationManager.ConnectionStrings("modeloConnectionString").ConnectionString

    'COMENTARIO
#End Region

#Region "Variables"
    Dim exException As Exception
    Dim strMsj As String = ""
#End Region

#Region "Propiedades"
    Public ReadOnly Property ErrorIT() As Exception
        Get
            Return exException
        End Get
    End Property
#End Region

#Region "Conexion"
    Dim cnn As New SqlConnection(connectionString)
    Dim sqlTransaction As SqlTransaction
    Dim sqlAdapter As SqlDataAdapter
    Dim cmd As SqlCommand

    ''' <summary>
    ''' Metodo que abre la conexion a datos
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub OpenConnection()
        cnn.Open()
    End Sub
    '''' <summary>
    '''' Metodo que inicia la transaccion de datos
    '''' </summary>
    '''' <remarks></remarks>
    'Sub IniciarTransaccion()
    '    sqlTransaccion = cnn.BeginTransaction()
    'End Sub
    '''' <summary>
    '''' Metodo que confirma la transaccion de datos
    '''' </summary>
    '''' <remarks></remarks>
    'Sub CommitTransaccion()
    '    sqlTransaccion.Commit()
    'End Sub
    '''' <summary>
    '''' Metodo que cancela la transaccion de datos
    '''' </summary>
    '''' <remarks></remarks>
    'Sub RollBackTransaction()
    '    sqlTransaccion.Rollback()
    'End Sub
    ''' <summary>
    ''' Metodo que cierra la conexion a datos
    ''' </summary>
    ''' <remarks></remarks>
    Private Sub CloseConnection()
        cnn.Close()
    End Sub

#End Region

#Region "Constructor"
    ''' <summary>
    '''  StoredProcedure a ejecutar
    ''' </summary>
    ''' <param name="NombreProcedimiento"></param>
    ''' <remarks></remarks>
    Public Sub Command(ByVal NombreProcedimiento As String)
        cmd = New SqlCommand(NombreProcedimiento, cnn)
    End Sub
#End Region

#Region "AgregaParametros"
    ''' <summary>
    ''' Metodo que agrega los parametros que pertenecen al StoredProcedure
    ''' </summary>
    ''' <param name="NombreParametro"></param>
    ''' <param name="SqlDbType"></param>
    ''' <param name="Valor"></param>
    ''' <remarks></remarks>
    Public Sub AddParameter(ByVal NombreParametro As String, ByVal SqlDbType As SqlDbType, ByVal Valor As Object)
        Dim oPar As New SqlParameter
        With oPar
            .ParameterName = NombreParametro
            .SqlDbType = SqlDbType
            .Value = Valor
        End With
        cmd.Parameters.Add(oPar)
    End Sub
    ''' <summary>
    ''' Metodo que agrega los parametros de salida del StoredProcedure
    ''' </summary>
    ''' <param name="NombreParametro"></param>
    ''' <param name="SqlDbType"></param>
    ''' <param name="Valor"></param>
    ''' <remarks></remarks>
    Public Sub AddParameterOut(ByVal NombreParametro As String, ByVal SqlDbType As SqlDbType)
        Dim oPar As New SqlParameter
        With oPar
            .Direction = ParameterDirection.Output
            .ParameterName = NombreParametro
            .SqlDbType = SqlDbType
        End With
        cmd.Parameters.Add(oPar)
    End Sub
    Public Sub AddParameterOutString(ByVal NombreParametro As String, ByVal SqlDbType As SqlDbType, ByVal size As Integer)
        Dim oPar As New SqlParameter
        With oPar
            .Direction = ParameterDirection.Output
            .ParameterName = NombreParametro
            .SqlDbType = SqlDbType
            .Size = size
        End With
        cmd.Parameters.Add(oPar)
    End Sub
#End Region

#Region "ObtenerDatos"
    ''' <summary>
    ''' Funcion que obtiene una consulta(SELECT), regresa un DataTable, DataSet o un DataReader en un valor de referencia(ByRef) y devuelve(Return) un Boolean 
    ''' </summary>
    ''' <param name="dtData"></param>
    ''' <remarks></remarks>
    Public Function GetData(ByRef dtData As DataTable) As Boolean
        Dim bolResultado As Boolean = False

        OpenConnection()
        Try
            cmd.CommandType = CommandType.StoredProcedure
            'cmd.ExecuteNonQuery()
            sqlAdapter = New SqlDataAdapter(cmd)
            sqlAdapter.Fill(dtData)
            bolResultado = True
        Catch ex As Exception
            Me.exException = ex
            Me.strMsj = ex.Message
        Finally
            CloseConnection()
        End Try

        Return bolResultado
    End Function
    ''' <summary>
    ''' Funcion que obtiene una consulta(SELECT), regresa un DataTable, DataSet o un DataReader en un valor de referencia(ByRef) y devuelve(Return) un Boolean 
    ''' </summary>
    ''' <param name="dsData"></param>
    ''' <remarks></remarks>
    Public Function GetData(ByRef dsData As DataSet) As Boolean
        Dim bolResultado As Boolean = False
        OpenConnection()

        Try
            cmd.CommandType = CommandType.StoredProcedure
            cmd.ExecuteNonQuery()
            sqlAdapter = New SqlDataAdapter(cmd)
            sqlAdapter.Fill(dsData)
            bolResultado = True

        Catch ex As Exception
            Me.exException = ex
            Me.strMsj = ex.Message
        Finally
            CloseConnection()
        End Try

        Return bolResultado
    End Function
    ''' <summary>
    ''' Funcion que obtiene una consulta(SELECT), regresa un DataTable, DataSet o un DataReader en un valor de referencia(ByRef) y devuelve(Return) un Boolean 
    ''' </summary>
    ''' <param name="drData "></param>
    ''' <remarks></remarks>
    Public Function GetData(ByRef drData As SqlDataReader) As Boolean
        Dim bolResultado As Boolean = False
        OpenConnection()

        Try
            drData = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            bolResultado = True
        Catch ex As Exception
            Me.exException = ex
            Me.strMsj = ex.Message
        Finally
            CloseConnection()
        End Try

        Return bolResultado
    End Function
    ''' <summary>
    ''' Devuelve un resultado tipo String
    ''' </summary>
    ''' <remarks></remarks>
    Public Function GetString() As String
        Dim strResultado As String = Nothing
        OpenConnection()

        Try
            cmd.CommandType = CommandType.StoredProcedure
            strResultado = cmd.ExecuteScalar()
        Catch ex As Exception
            Me.exException = ex
            strResultado = ex.Message
        Finally
            CloseConnection()
        End Try

        Return strResultado
    End Function
    ''' <summary>
    ''' Devuelve un resultado tipo String y una referencia de Identidad
    ''' </summary>
    ''' <remarks></remarks>
    Public Function GetString(ByVal NombreParametro As String, ByVal SqlDbType As SqlDbType, ByRef Identity As Integer) As String
        Dim strResultado As String = Nothing
        OpenConnection()

        Try
            Dim OutPar As New SqlParameter
            With OutPar
                .Direction = ParameterDirection.Output
                .ParameterName = NombreParametro
                .SqlDbType = SqlDbType
            End With

            cmd.Parameters.Add(OutPar)
            cmd.CommandType = CommandType.StoredProcedure
            strResultado = cmd.ExecuteScalar()
            Identity = OutPar.Value

        Catch ex As Exception
            Me.exException = ex
            strResultado = ex.Message
        Finally
            CloseConnection()
        End Try

        Return strResultado
    End Function
    ''' <summary>
    ''' Devuelve un resultado tipo String
    ''' </summary>
    ''' <remarks></remarks>
    Public Function GetInteger() As Integer
        Dim strResultado As Integer = Nothing
        OpenConnection()

        Try
            cmd.CommandType = CommandType.StoredProcedure
            strResultado = cmd.ExecuteScalar()
        Catch ex As Exception
            Me.exException = ex
            Me.strMsj = ex.Message
        Finally
            CloseConnection()
        End Try

        Return strResultado
    End Function
    ''' <summary>
    ''' Devuelve un resultado tipo Boolean
    ''' </summary>
    ''' <remarks></remarks>
    Public Function GetBoolean() As Boolean
        Dim bolResultado As String = False
        OpenConnection()

        Try
            cmd.CommandType = CommandType.StoredProcedure
            bolResultado = cmd.ExecuteScalar()
        Catch ex As Exception
            Me.exException = ex
            Me.strMsj = ex.Message
        Finally
            CloseConnection()
        End Try

        Return bolResultado
    End Function
#End Region

#Region "EstablecerDatos"
    ''' <summary>
    ''' Funcion que ejecuta un procedimiento(INSERT,UPDATE,DELETE) y devuelve(Return) un Boolean
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function SetData() As Boolean
        Dim bolResultado As Boolean = False
        OpenConnection()

        Try
            cmd.CommandType = CommandType.StoredProcedure
            cmd.ExecuteNonQuery()
            bolResultado = True
        Catch ex As Exception
            Me.exException = ex
            Me.strMsj = ex.Message
        Finally
            CloseConnection()
        End Try

        Return bolResultado
    End Function

#End Region


End Class