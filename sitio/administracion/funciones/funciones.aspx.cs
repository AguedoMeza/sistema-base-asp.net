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
           //this.LlemarCombo();
           /// pn_nombre.Controls.OfType<TextBox>().Count();
           //int var =  pn_nombre.Controls.OfType<TextBox>().Count();
           //this.Label3.Text = var.ToString();
        }
    }
   
    
     private bool prueba()
     {
         int i = 0;
        
             foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
             {
                 i++;

                 int var = pn_nombre.Controls.OfType<TextBox>().Count();
                
                 if (texto.Text == String.Empty)
                 {
                     texto.CssClass = "form-control2";
 
                     if (texto.Text == String.Empty && i== var)
                     {
                         return false;
                     }
                 }
             }
             return true;
     }

    public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
    {
     
            CheckBox chkStatus = (CheckBox)sender;
          
           int nID = Convert.ToInt32(GridView1.DataKeys[((GridViewRow)chkStatus.NamingContainer).RowIndex].Value);

           if(chkStatus.Checked)
           {
               funcionesc cnn = new funcionesc();

               cnn.Activo = 1;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           else
           {
               funcionesc cnn = new funcionesc();

               cnn.Activo = 0;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           this.LLenarGrid();
    }

    private void LLenarGrid()
    {
        funcionesc cnn = new funcionesc();

        cnn.idUsuario = 0;

        this.GridView1.DataSource = cnn.FuncionDetalle();

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
        int idUsuarioResgistro = Convert.ToInt32(Session["id_usuario_registro"]);

        if (idUsuario != 0)
        {
           if(this.prueba()==true)
           {
                    funcionesc  cnn = new funcionesc();

                    
                    cnn.Empresa = Convert.ToInt32(this.ddlist_modulos.SelectedValue.ToString());
                    cnn.Accion = Convert.ToInt32(this.ddlist_acciones.SelectedValue.ToString());
                    cnn.Nombre = this.txtDefinicion.Text;
                    cnn.idUsuario = idUsuario;
                    int var = cnn.FuncionesUpdate();
                    Session.Remove("idUsuario");
                    btnPopUp_ModalPopupExtender.Hide();
                    Response.Redirect("../funciones/funciones.aspx");
           }

        }
        
        else
        {
            if (this.prueba() == true)
            {
                funcionesc cnn = new funcionesc();

               
                cnn.Empresa = Convert.ToInt16(this.ddlist_modulos.SelectedValue.ToString());
                cnn.Accion = Convert.ToInt16(this.ddlist_acciones.SelectedValue.ToString());
                cnn.Nombre = this.txtDefinicion.Text;
               
                cnn.Activo = 1;
                cnn.idUsuario = idUsuarioResgistro;

                int var = cnn.FuncionesInsert();

                btnPopUp_ModalPopupExtender.Hide();

                Response.Redirect("../funciones/funciones.aspx");
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
        this.LlenarComboModulos();
        this.LlenarComboAcciones();
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

    private void LimpiarClases()
    {
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            texto.CssClass = "form-control";
        }
    }


    private void LlenarComboModulos()
    {
        moduloc cnn = new moduloc();

        cnn.idUsuario = 0;

        this.ddlist_modulos.DataSource = cnn.ModuloDetalle();

        this.ddlist_modulos.DataValueField = "id";
        this.ddlist_modulos.DataTextField = "nombre";
        this.ddlist_modulos.DataBind();
        this.ddlist_modulos.Items.Insert(0, new ListItem("Modulo..", "0"));
    }

    private void LlenarComboAcciones()
    {
        accionesc cnn = new accionesc();

        cnn.idUsuario = 0;

        this.ddlist_acciones.DataSource = cnn.AccionesDetalle();

        this.ddlist_acciones.DataValueField = "id";
        this.ddlist_acciones.DataTextField = "nombre";
        this.ddlist_acciones.DataBind();
        this.ddlist_acciones.Items.Insert(0, new ListItem("Accion..", "0"));
    }

     



    private void MostrarDatos()
    {

        int idUsuario = Convert.ToInt32(Session["idUsuario"]);

            funcionesc cnn = new funcionesc();

            cnn.idUsuario = idUsuario;


            DataTable dt = new DataTable();

            dt = cnn.FuncionDetalle();

            foreach (DataRow fila in dt.Rows)
            {
                string definicion = fila["definicion"].ToString();
                this.txtDefinicion.Text = definicion;

                string modulo = fila["id_modulos"].ToString();
                this.ddlist_modulos.ClearSelection();
                this.ddlist_modulos.Items.FindByValue(modulo).Selected = true;

                string accion = fila["id_acciones"].ToString();
                this.ddlist_acciones.ClearSelection();
                this.ddlist_acciones.Items.FindByValue(accion).Selected = true;
         
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
                   
                    this.LlenarComboModulos();
                    this.LlenarComboAcciones();
                    this.MostrarDatos();
                  
                }
            }
        }
        catch (Exception)
        {
        }
    }
   

    protected void txtConf_TextChanged(object sender, EventArgs e)
    {
       
        
    }
}