using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Nurun
{
    public partial class logout : System.Web.UI.Page
    {
        /// <summary>
        /// Nurun: Cierra sesión y envia al home
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = null;
            Session.Clear();
            Response.Redirect("login.aspx");
        }
    }
}