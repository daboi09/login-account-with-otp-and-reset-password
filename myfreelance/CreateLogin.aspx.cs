using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace myfreelance
{
    public partial class CreateLogin : System.Web.UI.Page
    {
        public static string license = null;
        public static string theotp = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_signup_Click(object sender, EventArgs e)
        {
            int result = 0;
            string image = "";
            string role = null;
            string otp = null;
            string loginID = login_id.Text;
            string ckloginID = null;
            string ckotp = tb_otp.Text;
            Account ack = new Account();
            ckloginID = ack.CheckLoginID(loginID);
            if (loginID == ckloginID)
            {
                Response.Write("<script>alert('Login ID has been used');</script>");
            }
            else
            {
                if (theotp == ckotp)
                {
                    if (rbl_role.SelectedIndex > -1)
                    {
                        role = rbl_role.SelectedItem.Text;
                        if (role == "Freelancer")
                        {
                            license = "";
                        }
                        else
                        {
                            license = login_license.Text;
                        }


                        if (rbl_otp.SelectedIndex > -1)
                        {
                            otp = rbl_otp.SelectedItem.Text;



                            if (login_image.HasFile == true)
                            {
                                image = "Images\\" + login_image.FileName;
                            }

                            if (login_password.Text == login_password_2.Text)
                            {
                                string enpass = login_password.Text;
                                byte[] encData_byte = new byte[enpass.Length];
                                encData_byte = System.Text.Encoding.UTF8.GetBytes(enpass);
                                string encodedData = Convert.ToBase64String(encData_byte);
                                if (login_image.FileName == "")
                                {

                                    Account acct = new Account(login_id.Text, login_name.Text, encodedData, login_email.Text, login_contact.Text, login_date_birth.Text, DateTime.Today.ToString("d/M/yyyy"), 0, 0, role, license, 1, 0, "default.png", 0, otp);
                                    result = acct.AccountInsert();
                                }
                                else
                                {
                                    Account acct = new Account(login_id.Text, login_name.Text, encodedData, login_email.Text, login_contact.Text, login_date_birth.Text, DateTime.Today.ToString("d/M/yyyy"), 0, 0, role, license, 1, 0, login_image.FileName, 0, otp);
                                    result = acct.AccountInsert();
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Password does not match');</script>");
                            }



                            if (result > 0)
                            {
                                if (login_image.FileName == "")
                                {
                                    Response.Redirect("UserLogin.aspx");
                                }
                                else
                                {
                                    string saveimg = Server.MapPath(" ") + "\\" + image;
                                    login_image.SaveAs(saveimg);
                                    Response.Write("<script>alert('Insert successful');</script>");
                                    Response.Redirect("UserLogin.aspx");
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('New account NOT successful');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('OTP option not selected');</script>");
                        }
                    }
                    else
                    { 
                        Response.Write("<script>alert('Role not selected');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('OTP is not correct or blank');</script>");
                }
            }
        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void otp_btn_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            string otp = r.Next(0, 1000000).ToString();
            theotp = otp;
            string remail = login_email.Text.ToString();
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("your gmail");
                mail.To.Add(remail.ToString());
                mail.Subject = "Email confirmation OTP number";
                mail.Body = "Hello, the email confirmation OTP is " + theotp;

                using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                {
                    smtp.Credentials = new System.Net.NetworkCredential("your gmail", "app password");
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                }
                Label1.Text = "Your OTP has been sent to your email, check your junk mail too";

            }
        }
    }
}