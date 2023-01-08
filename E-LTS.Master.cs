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
    public partial class E_LTS : System.Web.UI.MasterPage
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff_id"] != null)
            {
                String sqlStaff = "select * from Staff where staff_id='" + Session["staff_id"] + "'";
                SqlConnection conStaff = new SqlConnection(cs);
                SqlCommand cmdStaff = new SqlCommand(sqlStaff, conStaff) ;
                SqlDataAdapter sdaStaff = new SqlDataAdapter(cmdStaff);
                DataSet dsStaff = new DataSet();
                sdaStaff.Fill(dsStaff);
                Name.Text = dsStaff.Tables[0].Rows[0]["name"].ToString();

                loanAndreturn.Visible = true;
                student_list.Visible = true;
                component_list.Visible = true;
                schedule.Visible = true;
                appointment.Visible = false;

            }
            else if (Session["student_id"] != null)
            {
                String sqlStudent = "select * from Student where student_id='" + Session["student_id"] + "'";
                SqlConnection conStudent = new SqlConnection(cs);
                SqlCommand cmdStudent = new SqlCommand(sqlStudent, conStudent);
                SqlDataAdapter sdaStudent = new SqlDataAdapter(cmdStudent);
                DataSet dsStudent = new DataSet();
                sdaStudent.Fill(dsStudent);
                Name.Text = dsStudent.Tables[0].Rows[0]["name"].ToString();

                loanAndreturn.Visible = false;
                student_list.Visible = false;
                component_list.Visible = false;
                schedule.Visible = true;
                appointment.Visible = true;
            }
        }
    }
}