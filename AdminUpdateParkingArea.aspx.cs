using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminUpdateParkingArea : System.Web.UI.Page
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
                btnupdate.Visible = false;
                Response.Write("<script>alert('Sorry You Cannot Update As There Are Some Parking Reservation In This Parking Area ! ! !');</script>");
            }
            else
            {
                btnupdate.Visible = true;
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
    protected void btnupdate_Click(object sender, EventArgs e)
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


            string area = "", code = "", tablename = "";
            area = ddlarea.Text;
            code = ddlpcode.Text;
            tablename = area.Substring(0, 4) + code;
            con.Open();
            string str = "insert into Parking values(@pid,@city,@area,@add,@nops,@tablename)";
            SqlCommand cmd = new SqlCommand(str, con);
            cmd.Parameters.Add("@pid", Convert.ToInt32(ddlpcode.Text));
            cmd.Parameters.Add("@city", ddlcity.Text);
            cmd.Parameters.Add("@area", ddlarea.Text);
            cmd.Parameters.Add("@add", txtaddress.Text.Trim());
            cmd.Parameters.Add("@nops", Convert.ToInt32(txtparkingslots.Text.Trim()));
            cmd.Parameters.Add("@tablename", tablename);
            cmd.ExecuteNonQuery();
            con.Close();
            con.Open();
            string str1 = "create table " + tablename + "(Parking_Slot_No varchar(25),Parking_Status varchar(50),From_Date date default NULL,To_Date date default NULL,Total_days int)";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            cmd1.ExecuteNonQuery();
            con.Close();
            int slots = Convert.ToInt32(txtparkingslots.Text.Trim());
            for (int i = 1; i <= slots; i++)
            {
                con.Open();
                string str3 = "insert into " + tablename + "(Parking_Slot_No,Parking_Status,Total_days)values('Slot" + i.ToString() + "','Available'," + 0 + ")";
                SqlCommand cmd3 = new SqlCommand(str3, con);
                cmd3.ExecuteNonQuery();
                con.Close();
            }

            Response.Write("<script>alert('Parking Area Registration and Parking Slots Creation Updated Successfully! ! !');</script>");
        }
        catch (Exception e1)
        {
        }
    }
}