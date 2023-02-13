using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myfreelance
{
    public partial class UserMoney : System.Web.UI.Page
    {
        public static string money = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            Account acct = new Account();
            string loginID = Request.QueryString["loginID"].ToString();
            money= acct.MoneyRetrieve(loginID);
            lbl_user_money.Text = money;
            lbl_user_loginid.Text = loginID;
  
        }

        protected void user_back_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("LoginProfile.aspx?loginID=" + loginID);
        }

        protected void user_money_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UserPurchase.aspx?loginID=" + loginID);
        }

        protected void user_transfer_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UserTransfer.aspx?loginID=" + loginID);
        }

        protected void user_withdraw_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UserWithdraw.aspx?loginID=" + loginID);
        }
    }
}