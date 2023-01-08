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
    public partial class delete_student : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            bool found = false;
            string id = Request.QueryString["student_id"] ?? "";

            string sql = "SELECT * FROM Student WHERE student_id = @student_id";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@student_id", id);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                found = true;
                LblId.Text = dr["student_id"].ToString();
                LblName.Text = dr["name"].ToString();
                LblEmail.Text = dr["email"].ToString();
                LblPwd.Text = dr["password"].ToString();
                LblPhoneNumber.Text = dr["contact"].ToString();
                LblProgramme.Text = dr["programme"].ToString();
            }
            dr.Close();
            con.Close();

            if (!found)
            {
                Response.Redirect("studentList.aspx");
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            string id = LblId.Text;

            string sql = "DELETE FROM Student Where student_id = @student_id";

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@student_id", id);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                               "swal({title:'Congratulations!', text:'Succesfully Delete.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'studentList.aspx';})", true);
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("studentList.aspx");
        }
    }
}