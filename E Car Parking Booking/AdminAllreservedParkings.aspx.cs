using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminAllreservedParkings : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            string str = "select * from Reservation";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
            }
            else
            {
                GridView1.DataSource = null;
                Response.Write("<script>alert('No Parking Reservation Found ! ! !');</script>");
            }
            DataBind();
            con.Close();
        }
        catch (Exception e1)
        {
        }
    }
}