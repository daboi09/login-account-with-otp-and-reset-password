using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace myfreelance
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void user_login_Click(object sender, EventArgs e)
        {
            string loginID = user_login_text.Text;
            string nowpass = user_password_text.Text;
            string newpass = null;
            string checkotp = null;
            Account acct = new Account();

                if (loginID != "")
                {
                    newpass = acct.CheckPassword(loginID);
                    if (newpass != null)
                    {
                        string enpass = user_password_text.Text;
                        byte[] encData_byte = new byte[enpass.Length];
                        encData_byte = System.Text.Encoding.UTF8.GetBytes(enpass);
                        string encodedData = Convert.ToBase64String(encData_byte);
                        if (encodedData == newpass)
                            {
                                checkotp = acct.CheckOTP(loginID);
                                if (checkotp == "Yes")
                                {
                                    Response.Redirect("OTP.aspx?loginID=" + loginID);
                                }
                            
                                else
                                {
                                    Response.Redirect("LoginProfile.aspx?loginID=" + loginID);
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
                        Response.Write("<script>alert('Please enter your loginID');</script>");
                    }
            
        }
    }
}
