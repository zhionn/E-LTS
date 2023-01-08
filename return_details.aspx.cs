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
    public partial class return_details : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!Page.IsPostBack)
            {
                for (int i = 1; i <= 20; i++)
                {
                    quantity1.Items.Add(i.ToString());
                }
                quantity1_SelectedIndexChanged(null, null);

                for (int i = 1; i <= 20; i++)
                {
                    quantity2.Items.Add(i.ToString());
                }
                quantity2_SelectedIndexChanged(null, null);

                for (int i = 1; i <= 20; i++)
                {
                    quantity3.Items.Add(i.ToString());
                }
                quantity3_SelectedIndexChanged(null, null);
            }


            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = Request.QueryString["form_id"] ?? "";

                string sql = "SELECT * FROM [Return] WHERE form_id = @id";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
                    fID.Text = dr["form_id"].ToString();
                    student_id.Text = dr["student_id"].ToString();
                    name.Text = dr["name"].ToString();
                    email.Text = dr["email"].ToString();
                    phoneNumber.Text = dr["contact"].ToString();

                    stock.Text = dr["stock_code"].ToString();

                    LblCName1.Text = dr["component_name1"].ToString();
                    cname1.Text = dr["component_name1"].ToString();
                    price1.Text = dr["component_price1"].ToString();
                    quantity1.Text = dr["quantity1"].ToString();
                    desc1.Text = dr["item_desc1"].ToString();

                    LblCName2.Text = dr["component_name2"].ToString();
                    cname2.Text = dr["component_name2"].ToString();
                    price2.Text = dr["component_price2"].ToString();
                    quantity2.Text = dr["quantity2"].ToString();
                    desc2.Text = dr["item_desc2"].ToString();

                    LblCName3.Text = dr["component_name3"].ToString();
                    cname3.Text = dr["component_name3"].ToString();
                    price3.Text = dr["component_price3"].ToString();
                    quantity3.Text = dr["quantity3"].ToString();
                    desc3.Text = dr["item_desc3"].ToString();

                    Ldate.Text = dr["loaned_date"].ToString();
                    Rdate.Text = dr["returned_date"].ToString();

                    LabName.Text = dr["LabAssisName"].ToString();
                    SupervisorName.Text = dr["SupervisorName"].ToString();
                    SupervisorEmail.Text = dr["SupervisorEmail"].ToString();
                }
                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("return_history.aspx");
                }

            }
        }

        protected void quantity1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void quantity2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void quantity3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("return_history.aspx");
        }
    }
}