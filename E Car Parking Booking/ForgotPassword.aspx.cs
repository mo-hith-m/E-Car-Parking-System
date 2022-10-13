using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ForgotPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=ECarParking;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            bool exist = false;
            string str = "select * from Register where Username='" + txtuname.Text.Trim() + "' and EmailId='" + txteid.Text.Trim() + "' and MobileNo='" + txtmno.Text.Trim() + "'";
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
                con.Open();
                string str1 = "select Password from Login where UserName='" + txtuname.Text.Trim() + "'";
                SqlCommand cmd1 = new SqlCommand(str1, con);
                SqlDataReader reader = cmd1.ExecuteReader();
                reader.Read();
                lblpassword.Text = "Your Password Is :  " + reader.GetString(0).Trim();
                con.Close();

            }
            else
            {
                lblpassword.Text = "";
                Response.Write("<script>alert('Sorry Incorrect Details');</script>");

            }
        }
        catch (Exception e1)
        {
        }
    }
}