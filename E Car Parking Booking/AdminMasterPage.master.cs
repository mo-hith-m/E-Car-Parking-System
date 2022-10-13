using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["username"] == null)
            {
                Response.Redirect("SignOut.aspx");
            }
        }
        catch (Exception e1)
        {
        }
    }
    protected void btnsignout_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Session["username"] = null;
            Response.Redirect("SignOut.aspx");
        }
        catch (Exception e1)
        {
        }
    }
}
