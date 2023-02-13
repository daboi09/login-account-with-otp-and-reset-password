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
    public partial class AdminLogin : System.Web.UI.Page
    {
        public static string theotp = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void user_login_Click(object sender, EventArgs e)
        {
            string uotp = tb_otp.Text;
            string alogin = admin_login.Text;
            string apass = admin_password.Text;
            string newpass = null;
            Account aStud = new Account();

            if (alogin == "admin")
            {
                newpass = aStud.CheckPassword(alogin);
                if (apass != null)
                {
                    System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
                    System.Text.Decoder utf8Decode = encoder.GetDecoder();
                    byte[] todecode_byte = Convert.FromBase64String(newpass);
                    int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
                    char[] decoded_char = new char[charCount];
                    utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
                    string result = new String(decoded_char);
                    if (apass == result)
                    {
                        if (uotp == theotp)
                        {
                            Response.Redirect("AdminAccountPanel.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Wrong OTP');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Password');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Wrong username or password');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Only admin is allowed');</script>");
            }
            
            
        }

        protected void otp_btn_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            string otp = r.Next(0, 1000000).ToString();
            theotp = otp;
            string loginID = admin_login.Text;
            string remail = null;
            Account acct = new Account();
            remail = acct.SendEmail(loginID);
            using (MailMessage mail = new MailMessage())
            {
                mail.From = new MailAddress("your gmail");
                mail.To.Add(remail.ToString());
                mail.Subject = "Admin OTP number";
                mail.Body = "Hello, the admin OTP is " + theotp;

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