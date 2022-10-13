using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminViewParkingDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlarea.Items.Clear();
            ddlarea.Items.Add("--Select--");
            con.Open();
            string str = "select distinct(Area) from Parking where City='" + ddlcity.Text + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ddlarea.Items.Add(reader.GetString(0).Trim());
            }
            con.Close();
        }
        catch (Exception e1)
        {
        }
    }
    protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlpcode.Items.Clear();
            ddlpcode.Items.Add("--Select--");
            con.Open();
            string str = "select ParkingAreaCode from Parking where City='" + ddlcity.Text + "' and Area='" + ddlarea.Text + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                ddlpcode.Items.Add(reader.GetValue(0).ToString());
            }
            con.Close();
            con.Open();
            string str1 = "select ParkingAreaCode,City,Area,Address,No_Of_Parking_Slots from Parking where City='" + ddlcity.Text + "' and Area='" + ddlarea.Text + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter dap = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            GridView1.DataSource = dt;
            DataBind();
            con.Close();
        }
        catch (Exception e1)
        {
        }
    }
    protected void ddlpcode_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            string str = "select Tablename from Parking where ParkingAreaCode=" + ddlpcode.Text;
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            Session["tablename"] = reader.GetString(0).Trim();
            con.Close();
            con.Open();
            string str1 = "select * from " + Session["tablename"].ToString();
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataAdapter dap1 = new SqlDataAdapter(cmd1);
            DataTable dt = new DataTable();
            dap1.Fill(dt);
            GridView2.DataSource = dt;
            DataBind();
            con.Close();
            ddlarea_SelectedIndexChanged(sender, e);
        }
        catch (Exception e1)
        {
        }
    }
}