using System;
using System.Data;
using System.Data.SqlClient;

public class cclasecnn
{

    string connectionString = @"Data Source=AGUEDO-PC\SQLEXPRESS;Initial Catalog=modelo;Integrated Security=True";


    Exception exException;
    string strMsj = "";


    public Exception ErrorIT
    {
        get
        {
            return exException;
        }
    }

    SqlConnection cnn = new SqlConnection(connectionString);
    SqlTransaction sqlTransaction;
    SqlDataAdapter sqlAdapter;
    SqlCommand cmd;


    private void OpenConnection()
    {
        cnn.Open();
    }


    private void CloseConnection()
    {
        cnn.Close();
    }

    public void Command(string NombreProcedimiento)
    {
        cmd = new SqlCommand(NombreProcedimiento, cnn);
    }

    public void AddParameter(string NombreParametro, SqlDbType SqlDbType, object Valor)
    {
        SqlParameter oPar = new SqlParameter();
        oPar.ParameterName = NombreParametro;
        oPar.SqlDbType = SqlDbType;
        oPar.Value = Valor;
        cmd.Parameters.Add(oPar);
    }

    public void AddParameterOut(string NombreParametro, SqlDbType SqlDbType)
    {
        SqlParameter oPar = new SqlParameter();
        oPar.Direction = ParameterDirection.Output;
        oPar.ParameterName = NombreParametro;
        oPar.SqlDbType = SqlDbType;
        cmd.Parameters.Add(oPar);
    }
    public void AddParameterOutString(string NombreParametro, SqlDbType SqlDbType, int size)
    {
        SqlParameter oPar = new SqlParameter();
        oPar.Direction = ParameterDirection.Output;
        oPar.ParameterName = NombreParametro;
        oPar.SqlDbType = SqlDbType;
        oPar.Size = size;
        cmd.Parameters.Add(oPar);
    }

    public bool GetData(ref DataTable dtData)
    {
        bool bolResultado = false;

        OpenConnection();
        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.ExecuteNonQuery()
            sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dtData);
            bolResultado = true;
        }
        catch (Exception ex)
        {
            this.exException = ex;
            this.strMsj = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return bolResultado;
    }

    public bool GetData(ref DataSet dsData)
    {
        bool bolResultado = false;
        OpenConnection();

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            sqlAdapter = new SqlDataAdapter(cmd);
            sqlAdapter.Fill(dsData);
            bolResultado = true;

        }
        catch (Exception ex)
        {
            this.exException = ex;
            this.strMsj = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return bolResultado;
    }

    public bool GetData(ref SqlDataReader drData)
    {
        bool bolResultado = false;
        OpenConnection();

        try
        {
            drData = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            bolResultado = true;
        }
        catch (Exception ex)
        {
            this.exException = ex;
            this.strMsj = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return bolResultado;
    }

    public string GetString()
    {
        string strResultado = null;
        OpenConnection();

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            strResultado = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            this.exException = ex;
            strResultado = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return strResultado;
    }

    public string GetString(string NombreParametro, SqlDbType SqlDbType, ref int Identity)
    {
        string strResultado = null;
        OpenConnection();

        try
        {
            SqlParameter OutPar = new SqlParameter();
            OutPar.Direction = ParameterDirection.Output;
            OutPar.ParameterName = NombreParametro;
            OutPar.SqlDbType = SqlDbType;

            cmd.Parameters.Add(OutPar);
            cmd.CommandType = CommandType.StoredProcedure;
            strResultado = cmd.ExecuteScalar();
            Identity = OutPar.Value;

        }
        catch (Exception ex)
        {
            this.exException = ex;
            strResultado = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return strResultado;
    }

    public int GetInteger()
    {
        int strResultado = null;
        OpenConnection();

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            strResultado = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            this.exException = ex;
            this.strMsj = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return strResultado;
    }


    public bool GetBoolean()
    {
        string bolResultado = false;
        OpenConnection();

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            bolResultado = cmd.ExecuteScalar();
        }
        catch (Exception ex)
        {
            this.exException = ex;
            this.strMsj = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return bolResultado;
    }

    public bool SetData()
    {
        bool bolResultado = false;
        OpenConnection();

        try
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            bolResultado = true;
        }
        catch (Exception ex)
        {
            this.exException = ex;
            this.strMsj = ex.Message;
        }
        finally
        {
            CloseConnection();
        }

        return bolResultado;
    }



}