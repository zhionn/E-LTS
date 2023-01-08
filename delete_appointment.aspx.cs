using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace E_LTS
{
    public partial class delete_appintment : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = Request.QueryString["appointment_id"] ?? "";

                string sql = "SELECT * FROM Appointment WHERE appointment_id = @id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    Aid.Text = dr["appointment_id"].ToString();
                    student_id.Text = dr["student_id"].ToString();
                    name.Text = dr["name"].ToString();
                    phoneNumber.Text = dr["contact"].ToString();
                    programme.Text = dr["programme"].ToString();
                    time.Text = dr["time"].ToString();
                    date.Text = dr["date"].ToString();
                    remark.Text = dr["remark"].ToString();
                }
                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("appointment.aspx");
                }
            }

        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            string LblID = Aid.Text;
            string sqlDelete = "DELETE FROM Appointment Where appointment_id = @appointment_id";
            SqlCommand cmdDelete = new SqlCommand(sqlDelete, conn);
            cmdDelete.Parameters.AddWithValue("@appointment_id", LblID);

            conn.Open();
            cmdDelete.ExecuteNonQuery();
            conn.Close();

            ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                               "swal({title:'Congratulations!', text:'Succesfully Delete.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'appointment.aspx';})", true);
        }
        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("appointment.aspx");
        }
    }
}