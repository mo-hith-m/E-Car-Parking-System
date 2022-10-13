using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CustomerParkingBill : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");
    SqlConnection con1 = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (txtrid.Text == "")
            {
                GridView1.DataSource = null;
                DataBind();
                Response.Write("<script>alert('Please Enter The Reservation ID ! ! !');</script>");
            }
            else
            {
                con.Open();
                string str = "select * from Reservation where ReservationID=" + txtrid.Text.Trim();
                SqlCommand cmd = new SqlCommand(str, con);
                SqlDataAdapter dap = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                dap.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    GridView1.DataSource = dt;
                    int days = 0;
                    double charges = 0, bill = 0;
                    con1.Open();
                    string str1 = "select Charge_Per_day,Total_Days from Reservation where ReservationID=" + txtrid.Text.Trim();
                    SqlCommand cmd1 = new SqlCommand(str1, con1);
                    SqlDataReader reader1 = cmd1.ExecuteReader();
                    reader1.Read();
                    charges = Convert.ToDouble(reader1.GetValue(0));
                    days = Convert.ToInt32(reader1.GetValue(1));
                    con1.Close();
                    bill = charges * days;
                    lblbill.Visible = true;
                    lblbill.Text = "Bill : Rs," + bill.ToString();
                }
                else
                {
                    GridView1.DataSource = null;
                    lblbill.Visible = false;
                    Response.Write("<script>alert('No Records Found For This Reservation ID ! ! !');</script>");
                }
                DataBind();
                con.Close();
            }
        }
        catch (Exception e1)
        {
        }
    }
}