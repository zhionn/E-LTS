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
    public partial class profile : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff_id"] != null)
            {
                String sqlStaff = "select * from Staff where staff_id='" + Session["staff_id"] + "'";
                SqlConnection conStaff = new SqlConnection(cs);
                SqlCommand cmdStaff = new SqlCommand(sqlStaff, conStaff);
                SqlDataAdapter sdaStaff = new SqlDataAdapter(cmdStaff);
                DataSet dsStaff = new DataSet();
                sdaStaff.Fill(dsStaff);
                id.Text = dsStaff.Tables[0].Rows[0]["staff_ID"].ToString();
                name.Text = dsStaff.Tables[0].Rows[0]["name"].ToString();
                email.Text = dsStaff.Tables[0].Rows[0]["email"].ToString();
                PasswordTxt.Text = dsStaff.Tables[0].Rows[0]["password"].ToString();
                phoneNumber.Text = dsStaff.Tables[0].Rows[0]["contact"].ToString();

                trCourse.Visible = false;
            }
            else if (Session["student_id"] != null)
            {
                String sqlStudent = "select * from Student where student_id='" + Session["student_id"] + "'";
                SqlConnection conStudent = new SqlConnection(cs);
                SqlCommand cmdStudent = new SqlCommand(sqlStudent, conStudent);
                SqlDataAdapter sdaStudent = new SqlDataAdapter(cmdStudent);
                DataSet dsStudent = new DataSet();
                sdaStudent.Fill(dsStudent);
                id.Text = dsStudent.Tables[0].Rows[0]["student_ID"].ToString();
                name.Text = dsStudent.Tables[0].Rows[0]["name"].ToString();
                email.Text = dsStudent.Tables[0].Rows[0]["email"].ToString();
                PasswordTxt.Text = dsStudent.Tables[0].Rows[0]["password"].ToString();
                phoneNumber.Text = dsStudent.Tables[0].Rows[0]["contact"].ToString();
                course.Text = dsStudent.Tables[0].Rows[0]["programme"].ToString();
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {

        }
    }
}