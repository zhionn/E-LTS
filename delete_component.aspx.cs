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
    public partial class delete_component : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bool found = false;

                string id = Request.QueryString["stock_code"] ?? "";

                string sql = "SELECT * FROM component WHERE stock_code = @stock_code";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@stock_code", id);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    found = true;
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

                    dr.Close();
                    con.Close();

                    if (!found)
                    {
                        Response.Redirect("componentList.aspx");
                    }
                }
            }
        }
        protected void updateButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);
            string LblCode = stock.Text;
            string sqlDelete = "DELETE FROM Component Where stock_code = @stock_code";
            SqlCommand cmdDelete = new SqlCommand(sqlDelete, conn);
            cmdDelete.Parameters.AddWithValue("@stock_code", LblCode);

            conn.Open();
            cmdDelete.ExecuteNonQuery();
            conn.Close();

            ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                               "swal({title:'Congratulations!', text:'Succesfully Delete.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'componentList.aspx';})", true);
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("componentList.aspx");
        }
    }
}