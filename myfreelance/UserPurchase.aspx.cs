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
    public partial class UserPurchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void purchase_btn_Click(object sender, EventArgs e)
        {
            Account acct = new Account();
            int purchase = int.Parse(user_money_buy.Text);
            string smoney = "null";
            int newmoney = 0;
            string loginID = Request.QueryString["loginID"].ToString();
            smoney = acct.MoneyRetrieve(loginID);
            string remail = acct.SendEmail(loginID);
            newmoney = int.Parse(smoney) + purchase;
            int result = 0;
            result = acct.UpdateMoney(loginID, newmoney);
            if (result > 0)
            {
                Response.Write("<script>alert('Money has been succesfully purchased');</script>");
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress("your gmail");
                    mail.To.Add(remail.ToString());
                    mail.Subject = "Purchase of myfreelance money";
                    mail.Body = "Hello, you have purchased $" +purchase.ToString() + " of myfreelance money with your credit card";

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.Credentials = new System.Net.NetworkCredential("your gmail", "app password");
                        smtp.EnableSsl = true;
                        smtp.Send(mail);
                    }

                }
                Response.Redirect("UserMoney.aspx?loginID=" + loginID);
            }
            else
            {
                Response.Write("<script>alert('Money has not been succesfully purchased');</script>");
            }
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UserMoney.aspx?loginID=" + loginID);
        }
    }
}