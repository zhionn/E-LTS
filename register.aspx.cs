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
    public partial class Register : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            course.Visible = false;
        }

        protected void signup_Click(object sender, EventArgs e)
        {
            string sqlEmail = @"SELECT email FROM [Staff][Student] WHERE email = '" + email.Text + "'";
            SqlConnection conCheckExist = new SqlConnection(cs);
            SqlCommand cmdEmail = new SqlCommand(sqlEmail, conCheckExist);
            SqlDataAdapter adapter = new SqlDataAdapter(cmdEmail);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                ExistMessage.Text = "The E-mail already exists";
                ExistMessage.Visible = true;
                ErrorMessage.Visible = false;
            }
            else
            {
                if (staff.Checked)
                {
                    try
                    {
                        string id = ID.Text;
                        string Name = name.Text;
                        string Email = email.Text;
                        string Password = password.Text;
                        string contact = phoneNumber.Text;

                        string sql = @"INSERT INTO [Staff] Values (@staff_id, @Name, @Email, @Password, @Contact)";
                        SqlConnection con = new SqlConnection(cs);
                        SqlCommand cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@staff_id", id);
                        cmd.Parameters.AddWithValue("@Name", Name);
                        cmd.Parameters.AddWithValue("@Email", Email);
                        cmd.Parameters.AddWithValue("@Password", Password);
                        cmd.Parameters.AddWithValue("@Contact", contact);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                            "swal({title:'Congratulations!', text:'Registration Successful',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'login.aspx';})", true);

                    }
                    catch (Exception ex)
                    {
                        ErrorMessage.Text = "The Staff ID already exists";
                        ExistMessage.Visible = false;
                        ErrorMessage.Visible = true;
                    }
                }
                else
                {
                        try
                        {
                            string id = ID.Text;
                            string Name = name.Text;
                            string Email = email.Text;
                            string Password = password.Text;
                            string contact = phoneNumber.Text;
                            string programme = course.Text;

                            string sql = @"INSERT INTO [Student] Values (@student_id, @Name, @Email, @Password, @Contact, @Programme)";
                            SqlConnection con = new SqlConnection(cs);
                            SqlCommand cmd = new SqlCommand(sql, con);
                            cmd.Parameters.AddWithValue("@student_id", id);
                            cmd.Parameters.AddWithValue("@Name", Name);
                            cmd.Parameters.AddWithValue("@Email", Email);
                            cmd.Parameters.AddWithValue("@Password", Password);
                            cmd.Parameters.AddWithValue("@Contact", contact);
                            cmd.Parameters.AddWithValue("@Programme", programme);

                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();

                            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "swal({title:'Congratulations!', text:'Registration Successful',  icon: 'success',  button: 'OK',}.then(function() {window.location = 'login.aspx';})", true);
                        }
                        catch (Exception ex)
                        {
                            ErrorMessage.Text = "The Student ID already exists";
                            ExistMessage.Visible = false;
                            ErrorMessage.Visible = true;
                        }
                    }
                }
        }


        protected void staff_CheckedChanged(object sender, EventArgs e)
        {
            course.Visible = false;
            IDLimitStaff.Enabled = true;
            IDLimitStudent.Enabled = false;
        }

        protected void student_CheckedChanged(object sender, EventArgs e)
        {
            course.Visible = true;
            IDLimitStudent.Enabled = true;
            IDLimitStaff.Enabled = false;
        }
    }
}