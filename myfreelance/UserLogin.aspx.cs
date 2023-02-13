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
                        System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
                        System.Text.Decoder utf8Decode = encoder.GetDecoder();
                        byte[] todecode_byte = Convert.FromBase64String(newpass);
                        int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
                        char[] decoded_char = new char[charCount];
                        utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
                        string result = new String(decoded_char);
                        if (result == nowpass)
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