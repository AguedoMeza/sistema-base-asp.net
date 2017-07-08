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
          maquinasc cnn = new maquinasc();
        cnn.idUsuario = 1; //evaluo linea de la que es la maquina :v
        DataTable dt = new DataTable();
        dt = cnn.MaquinaDetalle();

        this.li1.Visible = false;
        this.li2.Visible = false;
        this.li3.Visible = false;
        this.li4.Visible = false;
        this.li5.Visible = false;
        this.li6.Visible = false;
        this.li7.Visible = false;
        this.li8.Visible = false;


        foreach (DataRow fila in dt.Rows)
        {
            string id_maquina = "li"+fila["id"].ToString();

            if(id_maquina.ToString() == this.li1.ID.ToString())
            {
                this.li1.Visible = true;
            }
            if (id_maquina.ToString() == this.li2.ID.ToString())
            {
                this.li2.Visible = true;
            }
            if (id_maquina.ToString() == this.li3.ID.ToString())
            {
                this.li3.Visible = true;
            }
            if (id_maquina.ToString() == this.li4.ID.ToString())
            {
                this.li4.Visible = true;
            }
            if (id_maquina.ToString() == this.li5.ID.ToString())
            {
                this.li5.Visible = true;
            }
            if (id_maquina.ToString() == this.li6.ID.ToString())
            {
                this.li6.Visible = true;
            }
            if (id_maquina.ToString() == this.li7.ID.ToString())
            {
                this.li7.Visible = true;
            }
            if (id_maquina.ToString() == this.li8.ID.ToString())
            {
                this.li8.Visible = true;
            }




        }
    }
            
        }
    
    public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
    {
     
            CheckBox chkStatus = (CheckBox)sender;
          
       //    int nID = Convert.ToInt32(GridView1.DataKeys[((GridViewRow)chkStatus.NamingContainer).RowIndex].Value);

           if(chkStatus.Checked)
           {
               perfilc cnn = new perfilc();

               cnn.Activo = 1;
            //   cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           else
           {
               perfilc cnn = new perfilc();

               cnn.Activo = 0;
             //  cnn.idUsuario = nID;
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
    
    private void LimpiarClases()
    {
        foreach (TextBox texto in pn_nombre.Controls.OfType<TextBox>())
        {
            texto.CssClass = "form-control";
        }
    }

    private void LLenarGrid()
    {
        //perfilc cnn = new perfilc();

        //cnn.idUsuario = 0;

        //this.GridView1.DataSource = cnn.PerfilDetalle();

        //this.GridView1.DataBind();

        //GridView1.Columns[0].ItemStyle.Width = 50;

        //GridView1.Columns[3].ItemStyle.Width = 50;
        //GridView1.Columns[4].ItemStyle.Width = 50;    
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
            if(this.EstanCamposLLenos() == true && this.validarCombos()==true)
            {
            perfilc cnn = new perfilc();

           
            cnn.Nombre = this.txtNombre.Text;
           
   
            cnn.idUsuario = idUsuario;

            int var = cnn.PerfilesUpdate();

            Session.Remove("idUsuario");
            btnPopUp_ModalPopupExtender.Hide();
            Response.Redirect("../perfiles/perfiles.aspx");
            }
        }
        else
        {
            if (this.EstanCamposLLenos() == true && this.validarCombos()==true)
            {
                maquinasc cnn = new maquinasc();

                cnn.Nombre = this.txtNombre.Text;
        
                cnn.Linea = 1;
                cnn.Nombre = this.txtNombre.Text;
                cnn.Serie = this.txtSerie.Text;

                int var = cnn.MaquinasInsert();

                btnPopUp_ModalPopupExtender.Hide();

                Response.Redirect("../lineas_produccion/maquinas.aspx");
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

    

   
    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            short indicefila;
            indicefila = Convert.ToInt16(e.CommandArgument);
            string id;
            
            //if (indicefila >= 0 & indicefila < GridView1.Rows.Count)
            //{
            //    id = GridView1.Rows[indicefila].Cells[0].Text;
               
            //    if (e.CommandName == "Actualizar")
            //    {
            //        Session["idUsuario"] = id;
                   
                  
                   
            //        btnPopUp_ModalPopupExtender.Show();
            //        this.LimpiarClases();
            //        this.LlemarCombo();
            //        this.MostrarDatos();
                  
            //    }
            //}
        }
        catch (Exception)
        {
        }
    }
}