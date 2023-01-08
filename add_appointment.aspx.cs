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
    public partial class add_appointment : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["student_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            appointment();
        }

        public void appointment()
        {
            try
            {
                string sql = @"SELECT MAX(appointment_id) FROM [Appointment] ";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                var maxid = cmd.ExecuteScalar() as string;

                if (maxid == null)
                {
                    Aid.Text = "A-0001";
                }
                else
                {
                    int intval = int.Parse(maxid.Substring(2, 4));
                    intval++;
                    Aid.Text = String.Format("A-{0:0000}", intval);
                }
                con.Close();
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }
        protected void AddButton_Click(object sender, EventArgs e)
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

                string sql = @"INSERT INTO [Appointment] Values (@appointment_id, @student_id, @name, @contact, @programme, @date, @time, @remark )";
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
                               "swal({title:'Congratulations!', text:'Successfully Add Appointment.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'appointment.aspx';})", true);
            }
            catch (FormatException ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("appointment.aspx");
            CancelButton.CausesValidation = false;
        }
        protected void ResetButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("add_appointment.aspx");
            ResetButton.CausesValidation = false;
        }
    }
}