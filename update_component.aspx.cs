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
    public partial class update_component : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
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
                }
                dr.Close();
                con.Close();

                if (!found)
                {
                    Response.Redirect("componentList.aspx");
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
        protected void updateButton_Click(object sender, EventArgs e)
        {
            try
            {
                string cstock = stock.Text;

                string name1 = cname1.Text;
                string cprice1 = price1.Text;
                string cquantity1 = quantity1.Text;
                string cdesc1 = desc1.Text;

                string name2 = cname2.Text;
                string cprice2 = price2.Text;
                string cquantity2 = quantity2.Text;
                string cdesc2 = desc2.Text;

                string name3 = cname3.Text;
                string cprice3 = price3.Text;
                string cquantity3 = quantity3.Text;
                string cdesc3 = desc3.Text;

                string component_status = "Available";

                string sql = @"UPDATE Component SET
                component_name1=@component_name1, component_price1=@component_price1,  quantity1=@quantity1, item_desc1=@item_desc1,
                component_name2=@component_name2, component_price2=@component_price2, quantity2=@quantity2, item_desc2=@item_desc2,
                component_name3=@component_name3, component_price3=@component_price3, quantity3=@quantity3, item_desc3=@item_desc3, Cstatus = @Cstatus
                               WHERE stock_code=@stock_code";

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@stock_code", cstock);

                cmd.Parameters.AddWithValue("@component_name1", name1);
                cmd.Parameters.AddWithValue("@component_price1", cprice1);
                cmd.Parameters.AddWithValue("@quantity1", cquantity1);
                cmd.Parameters.AddWithValue("@item_desc1", cdesc1);

                cmd.Parameters.AddWithValue("@component_name2", name2);
                cmd.Parameters.AddWithValue("@component_price2", cprice2);
                cmd.Parameters.AddWithValue("@quantity2", cquantity2);
                cmd.Parameters.AddWithValue("@item_desc2", cdesc2);

                cmd.Parameters.AddWithValue("@component_name3", name3);
                cmd.Parameters.AddWithValue("@component_price3", cprice3);
                cmd.Parameters.AddWithValue("@quantity3", cquantity3);
                cmd.Parameters.AddWithValue("@item_desc3", cdesc3);

                cmd.Parameters.AddWithValue("@Cstatus", component_status);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();

                ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                               "swal({title:'Congratulations!', text:'Succesfully Updated.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'componentList.aspx';})", true);
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("componentList.aspx");
            CancelButton.CausesValidation = false;
        }

    }
}