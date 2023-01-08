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
    public partial class forgot_password : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit_Click(object sender, EventArgs e)
        {
            string Id = string.Empty;
            string password = string.Empty;
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT name, password FROM [Student] WHERE email = @email"))
                {
                    cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            Id = sdr["name"].ToString();
                            password = sdr["password"].ToString();
                        }
                    }
                    con.Close();
                }

                if (!string.IsNullOrEmpty(password))
                {
                    MailMessage mm = new MailMessage("sender@gmail.com", email.Text.Trim());
                    mm.Subject = "Password Recovery";
                    mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", Id, password);
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
                    forgot_message.ForeColor = Color.Green;
                    forgot_message.Text = "Password has been sent to your email address.";
                }
                else
                {
                    forgot_message.ForeColor = Color.Red;
                    forgot_message.Text = "This email address does not match our records.";
                }


                {
                    using (SqlCommand cmd = new SqlCommand("SELECT name, password FROM [Staff] WHERE email = @email"))
                    {
                        cmd.Parameters.AddWithValue("@email", email.Text.Trim());
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.Read())
                            {
                                Id = sdr["name"].ToString();
                                password = sdr["password"].ToString();
                            }
                        }
                        con.Close();
                    }

                    if (!string.IsNullOrEmpty(password))
                    {
                        MailMessage mm = new MailMessage("sender@gmail.com", email.Text.Trim());
                        mm.Subject = "Password Recovery";
                        mm.Body = string.Format("Hi {0},<br /><br />Your password is {1}.<br /><br />Thank You.", Id, password);
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
                        forgot_message.ForeColor = Color.Green;
                        forgot_message.Text = "Password has been sent to your email address.";
                    }
                    else
                    {
                        forgot_message.ForeColor = Color.Red;
                        forgot_message.Text = "This email address does not match our records.";
                    }
                }

            }
        }
    }
}