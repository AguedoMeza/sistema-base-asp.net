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
            lineac cnn = new lineac();

            cnn.Activo = 1;
            cnn.idUsuario = nID;
            int var = cnn.estado();
        }
        else
        {
            lineac cnn = new lineac();

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
        lineac cnn = new lineac();

        cnn.idUsuario = 0;

        this.GridEmpresa.DataSource = cnn.LineaDetalle();

        this.GridEmpresa.DataBind();

        this.GridEmpresa.Columns[0].ItemStyle.Width = 50;

        this.GridEmpresa.Columns[3].ItemStyle.Width = 50;
        this.GridEmpresa.Columns[4].ItemStyle.Width = 50;
        this.GridEmpresa.Columns[5].ItemStyle.Width = 50;
    }
    private void MostrarDatos()
    {

        int idEmpresa = Convert.ToInt32(Session["idEmpresa"]);


        lineac  cnn = new lineac();

        cnn.idUsuario = idEmpresa;


        DataTable dt = new DataTable();

        dt = cnn.LineaDetalle();

        foreach (DataRow fila in dt.Rows)
        {
            string nombre = fila["nombre"].ToString();
            this.txtNombre.Text = nombre;

            string descripcion = fila["descripcion"].ToString();
            this.txtDescripcion.Text = descripcion;
          
        }

          this.btn_registrar_actualizar.Text = "Actualizar";

    }
    private bool prueba()
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
        int idUsuarioResgistro = Convert.ToInt32(Session["id_usuario_registro"]);

        if(idEmpresa != 0) //agregar exepcion de sql con try-catch
        {
            if (this.prueba() == true)
            {
                lineac cnn = new lineac();
                cnn.Nombre = this.txtNombre.Text;
                cnn.Descripcion = this.txtDescripcion.Text;
               
                cnn.idUsuario = idEmpresa;
                int var = cnn.LineasUpdate();
                Session.Remove("idUsuario");
                btnPopUp_ModalPopupExtender.Hide();
                Response.Redirect("../lineas_produccion/lineas_produccion.aspx");
            }
            
        }
        else
        {
            if(this.prueba() == true)
            {
                    lineac cnn = new lineac();

                    cnn.Nombre = this.txtNombre.Text;
                    cnn.Descripcion = this.txtDescripcion.Text;
                    cnn.Activo = 1;
                   


                    int var = cnn.LineasInsert();

                    btnPopUp_ModalPopupExtender.Hide();

                    Response.Redirect("../lineas_produccion/lineas_produccion.aspx");
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
            string nombre;
           
            if (indicefila >= 0 & indicefila < GridEmpresa.Rows.Count)
            {
                id = GridEmpresa.Rows[indicefila].Cells[0].Text;
                nombre = GridEmpresa.Rows[indicefila].Cells[1].Text;
               

                if (e.CommandName == "Actualizar")
                {
                    Session["idEmpresa"] = id;


                    btnPopUp_ModalPopupExtender.Show();
                    this.LimpiarClases();
                    this.MostrarDatos();

                }
                else if (e.CommandName == "Maquina")
                {
                    variablesGlobales variable_linea = new variablesGlobales();
                    variablesGlobales.id_linea_actual = Convert.ToInt32(id);
                    variablesGlobales.nombre_linea_actual = nombre;
                    Response.Redirect("../lineas_produccion/maquinas.aspx");
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