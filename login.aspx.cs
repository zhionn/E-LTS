using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace E_LTS
{
    public partial class login : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void signin_Click(object sender, EventArgs e)
        {
            try
            {
                string sql = @"SELECT * FROM [Staff] WHERE staff_id=@staff_id AND password=@password";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@staff_id", LoginID.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataTableReader dtr = new DataTableReader(dt);
                adapter.Fill(dt);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["staff_id"] = LoginID.Text;
                    Response.Redirect("FormList.aspx");
                    string user = dtr["Staff"].ToString();
                    HttpCookie cookie = new HttpCookie("Staff", user);
                    cookie.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(cookie);
                    Session.RemoveAll();
                }
                else
                {
                    LabelIncorrect.Text = "Your ID or Password are incorrect...";
                    LabelIncorrect.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = ex.Message;
            }

            try
            {
                string sql = @"SELECT * FROM [Student] WHERE student_id=@student_id AND password=@password";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@student_id", LoginID.Text);
                cmd.Parameters.AddWithValue("@password", password.Text);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                DataTableReader dtr = new DataTableReader(dt);
                adapter.Fill(dt);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (dt.Rows.Count > 0)
                {
                    Session["student_id"] = LoginID.Text;
                    Response.Redirect("schedule.aspx");
                    string user = dtr["Student"].ToString();
                    HttpCookie cookie = new HttpCookie("Student", user);
                    cookie.Expires = DateTime.Now.AddDays(30);
                    Response.Cookies.Add(cookie);
                    Session.RemoveAll();
                }
                else
                {
                    LabelIncorrect.Text = "Your ID or Password are incorrect...";
                    LabelIncorrect.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                ErrorMsg.Text = ex.Message;
            }
        }
    }
}