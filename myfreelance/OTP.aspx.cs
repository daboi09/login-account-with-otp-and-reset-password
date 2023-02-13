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
    public partial class OTP : System.Web.UI.Page
    {
        public static string theotp = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Random r = new Random();
                string otp = r.Next(0, 1000000).ToString();
                string loginID = Request.QueryString["loginID"].ToString();
                Account acct = new Account();
                string remail = acct.SendEmail(loginID);
                theotp = otp;
                Label1.Text = theotp;
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("your gmail");
                    mail.To.Add(remail.ToString());
                    mail.Subject = "OTP number";
                    mail.Body = "Hello, the OTP is " + theotp;

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

        protected void otp_btn_Click(object sender, EventArgs e)
        {
            string uotp = tb_otp.Text;
            if (uotp == theotp)
            {
                string loginID = Request.QueryString["loginID"].ToString();
                Response.Redirect("LoginProfile.aspx?loginID=" + loginID);
            }
            else
            {
                Response.Write("<script>alert('OTP is not correct');</script>");
            }
        }

    }
}