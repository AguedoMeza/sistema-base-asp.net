using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectBseBusiness;
using System.Configuration;
using System.Data;

public partial class login_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)//al regresar al login eliminar 
        {
            Session.RemoveAll();
            Session.Abandon();
        }
        else
        {
            if (Request.Params["men"] != null)
            {
                String men = Request.Params["men"]; //idusuario,idempresa,
                if (men == "1")
                {
                    Label1.Text = "DEBE DE INICIAR SESIÓN PARA CONTINUAR";
                }
            }
        }
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        LogInc cnn = new LogInc();

        cnn.Usuaio = this.TextBox1.Text;
        cnn.Password = this.TextBox2.Text;
        int var = cnn.ValidaUsuario();
       
        string nombre_usuario = "";
        string id_usuario = "";
       
        if (var == 1)
        {
            LogInc cnnPruea = new LogInc();

            cnnPruea.Correo = cnn.Usuaio;
            


            DataTable dt = new DataTable();

            dt = cnnPruea.UsuarioDetalleSesiones();

            foreach (DataRow fila in dt.Rows)
            {
                nombre_usuario = fila["nombre_usuario"].ToString();
                id_usuario = fila["id"].ToString();
              
            }

            usuarios_perfilesc cnnPerfil = new usuarios_perfilesc();
            cnnPerfil.idUsuario = Convert.ToInt32(id_usuario);
            DataTable dt2 = new DataTable();
            dt2 = cnnPerfil.UsuariosPerfilDetalleByUsuario();

            string id_perfil = "";

            foreach (DataRow fila2 in dt2.Rows)
            {
                id_perfil = fila2["id_perfil"].ToString();
            }

            //aigne el id el usuario que entro a una variable publica de la clase variablesglobales :v
            variablesGlobales usuariologing = new variablesGlobales();
            variablesGlobales.id_usuario_login = Convert.ToInt32(id_usuario); //le asigno el id del usuario logeado
            variablesGlobales.id_perfil_usuario_login = Convert.ToInt32(id_perfil); //le asigno el id_perfil del usuario logeado

            Session["nom"] = nombre_usuario;
            Session["id_usuario_registro"] = id_usuario;

            Response.Redirect("../inicio/inicio.aspx");
        }
        else
        {
            this.TextBox1.Text = "incorrecto";
        }
      
       
    }
}