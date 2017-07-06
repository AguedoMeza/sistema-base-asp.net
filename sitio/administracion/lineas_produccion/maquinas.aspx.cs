using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProjectBseBusiness;
using System.Configuration;
using System.Data;

public partial class administracion_lineas_produccion_maquinas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
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



        }
    }
}