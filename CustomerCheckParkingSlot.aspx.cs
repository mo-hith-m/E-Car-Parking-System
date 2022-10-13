using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class CustomerCheckParkingSlot : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");

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
                }
                else
                {
                    GridView1.DataSource = null;
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