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
        Uri uriAddress1 = new Uri("http://localhost:59977/administracion/usuarios/usuarios.aspx");
        string carpeta = uriAddress1.Segments[2];

        if (!IsPostBack)
        {
            this.Label3.Text = carpeta;
           this.LLenarGrid();
           //this.LlemarCombo();
           /// pn_nombre.Controls.OfType<TextBox>().Count();
           //int var =  pn_nombre.Controls.OfType<TextBox>().Count();
           //this.Label3.Text = var.ToString();
        }
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

    public void chkStatus_OnCheckedChanged(object sender, EventArgs e)
    {
     
            CheckBox chkStatus = (CheckBox)sender;
          
           int nID = Convert.ToInt32(GridView1.DataKeys[((GridViewRow)chkStatus.NamingContainer).RowIndex].Value);

           if(chkStatus.Checked)
           {
               LogInc cnn = new LogInc();

               cnn.Activo = 1;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           else
           {
               LogInc cnn = new LogInc();

               cnn.Activo = 0;
               cnn.idUsuario = nID;
               int var = cnn.estado();
           }
           this.LLenarGrid();
    }

    private void LLenarGrid()
    {
        LogInc cnn = new LogInc();

        cnn.idUsuario = 0;

        this.GridView1.DataSource = cnn.UsuarioDetalle();

        this.GridView1.DataBind();

        GridView1.Columns[0].ItemStyle.Width = 50;
       
        GridView1.Columns[6].ItemStyle.Width = 50;
        GridView1.Columns[7].ItemStyle.Width = 50;
     
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
        //obtengo el nombre de la carpeta actual
        Uri uriAddress1 = new Uri("http://localhost:59977/administracion/usuarios/usuarios.aspx");
        string carpeta = uriAddress1.Segments[2];

        //le jalo la variable a la clase, ya que le asigne el vaalor desde el login ALV :v
        int usuarioLoging = variablesGlobales.id_usuario_login;
      
        int idUsuario = Convert.ToInt32(Session["idUsuario"]);
        int idUsuarioResgistro = Convert.ToInt32(Session["id_usuario_registro"]);

        //obtenermos el id del modulo en el que esta situado
        moduloc cnnModulo = new moduloc();
        cnnModulo.Nombre = "usuarios";
        DataTable dt = new DataTable();
        dt = cnnModulo.ModuloDetalleByNombre();

        string idModuloActual = "";
        foreach (DataRow fila in dt.Rows)
        {
           idModuloActual = fila["id"].ToString();
        }

        //preparo el insert para la bitacora :v
        bitacorac cnnBitacora = new bitacorac();
        cnnBitacora.Empresa = usuarioLoging;
        cnnBitacora.Accion = Convert.ToInt32(idModuloActual);
        int varBitacora = 0;

        if (idUsuario != 0)
        {
           if(this.prueba()==true && this.validarCombos()==true)
           {
                    LogInc cnn = new LogInc();

                    cnn.Usuaio = this.txtUsuario.Text;
                    cnn.Nombre = this.txtNombre.Text;
                    cnn.NoEmpleado = this.txtCurp.Text;
                    cnn.Apellido = this.txtAp_paterno.Text;
                    cnn.Password = this.txtContrasena.Text;
                    cnn.Empresa = Convert.ToInt32(this.ddlist_empresas.SelectedValue.ToString());
                    cnn.Correo = this.txtCorreo.Text;
                    cnn.idUsuario = idUsuario;
                    int var = cnn.UsuarioUpdate();
                    varBitacora = cnnBitacora.BitacorasInsert();
                    Session.Remove("idUsuario");
                    btnPopUp_ModalPopupExtender.Hide();
                    Response.Redirect("../usuarios/usuarios.aspx");
           }

        }
        
        else
        {
            if (this.prueba() == true && validarCombos()==true)
            {
                if (this.txtContrasena.Text == this.txtConf.Text)
                {
                    LogInc cnn = new LogInc();

                    cnn.Nombre = this.txtNombre.Text;
                    cnn.Apellido = this.txtAp_paterno.Text;
                    cnn.Apellido_Materno = this.txtAp_Materno.Text;
                    cnn.Usuaio = this.txtUsuario.Text;
                    cnn.Password = this.txtContrasena.Text;
                    cnn.NoEmpleado = this.txtCurp.Text;
                    cnn.Empresa = Convert.ToInt16(this.ddlist_empresas.SelectedValue.ToString());
                    cnn.Correo = this.txtCorreo.Text;
                    cnn.Activo = 1;
                    cnn.NoRuta = idUsuarioResgistro;

                    int var = cnn.UsuariosInsert();
                    varBitacora = cnnBitacora.BitacorasInsert();

                    btnPopUp_ModalPopupExtender.Hide();

                    Response.Redirect("../usuarios/usuarios.aspx");
                }
                else
                {
                    this.txtContrasena.CssClass = "form-control2";
                    this.txtConf.CssClass = "form-control2";
                }
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
        this.LlemarCombo();
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
        this.ddlist_empresas.CssClass = "form-control";
    }
    
    
    private void LlemarCombo()
    {
        empresac cnn = new empresac();

        cnn.idUsuario = 100;
       
        this.ddlist_empresas.DataSource = cnn.EmpresaDetalle();
        this.ddlist_empresas.DataValueField = "id";
        this.ddlist_empresas.DataTextField = "nombre";
        this.ddlist_empresas.DataBind();

        this.ddlist_empresas.ClearSelection();
       
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

                    string contrasena = fila["Contraseña"].ToString();
                    this.txtContrasena.Text = contrasena;
                    this.txtConf.Text = contrasena;

                    string curp = fila["CURP"].ToString();
                    this.txtCurp.Text = curp;

                    string nombre = fila["Nombre"].ToString();
                    //this.txtNombre.Text = nombre;

                    string ap_paterno = fila["Ap_Paterno"].ToString();
                    this.txtAp_paterno.Text = ap_paterno;

                    string ap_materno = fila["Ap_Materno"].ToString();
                    this.txtAp_Materno.Text = ap_materno;

                    string correo = fila["correo"].ToString();
                    this.txtCorreo.Text = correo;


                    string empresa = fila["id_empresa"].ToString();
                    string empresa_nombre = fila["Empresa"].ToString();

                    string estado_empresaa = fila["Activo"].ToString();
                  
                    this.txtNombre.Text = estado_empresaa;

                    this.ddlist_empresas.Items.Insert(0, new ListItem(empresa_nombre, empresa));
                    if(estado_empresaa == "True")
                    {
                        this.ddlist_empresas.ClearSelection();
                        this.ddlist_empresas.Items.FindByValue(empresa).Selected = true;
                       
                    }
                   
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
                   
                    this.LlemarCombo();
                    this.MostrarDatos();
                    this.LimpiarClases();
                  
                }
            }
        }
        catch (Exception)
        {
        }
    }
   

    protected void txtCorreo_TextChanged(object sender, EventArgs e)
    {
      
    }
}