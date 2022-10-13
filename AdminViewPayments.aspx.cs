using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class AdminViewPayments : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");
    SqlConnection con1 = new SqlConnection("Data Source=localhost\\sqlexpress;Initial Catalog=ECarParking;Integrated Security=True;Pooling=False");

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            string str = "select * from FreedReservation";
            SqlCommand cmd = new SqlCommand(str, con);
            SqlDataAdapter dap = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            dap.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                int days = 0;
                double charges = 0, bill = 0, total = 0;
                con1.Open();
                string str1 = "select Charge_Per_day,Total_Days from FreedReservation";
                SqlCommand cmd1 = new SqlCommand(str1, con1);
                SqlDataReader reader1 = cmd1.ExecuteReader();
                while (reader1.Read())
                {
                    charges = Convert.ToDouble(reader1.GetValue(0));
                    days = Convert.ToInt32(reader1.GetValue(1));
                    bill = charges * days;
                    total += bill;
                }
                con1.Close();

                lbltotal.Visible = true;
                lbltotal.Text = "Total Amount : Rs," + total.ToString();
            }
            else
            {
                GridView1.DataSource = null;
                lbltotal.Visible = false;
                Response.Write("<script>alert('No Records Found');</script>");
            }
            DataBind();
            con.Close();
        }
        catch (Exception e1)
        {
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        con.Open();
        string str = "select * from FreedReservation where To_Date='"+Calendar1.SelectedDate.ToShortDateString()+"'";
        SqlCommand cmd = new SqlCommand(str, con);
        SqlDataAdapter dap = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        dap.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            GridView2.DataSource = dt;
            int days = 0;
            double charges = 0, bill = 0, total = 0;
            con1.Open();
            string str1 = "select Charge_Per_day,Total_Days from FreedReservation where To_Date='" + Calendar1.SelectedDate.ToShortDateString() + "'";
            SqlCommand cmd1 = new SqlCommand(str1, con1);
            SqlDataReader reader1 = cmd1.ExecuteReader();
            while (reader1.Read())
            {
                charges = Convert.ToDouble(reader1.GetValue(0));
                days = Convert.ToInt32(reader1.GetValue(1));
                bill = charges * days;
                total += bill;
            }
            con1.Close();

            lblpayment.Visible = true;
            lblpayment.Text = "Total Amount : Rs," + total.ToString();
        }
        else
        {
            GridView2.DataSource = null;
            lblpayment.Visible = false;
            Response.Write("<script>alert('No Payments Found');</script>");
        }
        DataBind();
        con.Close();
    }
}