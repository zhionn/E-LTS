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

namespace E_LTS
{
    public partial class update_form : System.Web.UI.Page
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

                    loanDate.Text = dr["loaned_date"].ToString();
                    returnDate.Text = dr["returned_date"].ToString();

                    LabName.Text = dr["LabAssisName"].ToString();
                    SupervisorName.Text = dr["SupervisorName"].ToString();
                    SupervisorEmail.Text = dr["SupervisorEmail"].ToString();

                    if (dr["Approval"].ToString() == "Pending")
                    {
                        ApprovalRadio.Items.FindByText("Pending").Selected = true;
                    }
                    else
                    {
                        ApprovalRadio.Items.FindByText("Approved").Selected = true;
                    }
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

                if (ApprovalRadio.SelectedValue == "Pending")
                {
                    MailMessage mm = new MailMessage("sender@gmail.com", SupervisorEmail.Text.Trim());
                    mm.Subject = "Laboratory Tools Loan Approval";
                    mm.Body = string.Format("Dear {0},<br /><br />" +
                        "We are pleased to inform you that a component loan request is waiting for your approval.<br /><br />" +
                        "Information details : <br /><br />" +
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

                    ClientScript.RegisterStartupScript(Page.GetType(), "alert",
                                "swal({title:'Congratulations!', text:'Successfully,Wait for Approval.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'FormList.aspx';})", true);
                }
                else if (ApprovalRadio.SelectedValue == "Approved")
                {
                    MailMessage mm = new MailMessage("sender@gmail.com", email.Text.Trim());
                    mm.Subject = "Laboratory Tools Loan Approval";
                    mm.Body = string.Format("Dear {0},<br /><br />" +
                        "Your component loan request is completed, you may come to laboratory and collect it.<br /><br />" +
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

                string sqlAdd = @"UPDATE Loan SET
                student_Id=@student_Id, name=@name, email=@email, contact=@contact,stock_code=@stock_code,
                component_name1=@component_name1, component_price1=@component_price1,  quantity1=@quantity1, item_desc1=@item_desc1,
                component_name2=@component_name2, component_price2=@component_price2, quantity2=@quantity2, item_desc2=@item_desc2,
                component_name3=@component_name3, component_price3=@component_price3, quantity3=@quantity3, item_desc3=@item_desc3,
                loaned_date=@loaned_date,returned_date=@returned_date,LabAssisName = @LabAssisName,SupervisorName = @SupervisorName,
                SupervisorEmail = @SupervisorEmail,approval=@Approval
                               WHERE form_id=@form_id";

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
                cmdAdd.Parameters.AddWithValue("@Approval", Approval);
                cmdAdd.Parameters.AddWithValue("@LabAssisName", labName);
                cmdAdd.Parameters.AddWithValue("@SupervisorName", SuperName);
                cmdAdd.Parameters.AddWithValue("@SupervisorEmail", SuperEmail);


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
                                                "swal({title:'Congratulations!', text:'Successfully Approved.',  icon: 'success',  button: 'OK',}).then(function() {window.location = 'FormList.aspx';})", true);
            }
            catch (Exception ex)
            {
                ErrorMessage.Text = ex.Message;
            }
        }

        protected void cancelForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormList.aspx");
            cancelForm.CausesValidation = false;
        }
    }
}