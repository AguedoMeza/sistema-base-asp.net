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
            this.LlemarCombo();
     
        }
    }
    private bool EstanCamposLLenos()
    {
        bool var = true;
        if(this.txtAp_Materno.Text == String.Empty)
        {
            this.pn_ap_materno.CssClass = "form-group has-error";
            var = false;
        }
        if(this.txtAp_paterno.Text == String.Empty)
        {
            this.pn_ap_paterno.CssClass = "form-group has-error";
            var = false;
        }
        if(this.txtContrasena.Text == String.Empty || this.txtContrasena.Text != this.txtConf.Text)
        {
            this.pn_contrasena.CssClass = "form-group has-error";
            var = false;
        }
        if(this.txtCurp.Text == String.Empty)
        {
            this.pn_curp.CssClass = "form-group has-error";
            var = false;
        }
        if(this.txtNombre.Text == String.Empty)
        {
            this.pn_usuario.CssClass = "form-group has-error";
            var = false;
        }
        if(this.txtUsuario.Text == String.Empty)
        {
            this.pn_usuario.CssClass = "form-group has-error";
            var = false;
        }
        return var;
    }

    private void LimpiarClases()
    {
        
            this.pn_ap_materno.CssClass = "form-group";
            
            this.pn_ap_paterno.CssClass = "form-group";
           
            this.pn_contrasena.CssClass = "form-group";
        
            this.pn_curp.CssClass = "form-group";
        
            this.pn_usuario.CssClass = "form-group";
          
            this.pn_usuario.CssClass = "form-group";
      }

    private void LLenarGrid()
    {
        LogInc cnn = new LogInc();

        cnn.idUsuario = 0;

        this.GridView1.DataSource = cnn.UsuarioDetalle();

        this.GridView1.DataBind();

        GridView1.Columns[0].ItemStyle.Width = 50;
       
        GridView1.Columns[5].ItemStyle.Width = 50;
        GridView1.Columns[6].ItemStyle.Width = 50;
        //this.GridView1.Columns[0].HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
       // this.GridView1.HeaderRow.Cells[0].HorizontalAlign = HorizontalAlign.Left;
        //this.GridView1.Columns[0].HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
      
        
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
        
        if(idUsuario != 0)
        {
          
            LogInc cnn = new LogInc();

            cnn.Usuaio = this.txtUsuario.Text;
            cnn.Nombre = this.txtNombre.Text;
            cnn.NoEmpleado = this.txtCurp.Text;
            cnn.Apellido = this.txtAp_paterno.Text;
            cnn.Password = this.txtContrasena.Text;
            cnn.Empresa = Convert.ToInt32(this.ddlist_empresas.SelectedValue.ToString());
            cnn.idUsuario = idUsuario;
            int var = cnn.UsuarioUpdate();
            Session.Remove("idUsuario");
            btnPopUp_ModalPopupExtender.Hide();
            Response.Redirect("../usuarios/usuarios.aspx");
        }
        else
        {
            if (this.EstanCamposLLenos() == true)
            {
                LogInc cnn = new LogInc();

                cnn.Nombre = this.txtNombre.Text;
                cnn.Apellido = this.txtAp_paterno.Text;
                cnn.Apellido_Materno = this.txtAp_Materno.Text;
                cnn.Usuaio = this.txtUsuario.Text;
                cnn.Password = this.txtContrasena.Text;
                cnn.NoEmpleado = this.txtCurp.Text;
                cnn.Empresa = Convert.ToInt16(this.ddlist_empresas.SelectedValue.ToString());
                cnn.Activo = 1;

                int var = cnn.UsuariosInsert();

                btnPopUp_ModalPopupExtender.Hide();

                Response.Redirect("../usuarios/usuarios.aspx");
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
        this.Limpiar();
        Session["idUsuario"] = 0;
        this.btn_registrar_actualizar.Text = "Registrar";
    }
    private void Limpiar()
    {
        this.txtNombre.Text = "";
        this.txtUsuario.Text = "";
        this.txtCurp.Text = "";
        this.txtAp_Materno.Text = "";
        this.txtAp_paterno.Text = "";
        this.ddlist_empresas.Items.Insert(0, new ListItem("Empresa de origen..", "0"));  
    }

    private void LlemarCombo()
    {
        empresac cnn = new empresac();

        cnn.idEmpresa = 0;
       
        this.ddlist_empresas.DataSource = cnn.EmpresaDetalle();
        this.ddlist_empresas.DataValueField = "id";
        this.ddlist_empresas.DataTextField = "nombre";
        this.ddlist_empresas.DataBind();
        this.ddlist_empresas.Items.Insert(0, new ListItem("Empresa de origen..", "0"));  
    }


    private void MostrarDatos()
    {

        int idUsuario = Convert.ToInt32(Session["idUsuario"]);

            LogInc cnn = new LogInc();

            cnn.idUsuario = idUsuario;


            DataTable dt = new DataTable();

            dt = cnn.UsuarioDetalle();

            foreach (DataRow fila in dt.Rows)
            {
                string usuario = fila["Usuario"].ToString();
                this.txtUsuario.Text = usuario;

                string curp = fila["CURP"].ToString();
                this.txtCurp.Text = curp;

                string nombre = fila["Nombre"].ToString();
                this.txtNombre.Text = nombre;

                string ap_paterno = fila["Ap_Paterno"].ToString();
                this.txtAp_paterno.Text = ap_paterno;

                string ap_materno = fila["Ap_Materno"].ToString();
                this.txtAp_Materno.Text = ap_materno;

                string empresa= fila["Empresa"].ToString();
                this.ddlist_empresas.Items.Insert(0, new ListItem(empresa, "0"));  
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
                    this.MostrarDatos();
                  
                }
            }
        }
        catch (Exception)
        {
        }
    }
}