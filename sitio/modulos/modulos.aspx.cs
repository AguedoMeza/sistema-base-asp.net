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
    public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
    {
     
            CheckBox chkStatus = (CheckBox)sender;
          
           int nID = Convert.ToInt32(GridView1.DataKeys[((GridViewRow)chkStatus.NamingContainer).RowIndex].Value);

           if(chkStatus.Checked)
           {
               moduloc cnn = new moduloc();

               cnn.Activo = 1;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           else
           {
               moduloc cnn = new moduloc();

               cnn.Activo = 0;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }

          
 

            this.LLenarGrid();
    }
    private bool EstanCamposLLenos()
    {
        bool var = true;
    //    if(this.txtAp_Materno.Text == String.Empty)
    //    {
    //        this.pn_ap_materno.CssClass = "form-group has-error";
    //        var = false;
    //    }
    //    if(this.txtAp_paterno.Text == String.Empty)
    //    {
    //        this.pn_ap_paterno.CssClass = "form-group has-error";
    //        var = false;
    //    }
    //    if(this.txtContrasena.Text == String.Empty || this.txtContrasena.Text != this.txtConf.Text)
    //    {
    //        this.pn_contrasena.CssClass = "form-group has-error";
    //        var = false;
    //    }
    //    if(this.txtCurp.Text == String.Empty)
    //    {
    //        this.pn_curp.CssClass = "form-group has-error";
    //        var = false;
    //    }
    //    if(this.txtNombre.Text == String.Empty)
    //    {
    //        this.pn_usuario.CssClass = "form-group has-error";
    //        var = false;
    //    }
      
        return var;
    }

    private void LimpiarClases()
    {
        
            //this.pn_ap_materno.CssClass = "form-group";
            
            //this.pn_ap_paterno.CssClass = "form-group";
           
            //this.pn_contrasena.CssClass = "form-group";
        
            //this.pn_curp.CssClass = "form-group";
        
            //this.pn_usuario.CssClass = "form-group";
          
            //this.pn_usuario.CssClass = "form-group";
      }

    private void LLenarGrid()
    {
        moduloc cnn = new moduloc();

        cnn.idUsuario = 0;

        this.GridView1.DataSource = cnn.ModuloDetalle();

        this.GridView1.DataBind();

        //GridView1.Columns[0].ItemStyle.Width = 50;
       
        //GridView1.Columns[5].ItemStyle.Width = 50;
        //GridView1.Columns[6].ItemStyle.Width = 50;
        
        
        
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
          
            moduloc cnn = new moduloc();

           
            cnn.Nombre = this.txtNombre.Text;
           
            cnn.Empresa = Convert.ToInt32(this.ddlist_empresas.SelectedValue.ToString());
            
            cnn.idUsuario = idUsuario;

            cnn.Descripcion = "descripcion editada";

            int var = cnn.ModulosUpdate();

            Session.Remove("idUsuario");
            btnPopUp_ModalPopupExtender.Hide();
            Response.Redirect("../modulos/modulos.aspx");
        }
        else
        {
            if (this.EstanCamposLLenos() == true)
            {
                moduloc cnn = new moduloc();

                cnn.Nombre = this.txtNombre.Text;

                cnn.Empresa = Convert.ToInt16(this.ddlist_empresas.SelectedValue.ToString());

                cnn.Descripcion = "modulo";

                cnn.Activo = 1;

                int var = cnn.UsuariosInsert();

                btnPopUp_ModalPopupExtender.Hide();

                Response.Redirect("../modulos/modulos.aspx");
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

            moduloc cnn = new moduloc();

            cnn.idUsuario = idUsuario;


            DataTable dt = new DataTable();

            dt = cnn.ModuloDetalle();

            foreach (DataRow fila in dt.Rows)
            {
               
                string nombre = fila["nombre"].ToString();
                this.txtNombre.Text = nombre;

                //string empresa= fila["Empresa"].ToString();
                //this.ddlist_empresas.Items.Insert(0, new ListItem(empresa, "0"));  
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