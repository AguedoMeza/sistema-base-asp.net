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
    public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
    {
     
            CheckBox chkStatus = (CheckBox)sender;
          
           int nID = Convert.ToInt32(GridView1.DataKeys[((GridViewRow)chkStatus.NamingContainer).RowIndex].Value);

           if(chkStatus.Checked)
           {
               accionesc cnn = new accionesc();

               cnn.Activo = 1;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           else
           {
               accionesc cnn = new accionesc();

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
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            texto.CssClass = "form-control";
        }
    }

    private void LLenarGrid()
    {
        accionesc cnn = new accionesc();

        cnn.idUsuario = 0;

        this.GridView1.DataSource = cnn.AccionesDetalle();

        this.GridView1.DataBind();

        GridView1.Columns[0].ItemStyle.Width = 50;

        GridView1.Columns[4].ItemStyle.Width = 50;
        GridView1.Columns[5].ItemStyle.Width = 50;

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
            if (this.EstanCamposLLenos() == true)
            {
                accionesc cnn = new accionesc();


                cnn.Nombre = this.txtNombre.Text;
                cnn.Descripcion = this.txtDefinicion.Text;
                cnn.Actividad = this.txtActividad.Text;
                cnn.idUsuario = idUsuario;

                int var = cnn.AccionesUpdate();

                Session.Remove("idUsuario");
                btnPopUp_ModalPopupExtender.Hide();
                Response.Redirect("../acciones/acciones.aspx");
            }
                  
              
        }

        else
        {
            if (this.EstanCamposLLenos() == true)
            {
                accionesc cnn = new accionesc();
                cnn.idUsuario = idUsuarioResgistro;
                cnn.Nombre = this.txtNombre.Text;
                cnn.Descripcion = this.txtDefinicion.Text;
                cnn.Actividad = this.txtActividad.Text;
                cnn.Activo = 1;

                int var = cnn.AccionesInsert();

                btnPopUp_ModalPopupExtender.Hide();

                Response.Redirect("../acciones/acciones.aspx");
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
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            texto.Text = String.Empty;
        }
    }

    


    private void MostrarDatos()
    {

            int idUsuario = Convert.ToInt32(Session["idUsuario"]);

            accionesc cnn = new accionesc();

            cnn.idUsuario = idUsuario;


            DataTable dt = new DataTable();

            dt = cnn.AccionesDetalle();

            foreach (DataRow fila in dt.Rows)
            {
               
                string nombre = fila["nombre"].ToString();
                this.txtNombre.Text = nombre;

                string definicion = fila["definicion"].ToString();
                this.txtDefinicion.Text = definicion;

                string actividad = fila["actividad"].ToString();
                this.txtActividad.Text = actividad;

              
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
                    this.MostrarDatos();
                  
                }
            }
        }
        catch (Exception)
        {
        }
    }
}