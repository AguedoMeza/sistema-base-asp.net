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
    private void Limpiar()
    {
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            texto.Text = String.Empty;
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

    private void LimpiarClases()
    {
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            texto.CssClass = "form-control";
        }
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

                if (texto.Text == String.Empty && i == var)
                {
                    return false;
                }
            }
        }
        return true;
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
        int idEmpresa = Convert.ToInt32(Session["idEmpresa"]);

        if(idEmpresa != 0) //agregar exepcion de sql con try-catch
        {
            if(this.prueba()==true)
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
        }
        else
        {
            if(this.prueba() == true)
            {
                    empresac cnn = new empresac();

                    cnn.Nombre = this.txtNombre.Text;
                    cnn.Direccion = this.txtDireccion.Text;
                    cnn.RFC = this.txtrfc.Text;
                    cnn.Razon_social = this.txtrazon_social.Text;
                    cnn.Contact = this.TxtCon.Text;
                    cnn.Activo = 1;


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