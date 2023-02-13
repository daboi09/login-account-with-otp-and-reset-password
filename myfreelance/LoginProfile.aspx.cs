using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myfreelance
{
    public partial class LoginProfile : System.Web.UI.Page
    {
        Account accd = null;
        public string theID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Account acct = new Account();
            string loginID = Request.QueryString["loginID"].ToString();
            accd= acct.RetriveAccount(loginID);

            lbl_user_loginid.Text = loginID;
            lbl_user_name.Text = accd.name;
            lbl_user_email.Text = accd.email;
            lbl_user_contact.Text = accd.contact;
            lbl_user_dob.Text = accd.dateOfBirth;
            lbl_user_dj.Text = accd.dateJoined;
            lbl_user_cp.Text = accd.contributionPoints.ToString();
            lbl_user_deals.Text = accd.noOfDeals.ToString();
            lbl_user_role.Text = accd.role;
            lbl_user_license.Text = accd.license;
            lbl_user_rank.Text = accd.rank.ToString();
            lbl_otp.Text = accd.otp;
            user_image.ImageUrl = "~\\Images\\" + accd.image;

        }

        protected void user_delete_Click(object sender, EventArgs e)
        {
            int result = 0;
            Account acct = new Account();
            string loginID = Request.QueryString["loginID"].ToString();
            result = acct.AccountDelete(loginID);

            if (result > 0)
            {
                Response.Write("<script>alert('Account Remove successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('Account Removal NOT successfully');</script>");
            }

            Response.Redirect("DeletePage.aspx");
        }

        protected void user_update_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UpdateAccount.aspx?loginID=" + loginID);
        }

        protected void user_money_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            Response.Redirect("UserMoney.aspx?loginID=" + loginID);
        }

        protected void user_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }
    }
}