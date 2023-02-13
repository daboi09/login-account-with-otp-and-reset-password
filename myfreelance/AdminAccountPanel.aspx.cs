using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace myfreelance
{
    public partial class AdminAccountPanel : System.Web.UI.Page
    {
        Account accd = new Account();
        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }
        protected void bind()
        {
            List<Account> accList = new List<Account>();
            accList = accd.getAccountAll();
            gvAccount.DataSource = accList;
            gvAccount.DataBind();
        }
        protected void gvAccount_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Get the currently selected row.
            GridViewRow row = gvAccount.SelectedRow;

            // Get Product ID from the selected row, which is the 
            // first row, i.e. index 0.
            string loginID = row.Cells[0].Text;

            // Redirect to next page, with the Product Id added to the URL,
            // e.g. ProductDetails.aspx?ProdID=1
            Response.Redirect("AdminAccounts.aspx?loginID=" + loginID);

        }
    }
}