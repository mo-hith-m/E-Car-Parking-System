using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminAddParkingArea : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");
    int parkingcode;
    public void GenerateParkingCode()
    {
        try
        {
            con.Open();
            string str = "select max(ParkingAreaCode) from Parking";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            if (reader.IsDBNull(0))
            {
                parkingcode = 221;
            }
            else
            {


                parkingcode = Convert.ToInt32(reader.GetValue(0));
                parkingcode++;
            }
            con.Close();
            lblparkingcode.Text = parkingcode.ToString();
        }
        catch (Exception e1)
        {
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                GenerateParkingCode();
            }
        }
        catch (Exception e1)
        {
        }
    }
    protected void ddlcity_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            ddlarea.Items.Clear();
            ddlarea.Items.Add("--Select--");
            con.Open();
            string str = "select distinct(Area) from " + ddlcity.Text;
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
    protected void btnadd_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlarea.Text == "--Select--")
            {
                Response.Write("<script>alert('Please Select The Area ! ! !');</script>");

            }
            else
            {
                bool exist = false;
                con.Open();
                string str2 = "select * from Parking where Area='" + ddlarea.Text + "' and Address='" + txtaddress.Text.Trim() + "'";
                SqlCommand cmd2 = new SqlCommand(str2, con);
                SqlDataReader reader2 = cmd2.ExecuteReader();
                reader2.Read();
                if (reader2.HasRows)
                {
                    exist = true;
                }
                con.Close();
                if (exist == true)
                {
                    Response.Write("<script>alert('This Parking Area Is Already Registered ! ! !');</script>");
                }
                else
                {
                    string area = "", code = "", tablename = "";
                    area = ddlarea.Text;
                    code = lblparkingcode.Text;
                    tablename = area.Substring(0, 4) + code;
                    con.Open();
                    string str = "insert into Parking values(@pid,@city,@area,@add,@nops,@tablename)";
                    SqlCommand cmd = new SqlCommand(str, con);
                    cmd.Parameters.Add("@pid", Convert.ToInt32(lblparkingcode.Text));
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
                    GenerateParkingCode();

                    txtaddress.Text = "";
                    txtparkingslots.Text = "";

                    Response.Write("<script>alert('Parking Area Registered and Parking Slots Created Successfully! ! !');</script>");
                }
            }
        }
        catch (Exception e1)
        {
        }
    }
    
}