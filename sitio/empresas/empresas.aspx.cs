using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectBseBusiness;
using System.Configuration;
using System.Data;


public partial class empresas_empresas : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.LLenarGrid();
        }
    }
    public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
    {

        CheckBox chkStatus = (CheckBox)sender;

        int nID = Convert.ToInt32(GridEmpresa.DataKeys[((GridViewRow)chkStatus.NamingContainer).RowIndex].Value);

        if (chkStatus.Checked)
        {
            empresac cnn = new empresac();

            cnn.Activo = 1;
            cnn.idUsuario = nID;
            int var = cnn.estado();
        }
        else
        {
            empresac cnn = new empresac();

            cnn.Activo = 0;
            cnn.idUsuario = nID;
            int var = cnn.estado();
        }




        this.LLenarGrid();
    }
    private bool EstanCamposLLenos()
    {
        if (this.TxtCon.Text == String.Empty)
        {
            this.pn_con.CssClass = "form-group has-error";
            return false;
        }
        else if (this.txtDireccion.Text == String.Empty)
        {
            this.pn_direccion.CssClass = "form-group has-error";
            return false;
        }
        else if (this.txtNombre.Text == String.Empty)
        {
            this.pn_nombre.CssClass = "form-group has-error";
            return false;
        }
        else if (this.txtrazon_social.Text == String.Empty)
        {
            this.pn_razon.CssClass = "form-group has-error";
            return false;
        }
        else if (this.txtrfc.Text == String.Empty)
        {
            this.pn_rfc.CssClass = "form-group has-error";
            return false;
        }
       
        return true;
    }

    private void LimpiarClases()
    {

        this.pn_rfc.CssClass = "form-group";

        this.pn_razon.CssClass = "form-group";

        this.pn_nombre.CssClass = "form-group";

        this.pn_direccion.CssClass = "form-group";

        this.pn_con.CssClass = "form-group";

      
    }

    private void Limpiar()
    {
        this.TxtCon.Text = "";
        this.txtDireccion.Text = "";
        this.txtNombre.Text = "";
        this.txtrazon_social.Text = "";
        this.txtrfc.Text = "";
    }

    private void LLenarGrid()
    {
        empresac cnn = new empresac();

        cnn.idEmpresa = 0;

        this.GridEmpresa.DataSource = cnn.EmpresaDetalle();

        this.GridEmpresa.DataBind();

        this.GridEmpresa.Columns[0].ItemStyle.Width = 50;

        this.GridEmpresa.Columns[6].ItemStyle.Width = 50;
        this.GridEmpresa.Columns[7].ItemStyle.Width = 50;
    }
    private void MostrarDatos()
    {

        int idEmpresa = Convert.ToInt32(Session["idEmpresa"]);


        empresac cnn = new empresac();

        cnn.idUsuario = idEmpresa;


        DataTable dt = new DataTable();

        dt = cnn.EmpresaDetalle();

        foreach (DataRow fila in dt.Rows)
        {
            string nombre = fila["nombre"].ToString();
            this.txtNombre.Text = nombre;

            string contacto = fila["contacto"].ToString();
            this.TxtCon.Text = contacto;

            string direccion = fila["direccion"].ToString();
            this.txtDireccion.Text = direccion;

            string razon = fila["razon_social"].ToString();
            this.txtrazon_social.Text = razon;

            string rfc = fila["rfc"].ToString();
            this.txtrfc.Text = rfc;
        }

          this.btn_registrar_actualizar.Text = "Actualizar";

    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        btnPopUp_ModalPopupExtender.Hide();
    }
    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        int idEmpresa = Convert.ToInt32(Session["idEmpresa"]);

        if(idEmpresa != 0)
        {
            empresac cnn = new empresac();
            cnn.Nombre = this.txtNombre.Text;
            cnn.Apellido = this.txtDireccion.Text;
            cnn.Usuaio = this.txtrazon_social.Text;
            cnn.Password = this.txtrfc.Text;
            cnn.Correo = this.TxtCon.Text;
            cnn.idUsuario = idEmpresa;
            int var = cnn.UsuarioUpdate();
            Session.Remove("idUsuario");
            btnPopUp_ModalPopupExtender.Hide();
            Response.Redirect("../empresas/empresas.aspx");
        }
        else
        {
            if (this.EstanCamposLLenos() == true)
            {
                empresac cnn = new empresac();

                cnn.Nombre = this.txtNombre.Text;
                cnn.Direccion = this.txtDireccion.Text;
                cnn.RFC = this.txtrfc.Text;
                cnn.Razon_social = this.txtrazon_social.Text;
                cnn.Contact = this.TxtCon.Text;


                int var = cnn.Empresas_Insert();

                btnPopUp_ModalPopupExtender.Hide();

                Response.Redirect("../empresas/empresas.aspx");
            }
        }
        

        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("../inicio/inicio.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

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
        Session["idEmpresa"] = 0;
        this.btn_registrar_actualizar.Text = "Registrar";
        this.Limpiar();
        this.LimpiarClases();
    }

   
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            short indicefila;
            indicefila = Convert.ToInt16(e.CommandArgument);
            string id;
           
            if (indicefila >= 0 & indicefila < GridEmpresa.Rows.Count)
            {
                id = GridEmpresa.Rows[indicefila].Cells[0].Text;

                if (e.CommandName == "Actualizar")
                {
                    Session["idEmpresa"] = id;


                    btnPopUp_ModalPopupExtender.Show();
                    //Response.Redirect("prueba.aspx");  
                    // this.LLenarGrid();
                    this.MostrarDatos();

                }
               
            }
        }
        catch (Exception)
        {
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    

    
}