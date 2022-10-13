using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CustomerReserveParkingSlot : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");

    int ReservationID;
    public void GenerateReservationID()
    {
        try
        {
            con.Open();
            string str = "select max(ReservationID) from Reservation";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            if (reader.IsDBNull(0))
            {
                ReservationID = 1781;
            }
            else
            {


                ReservationID = Convert.ToInt32(reader.GetValue(0));
                ReservationID++;
            }
            con.Close();
            lblreservationid.Text = ReservationID.ToString();
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
                lbldob.Text = DateTime.Now.ToShortDateString();


            }
            GenerateReservationID();
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
            ddlparkingslot.Items.Clear();
            ddlparkingslot.Items.Add("--Select--");
            con.Open();
            string str = "select Tablename from Parking where ParkingAreaCode=" + ddlpcode.Text;
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            Session["tablename"] = reader.GetString(0).Trim();
            con.Close();
            con.Open();
            string str1 = "select Parking_Slot_No from " + Session["tablename"].ToString() + " where Parking_Status='Available'";
            SqlCommand cmd1 = new SqlCommand(str1, con);
            SqlDataReader reader1 = cmd1.ExecuteReader();

            while (reader1.Read())
            {
                ddlparkingslot.Items.Add(reader1.GetString(0).Trim());
            }
            con.Close();
        }
        catch (Exception e1)
        {
        }
    }
    protected void ddlparkingslot_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnreserve_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            if (ddlcity.Text == "--Select--")
            {
                Response.Write("<script>alert('Please Select The Parking City ! ! !');</script>");
            }
            else if (ddlarea.Text == "--Select--")
            {
                Response.Write("<script>alert('Please Select The Parking Area ! ! !');</script>");
            }
            else if (ddlpcode.Text == "--Select--")
            {
                Response.Write("<script>alert('Please Select The Parking Area Code ! ! !');</script>");
            }
            else if (ddlparkingslot.Text == "--Select--")
            {
                Response.Write("<script>alert('Please Select Your Parking Slot No  ! ! !');</script>");
            }
            else if (txtdop.Text == "")
            {
                Response.Write("<script>alert('Please Select The Parking Date ! ! !');</script>");
            }

            else
            {
                DateTime cd, pd, tomo;
                cd = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                tomo = Convert.ToDateTime(cd.AddDays(1));
                pd = Convert.ToDateTime(txtdop.Text.Trim());
                if (pd < cd || pd > tomo)
                {
                    Response.Write("<script>alert('Vehicle Parking Reservation Is Only For Today And Tomorrow ! ! !');</script>");
                }
                else
                {
                    int days = 1;
                    con.Open();
                    string str = "insert into Reservation values(@rid,@vno,@cname,@mno,@city,@area,@code,@charges,@slotno,@dob,@fromdate,@todate,@days)";
                    SqlCommand cmd = new SqlCommand(str, con);
                    cmd.Parameters.Add("@rid", Convert.ToInt16(lblreservationid.Text));
                    cmd.Parameters.Add("@vno", txtvehicleno.Text.Trim());
                    cmd.Parameters.Add("@cname", txtcustname.Text.Trim());
                    cmd.Parameters.Add("@mno", txtmno.Text.Trim());
                    cmd.Parameters.Add("@city", ddlcity.Text);
                    cmd.Parameters.Add("@area", ddlarea.Text);
                    cmd.Parameters.Add("@code", ddlpcode.Text);
                    cmd.Parameters.Add("@charges", Convert.ToDouble(lblcharges.Text));
                    cmd.Parameters.Add("@slotno", ddlparkingslot.Text);
                    cmd.Parameters.Add("@dob", lbldob.Text);
                    cmd.Parameters.Add("@fromdate", Convert.ToDateTime(txtdop.Text.Trim()).ToShortDateString());
                    cmd.Parameters.Add("@todate", Convert.ToDateTime(txtdop.Text.Trim()).ToShortDateString());
                    cmd.Parameters.Add("@days", days);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    con.Open();
                    string str1 = "update " + Session["tablename"].ToString() + " set Parking_Status=@ps,From_date=@fd,To_Date=@td,Total_days=@days where Parking_Slot_No=@slotno";
                    SqlCommand cmd1 = new SqlCommand(str1, con);
                    cmd1.Parameters.Add("@ps", lblreservationid.Text);
                    cmd1.Parameters.Add("@fd", Convert.ToDateTime(txtdop.Text.Trim()));
                    cmd1.Parameters.Add("@td", Convert.ToDateTime(txtdop.Text.Trim()));
                    cmd1.Parameters.Add("@days", Convert.ToInt32(days));
                    cmd1.Parameters.Add("@slotno", ddlparkingslot.Text);
                    cmd1.ExecuteNonQuery();
                    con.Close();
                    Response.Redirect("CustomerReservationConfirm.aspx?rid=" + lblreservationid.Text);
                }
            }
        }
        catch (Exception e1)
        {
        }

    }
}