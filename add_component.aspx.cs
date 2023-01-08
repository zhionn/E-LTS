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
    public partial class add_component : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

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
        protected void ResetButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("add_component.aspx");
            ResetButton.CausesValidation = false;
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Server.Transfer("componentList.aspx");
            CancelButton.CausesValidation = false;
        }



        protected void AddButton_Click(object sender, EventArgs e)
        {
            try { 
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

                string sql = @"INSERT INTO [Component] Values 
                (@stock_code, @component_name1, @component_price1,  @quantity1, @item_desc1,
                @component_name2, @component_price2, @quantity2, @item_desc2,
                @component_name3, @component_price3, @quantity3, @item_desc3,@Cstatus)";
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
                               "swal({title:'Congratulations!', text:'Succesfully Add Component.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'componentList.aspx';})", true);
            }
            catch (FormatException ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }
    }
}

