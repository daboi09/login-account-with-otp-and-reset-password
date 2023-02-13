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
    public partial class UserWithdraw : System.Web.UI.Page
    {
        public static string money = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Account acct = new Account();
            string loginID = Request.QueryString["loginID"].ToString();
            money = acct.MoneyRetrieve(loginID);
            lbl_user_money.Text = money;
        }

        protected void user_withdraw_Click(object sender, EventArgs e)
        {
            Account acct = new Account();
            string loginID = Request.QueryString["loginID"].ToString();
            string remail = acct.SendEmail(loginID);
            string smoney = acct.MoneyRetrieve(loginID);
            int withdraw = int.Parse(user_amount.Text);
            int result = 0;
            int submoney = int.Parse(smoney) - withdraw;
            if (int.Parse(smoney) >= withdraw)
            {
                result = acct.DeductMoney(loginID, submoney);

                if (result > 0)
                {
                    Response.Write("<script>alert('Your money has been successfully withdrawn');</script>");
                    using (MailMessage mail = new MailMessage())
                    {
                        mail.From = new MailAddress("your gmail");
                        mail.To.Add(remail.ToString());
                        mail.Subject = "Withdraw of myfreelance money";
                        mail.Body = "Hello, you have withdrawn $" + withdraw.ToString() + " of myfreelance money from your account";

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
                    Response.Write("<script>alert('Money has been not been withdrawn');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('You do not have enough balance');</script>");
            }
        }

        protected void user_back_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UserMoney.aspx?loginID=" + loginID);
        }
    }
}