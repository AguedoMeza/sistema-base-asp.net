using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            String nombre = Session["nom"].ToString();
           
            this.Label2.Text = nombre;
        }
        catch (Exception ex)
        {
            Response.Redirect("../login/login.aspx?men=1");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
         Session.Remove("nom");
         Response.Redirect("../login/login.aspx");

    }
}
