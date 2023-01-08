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
    public partial class update_student : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = Request.QueryString["student_id"] ?? "";

                string sql = "SELECT * FROM Student WHERE student_id = @id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    student_id.Text = dr["student_id"].ToString();
                    name.Text = dr["name"].ToString();
                    email.Text = dr["email"].ToString();
                    PasswordTxt.Text = dr["password"].ToString();
                    phoneNumber.Text = dr["contact"].ToString();
                    course.Text = dr["programme"].ToString();
                }
                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("studentList.aspx");
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            try
            {
                string id = student_id.Text;
                string Name = name.Text;
                string Email = email.Text;
                string Password = PasswordTxt.Text;
                string contact = phoneNumber.Text;
                string programme = course.Text;
                string sql = @"UPDATE Student SET name=@name, email=@email,
                               password=@password, contact=@contact,
                               programme=@programme
                               WHERE student_id = @student_id";
                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@name", Name);
                cmd.Parameters.AddWithValue("@email", Email);
                cmd.Parameters.AddWithValue("@password", Password);
                cmd.Parameters.AddWithValue("@contact", contact);
                cmd.Parameters.AddWithValue("@programme", programme);
                cmd.Parameters.AddWithValue("@student_id", id);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                               "swal({title:'Congratulations!', text:'Succesfully Updated.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'studentList.aspx';})", true);
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentList.aspx");
        }
    }
}