using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminRemoveParkingArea : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");
    public void loadpcode()
    {
        try
        {
            txtaddress.Text = "";
            txtparkingslots.Text = "";
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
        }
        catch (Exception e1)
        {
        }
    }
    public void loadarea()
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
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnremove_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            string str4 = "drop table " + Session["tablename"].ToString();
            SqlCommand cmd4 = new SqlCommand(str4, con);
            cmd4.ExecuteNonQuery();
            con.Close();
            con.Open();
            string str5 = "delete from Parking where ParkingAreaCode=" + ddlpcode.Text;
            SqlCommand cmd5 = new SqlCommand(str5, con);
            cmd5.ExecuteNonQuery();
            con.Close();
            loadarea();
            loadpcode();
            Response.Write("<script>alert('Parking Area Registration and Parking Slots Creation Removed Successfully! ! !');</script>");
        }
        catch (Exception e1)
        {
        }
    }
    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            loadarea();
        }
        catch (Exception e1)
        {
        }
    }
    protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            loadpcode();
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
            bool reservation = false;
            con.Open();
            string str2 = "select * from " + Session["tablename"].ToString() + " where Parking_Status!='Available'";
            SqlCommand cmd2 = new SqlCommand(str2, con);
            SqlDataReader reader2 = cmd2.ExecuteReader();
            reader2.Read();
            if (reader2.HasRows)
            {
                reservation = true;
            }
            con.Close();
            if (reservation == true)
            {
                btnremove.Visible = false;
                Response.Write("<script>alert('Sorry You Cannot Remove As There Are Some Parking Reservation In This Parking Area ! ! !');</script>");
            }
            else
            {
                btnremove.Visible = true;
                con.Open();
                string str1 = "select Address,No_Of_Parking_Slots from Parking where ParkingAreaCode=" + ddlpcode.Text;
                SqlCommand cmd1 = new SqlCommand(str1, con);
                SqlDataReader reader1 = cmd1.ExecuteReader();
                reader1.Read();
                txtaddress.Text = reader1.GetString(0).Trim();
                txtparkingslots.Text = reader1.GetValue(1).ToString();
                con.Close();
            }
        }
        catch (Exception e1)
        {
        }
    }
}