using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Test_Bootstrap
{
    public partial class SiteMaster : MasterPage
    {
        public string loginID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            loginID = Request.QueryString["loginID"].ToString();
        }
    }
}