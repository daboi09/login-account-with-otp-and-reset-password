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
    public partial class ForgetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void recover_btn_Click(object sender, EventArgs e)
        {
            string loginID = recover_id.Text;
            string remail = null;
            Account acct = new Account();
            remail = acct.SendEmail(loginID);

            if (remail != null)
            {
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("your gmail");
                    mail.To.Add(remail.ToString());
                    mail.Subject = "Password recovery";
                    mail.Body = "Hello, it seems that you have lost your password. No worries, just click this link" + " https://localhost:44342/RecoverPassword.aspx?loginID=" + loginID;

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new System.Net.NetworkCredential("your gmail", "app password");
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }
         
                }
                Label1.Text = "Your password recovery has been sent through your email. Check your junk email too.";

            }
            else
            {
                Response.Write("<script>alert('Sorry, this loginID does not exist');</script>");
            }
        }
    }
}