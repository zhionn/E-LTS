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
    public partial class update_appointment : System.Web.UI.Page
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
                    course.Text = dr["programme"].ToString();
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
        protected void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                string aid = Aid.Text;
                string id = student_id.Text;
                string Name = name.Text;
                string contact = phoneNumber.Text;
                string programme = course.Text;
                string Date = date.Text;
                string Time = time.Text;
                string mark = remark.Text;

                string sql = @"UPDATE Appointment SET student_id = @student_id, name=@name, 
                               contact=@contact, programme=@programme, date=@date, time=@time, remark=@remark
                               WHERE appointment_id=@appointment_id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@appointment_id", aid);
                cmd.Parameters.AddWithValue("@student_id", id);
                cmd.Parameters.AddWithValue("@name", Name);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@programme", programme);
                cmd.Parameters.AddWithValue("@time", Time);
                cmd.Parameters.AddWithValue("@date", Date);
                cmd.Parameters.AddWithValue("@remark", mark);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                               "swal({title:'Congratulations!', text:'Succesfully Update Appointment.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'appointment.aspx';})", true);
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("appointment.aspx");
            CancelButton.CausesValidation = false;
        }
    }
}