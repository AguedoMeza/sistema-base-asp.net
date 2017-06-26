using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectBseBusiness;
using System.Configuration;
using System.Data;

public partial class usuarios_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.LLenarGrid();   
        }
    }

    private bool validarCombos()
    {
        bool resp = true;
        foreach (DropDownList texto in pn_nombre.Controls.OfType<DropDownList>())
        {

            if (texto.SelectedValue.ToString() == "0")
            {
                texto.CssClass = "form-control2";

                resp = false;
            }

        }
        return resp;
    }

    private void LlemarCombo()
    {
        perfilc cnn = new perfilc();

        cnn.idUsuario = 100;

        this.ddList_perfiles.DataSource = cnn.PerfilDetalle();

        this.ddList_perfiles.DataValueField = "id";
        this.ddList_perfiles.DataTextField = "nombre";
        this.ddList_perfiles.DataBind();
        this.ddList_perfiles.Items.Insert(0, new ListItem("Perfil..", "0"));
    }

    private void LlemarComboUsuarios()
    {
        LogInc cnn = new LogInc();

        cnn.idUsuario = 100;

        this.ddList_usuarios.DataSource = cnn.UsuarioDetalle();

        this.ddList_usuarios.DataValueField = "id";
        this.ddList_usuarios.DataTextField = "nombre_usuario";
        this.ddList_usuarios.DataBind();
        this.ddList_usuarios.Items.Insert(0, new ListItem("Usuario..", "0"));
    }
    public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
    {
     
            CheckBox chkStatus = (CheckBox)sender;
          
           int nID = Convert.ToInt32(GridView1.DataKeys[((GridViewRow)chkStatus.NamingContainer).RowIndex].Value);

           if(chkStatus.Checked)
           {
               usuarios_perfilesc cnn = new usuarios_perfilesc();

               cnn.Activo = 1;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           else
           {
               usuarios_perfilesc cnn = new usuarios_perfilesc();

               cnn.Activo = 0;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }

           this.LLenarGrid();
    }
    private bool EstanCamposLLenos()
    {
        bool resp = true;
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            
           //int var = pn_nombre.Controls.OfType<TextBox>().Count(); cuenta la cantidad de textbox

            if (texto.Text == String.Empty)
            {
                texto.CssClass = "form-control2";

                resp = false;
            }
          
        }
        return resp;
    }

    private void LimpiarClases()
    {
        foreach (DropDownList texto in pn_nombre.Controls.OfType<DropDownList>())
        {
            texto.CssClass = "form-control";
        }
    }

    private void LLenarGrid()
    {
        usuarios_perfilesc cnn = new usuarios_perfilesc();

        cnn.idUsuario = 0;

        this.GridView1.DataSource = cnn.UsuariosPerfilDetalle();

        this.GridView1.DataBind();

        GridView1.Columns[0].ItemStyle.Width = 50;

        GridView1.Columns[3].ItemStyle.Width = 50;
        GridView1.Columns[4].ItemStyle.Width = 50;

    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        btnPopUp_ModalPopupExtender.Hide();
    }
    protected void btnLimpiar_Click(object sender, EventArgs e)
    {
        this.Limpiar();
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {

        int idUsuario = Convert.ToInt32(Session["idUsuario"]);
        int idUsuarioResgistro = Convert.ToInt32(Session["id_usuario_registro"]);
        int i = 0;
        if (idUsuario != 0)
        {
            if (this.validarCombos() == true)
            {
                usuarios_perfilesc cnn = new usuarios_perfilesc();

                cnn.idUsuario = idUsuario;

                cnn.Empresa = Convert.ToInt32(this.ddList_usuarios.SelectedValue.ToString());

                cnn.Perfil = Convert.ToInt32(this.ddList_perfiles.SelectedValue.ToString());

                int var = cnn.UsuariosPerfilesUpdate();

                Session.Remove("idUsuario");
                btnPopUp_ModalPopupExtender.Hide();
                Response.Redirect("../usuarios_perfiles/usuarios_perfiles.aspx");
            }
                  
              
        }

        else
        {
            if (this.validarCombos() == true)
            {
                usuarios_perfilesc cnn = new usuarios_perfilesc();
               
                cnn.idUsuario = idUsuarioResgistro;

                cnn.Empresa = Convert.ToInt32(this.ddList_usuarios.SelectedValue.ToString());

                cnn.Perfil = Convert.ToInt32(this.ddList_perfiles.SelectedValue.ToString());
              
                cnn.Activo = 1;

                int var = cnn.UsuariosPerfilInsert();

                btnPopUp_ModalPopupExtender.Hide();

                Response.Redirect("../usuarios_perfiles/usuarios_perfiles.aspx");
            }
        }
   }

       
       
         
                
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
      
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        

    }
    protected void btnPopUp_Click(object sender, EventArgs e)
    {
       
        btnPopUp_ModalPopupExtender.Show();
        this.LimpiarClases();
        this.LlemarCombo();
        this.LlemarComboUsuarios();
        this.Limpiar();
        Session["idUsuario"] = 0;
        this.btn_registrar_actualizar.Text = "Registrar";
    }
    private void Limpiar()
    {
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            texto.Text = String.Empty;
        }
    }

    


    private void MostrarDatos()
    {

            int idUsuario = Convert.ToInt32(Session["idUsuario"]);

            usuarios_perfilesc cnn = new usuarios_perfilesc();

            cnn.idUsuario = idUsuario;


            DataTable dt = new DataTable();

            dt = cnn.UsuariosPerfilDetalle();
          

            foreach (DataRow fila in dt.Rows)
            {
               
                string usuario = fila["id_usuario"].ToString();
                string nombre_usuario = fila["Usuario"].ToString();
                string perfil_nombre = fila["Perfil"].ToString();
                string perfil = fila["id_perfil"].ToString();
                string estado_usuario = fila["Activo"].ToString();
                string estado_perfil = fila["Activo_perfil"].ToString();

              
                   this.ddList_usuarios.Items.Insert(0, new ListItem(nombre_usuario, usuario));
               

                   this.ddList_perfiles.Items.Insert(0, new ListItem(perfil_nombre, perfil)); 
               
              
                   this.ddList_usuarios.ClearSelection();
                   this.ddList_usuarios.Items.FindByValue(usuario).Selected = true;
               
                   this.ddList_perfiles.ClearSelection();
                   this.ddList_perfiles.Items.FindByValue(perfil).Selected = true;
            
            }
       
         this.btn_registrar_actualizar.Text = "Actualizar";
       
    }
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            short indicefila;
            indicefila = Convert.ToInt16(e.CommandArgument);
            string id;
            
            if (indicefila >= 0 & indicefila < GridView1.Rows.Count)
            {
                id = GridView1.Rows[indicefila].Cells[0].Text;
               
                if (e.CommandName == "Actualizar")
                {
                    Session["idUsuario"] = id;
                   
                  
                   
                    btnPopUp_ModalPopupExtender.Show();
                    this.LimpiarClases();
                    this.LlemarCombo();
                    this.LlemarComboUsuarios();
                    this.MostrarDatos();
                  
                }
            }
        }
        catch (Exception)
        {
        }
    }
}