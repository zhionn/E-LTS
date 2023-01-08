using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace E_LTS
{
    public partial class return_history : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void Search(object sender, EventArgs e)
        {
            this.BindGrid();
        }
        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT form_id, student_id, name, loaned_date,returned_date,SupervisorName,SupervisorEmail FROM [Return] WHERE form_id LIKE '%' + @form_ID +  '%'";
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@form_ID", txtSearch.Text.Trim());
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        gvReturn.DataSource = dt;
                        gvReturn.DataBind();
                    }
                }
            }
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvReturn.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
        protected void return_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells.RemoveAt(1);
                e.Row.Cells[0].ColumnSpan = 2;
            }
        }
    }
}