using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myfreelance
{
    public partial class AdminUpdateAccount : System.Web.UI.Page
    {
        Account accd = null;
        public static string theotp = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                update_id.Enabled = false;
                update_role.Enabled = false;
                update_license.Enabled = false;
                Account acct = new Account();
                string loginID = Request.QueryString["loginID"].ToString();
                accd = acct.RetriveAccount(loginID);

                System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
                System.Text.Decoder utf8Decode = encoder.GetDecoder();
                byte[] todecode_byte = Convert.FromBase64String(accd.password);
                int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
                char[] decoded_char = new char[charCount];
                utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
                string result = new String(decoded_char);

                update_name.Text = accd.name;
                update_email.Text = accd.email;
                update_contact.Text = accd.contact;
                update_date_birth.Text = accd.dateOfBirth;
                update_role.Text = accd.role;
                update_license.Text = accd.license;
                update_id.Text = Request.QueryString["loginID"].ToString();
                update_password.Text = result;
                uimage.Text = accd.image;
                theotp = accd.otp;
                user_image.ImageUrl = "~\\Images\\" + accd.image;

            }
        }

        protected void update_btn_Click(object sender, EventArgs e)
        {
            int result = 0;
            string image = null;
            string uotp = null;
            Account acct = new Account();
            string uname = update_name.Text;
            string uemail = update_email.Text;
            string ucontact = update_contact.Text;
            string udob = update_date_birth.Text;
            string urole = update_role.Text;
            string ulicense = update_license.Text;
            string uloginID = update_id.Text;
            string upassword = update_password.Text;
            string uimage = update_image.FileName;
            byte[] encData_byte = new byte[upassword.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(upassword);
            string encodedData = Convert.ToBase64String(encData_byte);
            if (rbl_otp.SelectedIndex > -1)
            {
                uotp = rbl_otp.SelectedItem.Text;
            }
            else
            {
                uotp = theotp;
            }

            if (update_image.HasFile == true)
            {
                image = "Images\\" + update_image.FileName;
                result = acct.AccountUpdate(uname, uemail, ucontact, udob, urole, ulicense, uloginID, encodedData, uimage, uotp);
                string saveimg = Server.MapPath(" ") + "\\" + image;
                update_image.SaveAs(saveimg);
            }
            else
            {
                result = acct.AccountUpdate(uname, uemail, ucontact, udob, urole, ulicense, uloginID, encodedData, this.uimage.Text, uotp);
            }
            if (result > 0)
            {
                Response.Write("<script>alert('Account updated successfully');</script>");
                Response.Redirect("AdminAccounts.aspx?loginID=" + uloginID);
            }
            else
            {
                Response.Write("<script>alert('Account NOT updated');</script>");
                Response.Redirect("AdminAccounts.aspx?loginID=" + uloginID);
            }
        }

        protected void cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAccountPanel.aspx");
        }
    }
}