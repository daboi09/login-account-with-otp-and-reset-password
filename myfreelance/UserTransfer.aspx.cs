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
    public partial class UserTransfer : System.Web.UI.Page
    {
        public static string money = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            Account acct = new Account();
            string loginID = Request.QueryString["loginID"].ToString();
            money = acct.MoneyRetrieve(loginID);
            lbl_user_money.Text = money;
        }

        protected void user_transfer_Click(object sender, EventArgs e)
        {
            string checkid = null;           
            Account acct = new Account();
            int transfer = int.Parse(user_amount.Text);
            string loginID = Request.QueryString["loginID"].ToString();
            string remail = acct.SendEmail(loginID);
            string smoney = acct.MoneyRetrieve(loginID);
            string tloginID = user_id_transfer.Text;
            checkid = acct.CheckLoginID(tloginID);
            string rtemail = acct.SendEmail(tloginID);
            string stmoney = acct.MoneyRetrieve(tloginID);
            if (tloginID == checkid)
            {
                if (int.Parse(smoney) >= transfer)
                {
                    int result = 0;
                    int addmoney = int.Parse(stmoney) + transfer;
                    result = acct.TransferMoney(tloginID, addmoney);
                    if (result > 0)
                    {
                        Response.Write("<script>alert('The money has been successfully transfered');</script>");
                        using (MailMessage mail = new MailMessage())
                        {
                            mail.From = new MailAddress("autoreplymyfreelance@gmail.com");
                            mail.To.Add(rtemail.ToString());
                            mail.Subject = "Recived myfreelance money";
                            mail.Body = "Hello, you have received $" + transfer.ToString() + " from loginID, " + loginID;

                            using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                            {
                                smtp.Credentials = new System.Net.NetworkCredential("autoreplymyfreelance@gmail.com", "eousfbbnsjlcfhiv");
                                smtp.EnableSsl = true;
                                smtp.Send(mail);
                            }

                        }
                        int dresult = 0;
                        int submoney = int.Parse(smoney) - transfer;
                        dresult = acct.DeductMoney(loginID, submoney);
                        if (dresult > 0)
                        {
                            Response.Write("<script>alert('Your money has been successfully deducted');</script>");
                            using (MailMessage mail = new MailMessage())
                            {
                                mail.From = new MailAddress("your gmail");
                                mail.To.Add(remail.ToString());
                                mail.Subject = "Transfer of myfreelance money";
                                mail.Body = "Hello, you have transfered $" + transfer.ToString() + " of myfreelance to loginID, " + tloginID;

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
                            Response.Write("<script>alert('Money has not been deducted');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Money has not been added to user');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('You do not have enough balance');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('LoginID does not exist');</script>");
            }
        }

        protected void user_back_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UserMoney.aspx?loginID=" + loginID);
        }
    }
}