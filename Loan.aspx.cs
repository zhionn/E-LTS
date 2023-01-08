using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Drawing;
using System.IO;

namespace E_LTS
{
    public partial class Loan : System.Web.UI.Page
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
                /* FORM ID */
                formID();
            }

            /* Lab Assistant Name */
            if (Session["staff_id"] != null)
            {
                String sqlStaff = "select * from Staff where staff_id='" + Session["staff_id"] + "'";
                SqlConnection conStaff = new SqlConnection(cs);
                SqlCommand cmdStaff = new SqlCommand(sqlStaff, conStaff);
                SqlDataAdapter sdaStaff = new SqlDataAdapter(cmdStaff);
                DataSet dsStaff = new DataSet();
                sdaStaff.Fill(dsStaff);
                LabName.Text = dsStaff.Tables[0].Rows[0]["name"].ToString();
            }
        }

        public void formID()
        {
            try
            {
                string sqlFormID = @"SELECT MAX(form_Id) FROM [Loan] ";
                SqlConnection conFormID = new SqlConnection(cs);
                SqlCommand cmdFormID = new SqlCommand(sqlFormID, conFormID);
                conFormID.Open();
                var maxid = cmdFormID.ExecuteScalar() as string;

                if (maxid == null)
                {
                    fID.Text = "F-0001";
                }
                else
                {
                    int intval = int.Parse(maxid.Substring(2, 4));
                    intval++;
                    fID.Text = String.Format("F-{0:0000}", intval);
                }
                conFormID.Close();
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
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

        protected void getButtonStudent_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(cs);
            SqlCommand commGet1 = new SqlCommand("select * from Student where student_Id= '" + int.Parse(student_id.Text) + "'", con);
            con.Open();
            SqlDataReader srd = commGet1.ExecuteReader();
            if (srd.Read())
            {
                name.Text = srd.GetValue(1).ToString();
                email.Text = srd.GetValue(2).ToString();
                phoneNumber.Text = srd.GetValue(4).ToString();
            }
            else
            {
                failGetStudent.Text = "No Data For This Student ID.";
            }
            con.Close();
            getButton1.CausesValidation = false;
        }

        /* GET COMPONENT */
        protected void getButtonCode_Click(object sender, EventArgs e)
        {
            string statusAvailable = "Available";
            SqlConnection con1 = new SqlConnection(cs);
            SqlCommand cmmGet2 = new SqlCommand("select * from Component where stock_code= '" + stock.Text + "' and Cstatus= '" + statusAvailable +"'", con1);
            con1.Open();
            SqlDataReader srd1 = cmmGet2.ExecuteReader();
            if (srd1.Read())
            {
                // COMPONENT 1
                LblCName1.Text = srd1.GetValue(1).ToString();
                cname1.Text = srd1.GetValue(1).ToString();
                price1.Text = srd1.GetValue(2).ToString();
                quantity1.Text = srd1.GetValue(3).ToString();
                desc1.Text = srd1.GetValue(4).ToString();

                // COMPONENT 2
                LblCName2.Text = srd1.GetValue(5).ToString();
                cname2.Text = srd1.GetValue(5).ToString();
                price2.Text = srd1.GetValue(6).ToString();
                quantity2.Text = srd1.GetValue(7).ToString();
                desc2.Text = srd1.GetValue(8).ToString();

                // COMPONENT 3
                LblCName3.Text = srd1.GetValue(9).ToString();
                cname3.Text = srd1.GetValue(9).ToString();
                price3.Text = srd1.GetValue(10).ToString();
                quantity3.Text = srd1.GetValue(11).ToString();
                desc3.Text = srd1.GetValue(12).ToString();
            }
            else
            {
               failGet.Text = "The Component Set is Loaning by Other Student/No Data For This Stock Code. Please Check the Component List";
            }
            con1.Close();
            getButtonCode.CausesValidation = false;
        }

        protected void getSuper_Click(object sender, EventArgs e)
        {
            SqlConnection con2 = new SqlConnection(cs);
            SqlCommand commGet3 = new SqlCommand("select * from [Staff] where name= '" + SupervisorName.Text + "'", con2);
            con2.Open();
            SqlDataReader srd2 = commGet3.ExecuteReader();
            if (srd2.Read())
            {
                // Supervisor Email
                SupervisorEmail.Text = srd2.GetValue(2).ToString();
            }
            else
            {
                failGet.Text = "The email does not exist";
            }
            con2.Close();
            getSuper.CausesValidation = false;
        }


        protected void resetForm_Click(object sender, EventArgs e)
        {
            Server.Transfer("Loan.aspx");
            resetForm.CausesValidation = false;
        }

        protected void submitForm_Click(object sender, EventArgs e)
        {
            string sqlStudentID = @"SELECT student_id FROM [Loan] WHERE student_id = '" + student_id.Text + "'";
            SqlConnection conCheckExist = new SqlConnection(cs);
            SqlCommand cmdStudentID = new SqlCommand(sqlStudentID, conCheckExist);
            SqlDataAdapter adapter = new SqlDataAdapter(cmdStudentID);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                ErrorMessage.Text = "The student id already exists";
            }
            else
            {
                try
                {
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
                    string Loan = loanDate.Text;
                    string Return = returnDate.Text;
                    /* APPROVAL Lecturer*/
                    string labName = LabName.Text;
                    string SuperName = SupervisorName.Text;
                    string SuperEmail = SupervisorEmail.Text;
                    string Approval = string.Empty;
                    /* Componet */
                    string C1 = LblCName1.Text;
                    string C2 = LblCName2.Text;
                    string C3 = LblCName3.Text;
                    /* STATUS COMPONENT */
                    string component_status = string.Empty;
                    /* Detect */
                    string C1Detect = GridViewLoan.Rows[1].Cells[1].Text;
                    string C2Detect = GridViewLoan.Rows[1].Cells[2].Text;
                    string C3Detect = GridViewLoan.Rows[1].Cells[3].Text;

                    if (ApprovalRadio.SelectedValue == "Pending")
                    {
                        MailMessage mm = new MailMessage("sender@gmail.com", SupervisorEmail.Text.Trim());
                        mm.Subject = "Laboratory Tools Loan Approval";
                        mm.Body = string.Format("Dear {0},<br /><br />" +
                            "We are pleased to inform you that a component loan request is waiting for your approval.<br /><br />" +
                            "Information details : <br />" +
                            "Form ID : {1}<br />" +
                            "Student Name : {2}<br />" +
                            "Student ID : {3}<br />" +
                            "Student Email : {4}<br />" +
                            "Contact Number : {5}<br />" +
                            "Component Request : {6},{7},{8}<br /><br />" +
                            "Thank you.", SuperName, fid, Name, id, Email, contact, C1, C2, C3);
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.EnableSsl = true;
                        NetworkCredential NetworkCred = new NetworkCredential();
                        NetworkCred.UserName = "elaboratorytoolssystem@gmail.com";
                        NetworkCred.Password = "yrxkbhkbpttuahzx";
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;
                        smtp.Send(mm);
                        Approval = "Pending";
                        component_status = "Pending";
                    }
                    else if (ApprovalRadio.SelectedValue == "Approved")
                    {
                        MailMessage mm = new MailMessage("sender@gmail.com", SupervisorEmail.Text.Trim());
                        mm.Subject = "Laboratory Tools Loan Approval";
                        mm.Body = string.Format("Dear {0},<br /><br />" +
                            "Your component loan request is completed and you may come to laboratory collect it.<br /><br />" +
                            "Thank you.", Name);
                        mm.IsBodyHtml = true;
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.gmail.com";
                        smtp.EnableSsl = true;
                        NetworkCredential NetworkCred = new NetworkCredential();
                        NetworkCred.UserName = "elaboratorytoolssystem@gmail.com";
                        NetworkCred.Password = "yrxkbhkbpttuahzx";
                        smtp.UseDefaultCredentials = true;
                        smtp.Credentials = NetworkCred;
                        smtp.Port = 587;
                        smtp.Send(mm);
                        Approval = "Approved";
                        component_status = "Loaning";
                    }
                    else
                    {
                        failNoti.Text = "The email unsuccessfully sent.";
                    }

                    string sqlAdd = @"INSERT INTO [Loan] Values 
                    (@form_Id, @student_Id, @name, @email, @contact,@stock_code,
                    @component_name1,@component_price1,@quantity1,@item_desc1,
                    @component_name2,@component_price2,@quantity2,@item_desc2,
                    @component_name3,@component_price3,@quantity3,@item_desc3,
                    @loaned_date,@returned_date,@LabAssisName,@SupervisorName,@SupervisorEmail,@approval,@C1Detect,@C2Detect,@C3Detect)";

                    SqlConnection conAdd = new SqlConnection(cs);
                    SqlCommand cmdAdd = new SqlCommand(sqlAdd, conAdd);

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
                    cmdAdd.Parameters.AddWithValue("@approval", Approval);
                    cmdAdd.Parameters.AddWithValue("@LabAssisName", labName);
                    cmdAdd.Parameters.AddWithValue("@SupervisorName", SuperName);
                    cmdAdd.Parameters.AddWithValue("@SupervisorEmail", SuperEmail);
                    /* Detect */
                    cmdAdd.Parameters.AddWithValue("@C1Detect", C1Detect);
                    cmdAdd.Parameters.AddWithValue("@C2Detect", C2Detect);
                    cmdAdd.Parameters.AddWithValue("@C3Detect", C3Detect);


                    /*  UPDATE STATUS COMPONENT */
                    string sql = @"UPDATE Component SET
                component_name1=@component_name1, component_price1=@component_price1,  quantity1=@quantity1, item_desc1=@item_desc1,
                component_name2=@component_name2, component_price2=@component_price2, quantity2=@quantity2, item_desc2=@item_desc2,
                component_name3=@component_name3, component_price3=@component_price3, quantity3=@quantity3, item_desc3=@item_desc3,Cstatus = @Cstatus
                               WHERE stock_code=@stock_code";

                    SqlCommand cmdStatus = new SqlCommand(sql, conAdd);

                    cmdStatus.Parameters.AddWithValue("@stock_code", code);

                    cmdStatus.Parameters.AddWithValue("@component_name1", Cname1);
                    cmdStatus.Parameters.AddWithValue("@component_price1", Price1);
                    cmdStatus.Parameters.AddWithValue("@quantity1", Quantity1);
                    cmdStatus.Parameters.AddWithValue("@item_desc1", Desc1);

                    cmdStatus.Parameters.AddWithValue("@component_name2", Cname2);
                    cmdStatus.Parameters.AddWithValue("@component_price2", Price2);
                    cmdStatus.Parameters.AddWithValue("@quantity2", Quantity2);
                    cmdStatus.Parameters.AddWithValue("@item_desc2", Desc2);

                    cmdStatus.Parameters.AddWithValue("@component_name3", Cname3);
                    cmdStatus.Parameters.AddWithValue("@component_price3", Price3);
                    cmdStatus.Parameters.AddWithValue("@quantity3", Quantity3);
                    cmdStatus.Parameters.AddWithValue("@item_desc3", Desc3);
                    cmdStatus.Parameters.AddWithValue("@Cstatus", component_status);


                    conAdd.Open();
                    cmdAdd.ExecuteNonQuery();
                    cmdStatus.ExecuteNonQuery();
                    conAdd.Close();

                    ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                                "swal({title:'Congratulations!', text:'Successfully,Wait for Approval.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'FormList.aspx';})", true);
                }
                catch (Exception ex)
                {
                    ErrorMessage.Text = ex.Message;
                }
            }
        }

        protected void scan_Click(object sender, EventArgs e)
        {
            //run bat file
            System.Diagnostics.Process.Start(@"C:\Users\Asus\source\repos\E-LTS\E-LTS OD\TFOD\LoanScan.bat");
            scan.CausesValidation = false;
        }

        protected void ImportCSV(object sender, EventArgs e)
        {
            GridViewEmpty.Visible = false;
            //Upload and save the file
            string csvPath = Server.MapPath("~/Detected/") + Path.GetFileName("LoanScan.csv");

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
            GridViewLoan.DataSource = dt;
            GridViewLoan.DataBind();
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