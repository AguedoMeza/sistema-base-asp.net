using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectBseBusiness;

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

        if (var == 1)
        {
            Session["nom"] = cnn.Usuaio;//usar nombres completos para identificar
            Response.Redirect("../inicio/inicio.aspx");
        }
        else
        {
            this.TextBox1.Text = "incorrecto";
        }
      
       
    }
}