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
    public partial class add_student : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void RegisterBtn_Click(object sender, EventArgs e)
        {
            try
            {
                string id = student_id.Text;
                string Name = name.Text;
                string Email = email.Text;
                string password = PasswordTxt.Text;
                string contact = phoneNumber.Text;
                string programme = course.Text;


                string sql = @"INSERT INTO [Student] Values (@student_id, @name, @email, @password, @contact, @programme)";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@student_id", id);
                cmd.Parameters.AddWithValue("@name", Name);
                cmd.Parameters.AddWithValue("@email", Email);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@programme", programme);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                               "swal({title:'Congratulations!', text:'Succesfully Add Student.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'studentList.aspx';})", true);
            }
            catch (FormatException ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }
    }
}