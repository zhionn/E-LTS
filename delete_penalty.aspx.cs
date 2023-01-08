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
    public partial class delete_penalty : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = Request.QueryString["penalty_id"] ?? "";

                string sql = "SELECT * FROM Penalty WHERE penalty_id = @id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    LblPid.Text = dr["penalty_Id"].ToString();
                    LblSId.Text = dr["student_id"].ToString();
                    LblName.Text = dr["name"].ToString();
                    LblEmail.Text = dr["email"].ToString();
                    LblContact.Text = dr["contact"].ToString();
                    LblProgramme.Text = dr["programme"].ToString();
                    LblLoss1.Text = dr["loss1"].ToString();
                    LblLoss2.Text = dr["loss2"].ToString();
                    LblLoss3.Text = dr["loss3"].ToString();
                    LblLoss4.Text = dr["loss4"].ToString();
                    LblLoss5.Text = dr["loss5"].ToString();
                    LblTotal.Text = dr["price_fines"].ToString();
                }
                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("penalty.aspx");
                }
            }
        }
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            string pid = LblPid.Text;
            string id = LblSId.Text;
            string Name = LblName.Text;
            string Email = LblName.Text;
            string contact = LblContact.Text;
            string programme = LblProgramme.Text;
            string ddl1 = LblLoss1.Text;
            string ddl2 = LblLoss2.Text;
            string ddl3 = LblLoss3.Text;
            string ddl4 = LblLoss4.Text;
            string ddl5 = LblLoss5.Text;
            string total = LblTotal.Text;

            SqlConnection conn = new SqlConnection(cs);


            string sqlInsert = @"INSERT INTO [PHistory] Values (@penalty_id, @student_id, @name, @email, @contact, @programme, @loss1, @loss2, @loss3, @loss4, @loss5, @price_fines )";
            SqlCommand cmdInsert = new SqlCommand(sqlInsert, conn);
            cmdInsert.Parameters.AddWithValue("@penalty_id", pid);
            cmdInsert.Parameters.AddWithValue("@student_id", id);
            cmdInsert.Parameters.AddWithValue("@name", Name);
            cmdInsert.Parameters.AddWithValue("@email", Email);
            cmdInsert.Parameters.AddWithValue("@contact", contact);
            cmdInsert.Parameters.AddWithValue("@programme", programme);
            cmdInsert.Parameters.AddWithValue("@loss1", ddl1);
            cmdInsert.Parameters.AddWithValue("@loss2", ddl2);
            cmdInsert.Parameters.AddWithValue("@loss3", ddl3);
            cmdInsert.Parameters.AddWithValue("@loss4", ddl4);
            cmdInsert.Parameters.AddWithValue("@loss5", ddl5);
            cmdInsert.Parameters.AddWithValue("@price_fines", total);


            string Lblid = LblPid.Text;
            string sqlDelete = "DELETE FROM Penalty Where penalty_id = @penalty_id";
            SqlCommand cmdDelete = new SqlCommand(sqlDelete, conn);
            cmdDelete.Parameters.AddWithValue("@penalty_Id", Lblid);

            
            conn.Open();
            cmdInsert.ExecuteNonQuery();
            cmdDelete.ExecuteNonQuery();
            conn.Close();

            Response.Redirect("penalty.aspx");
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("penalty.aspx");
        }
    }
}