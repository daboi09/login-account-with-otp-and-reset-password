using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myfreelance
{
    public partial class RecoverPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void recover_btn_Click(object sender, EventArgs e)
        {
            string loginID = Request.QueryString["loginID"].ToString();
            string recoverpass = recover_password.Text;
            string recoverpass2 = recover_password_2.Text;
            Account acct = new Account();
            byte[] encData_byte = new byte[recoverpass.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(recoverpass);
            string encodedData = Convert.ToBase64String(encData_byte);



            if (recoverpass != "")
            {
                if (recoverpass2 != null)
                {
                    if (recoverpass == recoverpass2)
                    {
                        int result = 0;
                        result = acct.RecoverPassword(loginID, encodedData);
                        if (result > 0)
                        {
                            Response.Write("<script>alert('Password Updated succesfully');</script>");
                            Response.Redirect("UserLogin.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Password NOT updated');</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Password does not match');</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Please reconfirm the passsword');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Please enter a new password');</script>");
            }
        }
    }
    
}