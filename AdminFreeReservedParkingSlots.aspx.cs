using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminFreeParking : System.Web.UI.Page
{
     SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");
     SqlConnection con1 = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");
     public void loadreservation()
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
                 con1.Open();
                 ddlrid.Items.Clear();
                 ddlrid.Items.Add("--Select--");
                 string str1 = "select ReservationID from Reservation";
                 SqlCommand cmd1 = new SqlCommand(str1, con1);
                 SqlDataReader reader1 = cmd1.ExecuteReader();
                 while (reader1.Read())
                 {
                     ddlrid.Items.Add(reader1.GetValue(0).ToString());
                 }
                 con1.Close();
             }
             else
             {
                 ddlrid.Items.Clear();
                 ddlrid.Items.Add("--Select--");
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
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!IsPostBack)
            {
                loadreservation();
            }
        }
        catch (Exception e1)
        {
        }

    }
   
    protected void btnfreeslot_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlrid.Text == "--Select--")
            {
                Response.Write("<script>alert('Please Select The Reservation ID ! ! !');</script>");
            }
            else
            {
                con1.Open();
                string str1 = "select Parking_Area_Code,Parking_Slot_No from Reservation where ReservationID=" + ddlrid.Text;
                SqlCommand cmd1 = new SqlCommand(str1, con1);
                SqlDataReader reader1 = cmd1.ExecuteReader();
                reader1.Read();
                Session["ParkingAreaCode"] = reader1.GetValue(0).ToString();
                Session["ParkingSlotNo"] = reader1.GetString(1).Trim();
                con1.Close();
                con.Open();
                string str = "select Tablename from Parking where ParkingAreaCode=" + Session["ParkingAreaCode"];
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                Session["tablename"] = reader.GetString(0).Trim();
                con.Close();
                con.Open();
                string str2 = "delete from " + Session["tablename"] + " where Parking_Slot_No='" + Session["ParkingSlotNo"] + "'";
                SqlCommand cmd2 = new SqlCommand(str2, con);
                cmd2.ExecuteNonQuery();
                con.Close();
                con.Open();
                string str3 = "insert into " + Session["tablename"] + "(Parking_Slot_No,Parking_Status,Total_days)values('" + Session["ParkingSlotNo"] + "','Available'," + 0 + ")";
                SqlCommand cmd3 = new SqlCommand(str3, con);
                cmd3.ExecuteNonQuery();
                con.Close();
                con.Open();
                string str4 = "insert into FreedReservation select * from Reservation where ReservationID=" + ddlrid.Text;
                SqlCommand cmd4 = new SqlCommand(str4, con);
                cmd4.ExecuteNonQuery();
                con.Close();
                con.Open();
                string str5 = "delete from Reservation where ReservationID=" + ddlrid.Text;
                SqlCommand cmd5 = new SqlCommand(str5, con);
                cmd5.ExecuteNonQuery();
                con.Close();
                loadreservation();
                Response.Write("<script>alert('DeReservation Is Done Successfully ! ! !');</script>");

            }
        }
        catch (Exception e1)
        {
        }
    }
}