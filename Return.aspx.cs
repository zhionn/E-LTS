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
    public partial class delete_form : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            empty();
          
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

                string sql = "SELECT * FROM Loan WHERE form_id = @id";

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
                    Response.Redirect("FormList.aspx");
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
        protected void submitForm_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(cs);

            /* Student Detials */
            string fid = fID.Text;
            string id = student_id.Text;
            string Name = name.Text;
            string Email = email.Text;
            string contact = phoneNumber.Text;
            string code = stock.Text;
            /* ITEM 1 */
            string Cname1 = cname1.Text;
            string Price1 = price1.Text;
            string Quantity1 = quantity1.Text;
            string Desc1 = desc1.Text;
            /* ITEM 2 */
            string Cname2 = cname2.Text;
            string Price2 = price2.Text;
            string Quantity2 = quantity2.Text;
            string Desc2 = desc2.Text;
            /* ITEM 3 */
            string Cname3 = cname3.Text;
            string Price3 = price3.Text;
            string Quantity3 = quantity3.Text;
            string Desc3 = desc3.Text;
            /* DATE */
            string Loan = Ldate.Text;
            string Return = Rdate.Text;
            /* APPROVAL Lecturer*/
            string labName = LabName.Text;
            string SuperName = SupervisorName.Text;
            string SuperEmail = SupervisorEmail.Text;
            string C1Detect = GridViewReturn.Rows[1].Cells[1].Text;
            string C2Detect = GridViewReturn.Rows[1].Cells[2].Text;
            string C3Detect = GridViewReturn.Rows[1].Cells[3].Text;

            string total = GridViewReturn.Rows[3].Cells[1].Text;

            string sqlAdd = @"INSERT INTO [Return] Values 
                    (@form_Id, @student_Id, @name, @email, @contact,@stock_code,
                    @component_name1,@component_price1,@quantity1,@item_desc1,
                    @component_name2,@component_price2,@quantity2,@item_desc2,
                    @component_name3,@component_price3,@quantity3,@item_desc3,
                    @loaned_date,@returned_date,@LabAssisName,@SupervisorName,@SupervisorEmail, 
                    @C1Detect,@C2Detect,@C3Detect,@Price)";

            SqlConnection conReturn = new SqlConnection(cs);
            SqlCommand cmdAdd = new SqlCommand(sqlAdd, conReturn);

            cmdAdd.Parameters.AddWithValue("@form_Id", fid);
            cmdAdd.Parameters.AddWithValue("@student_id", id);
            cmdAdd.Parameters.AddWithValue("@name", Name);
            cmdAdd.Parameters.AddWithValue("@email", Email);
            cmdAdd.Parameters.AddWithValue("@contact", contact);
            cmdAdd.Parameters.AddWithValue("@stock_code", code);
            /* ITEM 1 */
            cmdAdd.Parameters.AddWithValue("@component_name1", Cname1);
            cmdAdd.Parameters.AddWithValue("@component_price1", Price1);
            cmdAdd.Parameters.AddWithValue("@quantity1", Quantity1);
            cmdAdd.Parameters.AddWithValue("@item_desc1", Desc1);
            /* ITEM 2 */
            cmdAdd.Parameters.AddWithValue("@component_name2", Cname2);
            cmdAdd.Parameters.AddWithValue("@component_price2", Price2);
            cmdAdd.Parameters.AddWithValue("@quantity2", Quantity2);
            cmdAdd.Parameters.AddWithValue("@item_desc2", Desc2);
            /* ITEM 3 */
            cmdAdd.Parameters.AddWithValue("@component_name3", Cname3);
            cmdAdd.Parameters.AddWithValue("@component_price3", Price3);
            cmdAdd.Parameters.AddWithValue("@quantity3", Quantity3);
            cmdAdd.Parameters.AddWithValue("@item_desc3", Desc3);
            /* DATE */
            cmdAdd.Parameters.AddWithValue("@loaned_date", Loan);
            cmdAdd.Parameters.AddWithValue("@returned_date", Return);
            /* Approval */
            cmdAdd.Parameters.AddWithValue("@LabAssisName", labName);
            cmdAdd.Parameters.AddWithValue("@SupervisorName", SuperName);
            cmdAdd.Parameters.AddWithValue("@SupervisorEmail", SuperEmail);
            /* Detect */
            cmdAdd.Parameters.AddWithValue("@C1Detect", C1Detect);
            cmdAdd.Parameters.AddWithValue("@C2Detect", C2Detect);
            cmdAdd.Parameters.AddWithValue("@C3Detect", C3Detect);
            cmdAdd.Parameters.AddWithValue("@Price", total);

            string LblCode = fID.Text;
            string sqlDelete = "DELETE FROM Loan Where form_id = @form_id";
            SqlCommand cmdDelete = new SqlCommand(sqlDelete, conReturn);
            cmdDelete.Parameters.AddWithValue("@form_id", LblCode);

            conReturn.Open();
            cmdAdd.ExecuteNonQuery();
            cmdDelete.ExecuteNonQuery();
            conReturn.Close();

            ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                                "swal({title:'Congratulations!', text:'Succesfully Returned',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'FormList.aspx';})", true);
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormList.aspx");
            cancelForm.CausesValidation = false;
        }

        protected void scan_Click(object sender, EventArgs e)
        {
            //run bat file
            System.Diagnostics.Process.Start(@"C:\Users\Asus\source\repos\E-LTS\E-LTS OD\TFOD\ReturnScan.bat");
        }


        protected void ImportCSV(object sender, EventArgs e)
        {
            GridViewEmpty.Visible = false;
            //Upload and save the file
            string csvPath = Server.MapPath("~/Detected/") + Path.GetFileName("ReturnScan.csv");

            //Create a DataTable.
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[4] { 
            new DataColumn(" ", typeof(string)),
            new DataColumn("Component 1", typeof(string)),
            new DataColumn("Component 2", typeof(string)),
            new DataColumn("Component 3", typeof(string))});

            //Read the contents of CSV file.
            string csvData = File.ReadAllText(csvPath);

            //Execute a loop over the rows.
            foreach (string row in csvData.Split('\n'))
            {
                if (!string.IsNullOrEmpty(row))
                {
                    dt.Rows.Add();
                    int i = 0;

                    //Execute a loop over the columns.
                    foreach (string cell in row.Split(','))
                    {
                        dt.Rows[dt.Rows.Count - 1][i] = cell;
                        i++;
                    }
                }
            }

            //Bind the DataTable.
            GridViewReturn.DataSource = dt;
            GridViewReturn.DataBind();
        }

        protected void empty()
        {
            //Upload and save the file
            string csvPath = Server.MapPath("~/Detected/") + Path.GetFileName("empty.csv");

            //Create a DataTable.
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[4] {
            new DataColumn(" ", typeof(string)),
            new DataColumn("Component 1", typeof(string)),
            new DataColumn("Component 2", typeof(string)),
            new DataColumn("Component 3", typeof(string))});

            //Read the contents of CSV file.
            string csvData = File.ReadAllText(csvPath);

            //Execute a loop over the rows.
            foreach (string row in csvData.Split('\n'))
            {
                if (!string.IsNullOrEmpty(row))
                {
                    dt.Rows.Add();
                    int i = 0;

                    //Execute a loop over the columns.
                    foreach (string cell in row.Split(','))
                    {
                        dt.Rows[dt.Rows.Count - 1][i] = cell;
                        i++;
                    }
                }
            }

            //Bind the DataTable.
            GridViewEmpty.DataSource = dt;
            GridViewEmpty.DataBind();
        }
    }
}