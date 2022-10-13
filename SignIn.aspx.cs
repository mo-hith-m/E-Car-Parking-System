using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class SignIn : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=ECarParking;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btnlogin_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            con.Open();
            bool exist = false;
            string str = "select * from Login where Username='" + txtuname.Text.Trim() + "' and Password='" + txtpwd.Text.Trim() + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                exist = true;
            }
            con.Close();

            if (exist == true)
            {
                Session["username"] = txtuname.Text.Trim();

                Response.Redirect("AdminHome.aspx");

            }
            else
            {
                Response.Write("<script>alert('Invalid User');</script>");

            }
        }
        catch (Exception e1)
        {
        }
    }
}