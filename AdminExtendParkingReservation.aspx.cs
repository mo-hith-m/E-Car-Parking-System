using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminExtendParkingReservation : System.Web.UI.Page
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
    protected void ddlrid_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            con1.Open();
            string str1 = "select From_Date,Total_Days,Parking_Area_Code,Parking_Slot_No from Reservation where ReservationID=" + ddlrid.Text;
            SqlCommand cmd1 = new SqlCommand(str1, con1);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            reader1.Read();
            lbldateofparking.Text = reader1.GetDateTime(0).ToShortDateString();
            lbldays.Text = reader1.GetValue(1).ToString();
            Session["ParkingAreaCode"] = reader1.GetValue(2).ToString();
            Session["ParkingSlotNo"] = reader1.GetString(3).Trim();
            con1.Close();
            con.Open();
            string str = "select Tablename from Parking where ParkingAreaCode='" + Session["ParkingAreaCode"] + "'";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            Session["tablename"] = reader.GetString(0).Trim();
            con.Close();
        }
        catch (Exception e1)
        {
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            DateTime cd, ed;
            cd = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            ed = Convert.ToDateTime(txttodate.Text.Trim());
            if (ed < cd)
            {
                Response.Write("<script>alert('Invalid Date Of Extend. It Cannot Be Prior Today ! ! !');</script>");
            }
            else
            {
                DateTime dop, doep;
                int days = 0;
                dop = Convert.ToDateTime(lbldateofparking.Text);
                doep = Convert.ToDateTime(txttodate.Text.Trim());
                days = Convert.ToInt32(doep.Subtract(dop).TotalDays);
                lbldays.Text = days.ToString();
                con.Open();
                string str = "update Reservation set To_Date=@todate,Total_Days=@days where ReservationID=" + ddlrid.Text;
                SqlCommand cmd = new SqlCommand(str, con);
                cmd.Parameters.Add("@todate", Convert.ToDateTime(txttodate.Text.Trim()));
                cmd.Parameters.Add("@days", Convert.ToInt32(days));
                cmd.ExecuteNonQuery();
                con.Close();
                con.Open();
                string str1 = "update " + Session["tablename"].ToString() + " set To_Date=@todate,Total_days=@days where Parking_Slot_No='" + Session["ParkingSlotNo"].ToString() + "'";
                SqlCommand cmd1 = new SqlCommand(str1, con);
                cmd1.Parameters.Add("@todate", Convert.ToDateTime(txttodate.Text.Trim()));
                cmd1.Parameters.Add("@days", Convert.ToInt32(days));
                cmd1.ExecuteNonQuery();
                con.Close();
                loadreservation();
                Response.Write("<script>alert('Parking Date Extended Successfully ! ! !');</script>");
            }
        }
        catch (Exception e1)
        {
        }
    }
}