using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class NewUser : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\SQLEXPRESS;Initial Catalog=ECarParking;Integrated Security=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lbldor.Text = DateTime.Now.ToShortDateString();
        }
        catch (Exception e1)
        {
        }
    }
    protected void btnregister_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            con.Open();
            bool exist = false;
            string str = "select * from Login where UserName='" + txtuname.Text.Trim() + "'";
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
                Response.Write("<script>alert('Sorry This Username Already Exists...');</script>");
            }
            else
            {
                con.Open();
                string str1 = "insert into Register values(@name,@uname,@type,@eid,@mno,@dor)";
                SqlCommand cmd1 = new SqlCommand(str1, con);
                cmd1.Parameters.Add("@uname", txtuname.Text.Trim());
                cmd1.Parameters.Add("@name", txtname.Text.Trim());
                cmd1.Parameters.Add("@type", ddlusertype.Text);
                cmd1.Parameters.Add("@eid", txteid.Text.Trim());
                cmd1.Parameters.Add("@mno", txtmno.Text.Trim());
                cmd1.Parameters.Add("@dor", lbldor.Text);
                cmd1.ExecuteNonQuery();
                con.Close();
                con.Open();
                string str2 = "insert into Login values(@uname,@pwd,@type)";
                SqlCommand cmd2 = new SqlCommand(str2, con);
                cmd2.Parameters.Add("@uname", txtuname.Text.Trim());
                cmd2.Parameters.Add("@pwd", txtpwd.Text.Trim());
                cmd2.Parameters.Add("@type", ddlusertype.Text);
                cmd2.ExecuteNonQuery();
                con.Close();
                Response.Redirect("RegistrationCompleted.aspx");
            }
        }
        catch (Exception e1)
        {
        }
    }
}