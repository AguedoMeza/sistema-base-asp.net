//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using ProjectBseBusiness;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectBseBusiness;
using System.Configuration;
using System.Data;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.denegar();
     
        int perfilLoging = variablesGlobales.id_perfil_usuario_login; //obtengo el perfil del usuario actual 

        moduloc cnnIdModuloAcceso = new moduloc();
        cnnIdModuloAcceso.idUsuario = perfilLoging;
        DataTable dt = new DataTable();
        dt = cnnIdModuloAcceso.ModulosAccesoUsuario();

        foreach (DataRow fila in dt.Rows)
        {
          int id_modulo = Convert.ToInt32(fila["id"].ToString());

          if (id_modulo == 3)
          {
              this.li_usuarios.Visible = true;
          }
          else if (id_modulo == 4)
          {
              this.li_empresas.Visible = true;
          }
          else if (id_modulo == 5)
          {
              this.li_funciones.Visible = true;
          }
          else if (id_modulo == 6)
          {
              this.li_perfiles.Visible = true;
          }
          else if (id_modulo == 7)
          {
              this.li_perfiles_detalle.Visible = true;
          }
          else if (id_modulo == 8)
          {
              this.li_usuarios_perfiles.Visible = true;
          }
          else if (id_modulo == 9)
          {
              this.li_acciones.Visible = true;
          }
          else if (id_modulo == 10)
          {
              this.li_modulos.Visible = true;
          }
          else if (id_modulo == 11)
          {
              this.li_modulos_funciones.Visible = true;
          }
        
        }

      
       
       
    
        try
        {
            String nombre = Session["nom"].ToString();
            this.Label2.Text = nombre;
           
           
        }
        catch (Exception ex)
        {
            Response.Redirect("../../login/login.aspx?men=1");
        }

    }
    private void denegar()
    {
        this.li_acciones.Visible = false;
        this.li_empresas.Visible = false;
        this.li_funciones.Visible = false;
        this.li_modulos.Visible = false;
        this.li_modulos_funciones.Visible = false;
        this.li_perfiles.Visible = false;
        this.li_perfiles_detalle.Visible = false;
        this.li_usuarios.Visible = false;
        this.li_usuarios_perfiles.Visible = false;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
         Session.Remove("nom");
         Response.Redirect("../../login/login.aspx");

    }
}
