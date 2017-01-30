using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using Negocio;
using Clases;

namespace Nurun
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            user _user = new user();

            if (txtuser.Text != "" && txtpass.Text != "")
            {
                _user = Negocio.userBs.GetLogin(txtuser.Text, security.SHA1(txtpass.Text));

                if (_user != null)
                {
                    Session["user"] = _user;
                    Response.Redirect("default.aspx");
                }
                else
                {
                    lblmsg.Text = "Ocurrió un error, intente nuevamente";  
                }
            }
        }
    }
}