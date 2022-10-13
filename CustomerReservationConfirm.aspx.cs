using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CustomerReservationConfirm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string rid = Request.QueryString[0].Trim();
            lblrid.Text = rid.ToString();
        }
        catch (Exception e1)
        {
        }
    }
}