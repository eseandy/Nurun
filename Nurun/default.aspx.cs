using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Clases;

namespace Nurun
{
    public partial class _default : System.Web.UI.Page
    {
        /// <summary>
        /// Valida sesión iniciada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else {

                user _us = (user)Session["user"];
                lblUser.Text = _us.name_user;
                lblRol.Text = rol(_us.rol_user);
                lblidUser.Text = _us.id_user.ToString();
            }
        }
        /// <summary>
        /// Construye Opciones que ve usuario
        /// </summary>
        /// <param name="idRol"></param>
        /// <returns></returns>
        string rol(long idRol)
        {
            string r="";
            switch (idRol) {
                case 1:
                    r = "Ejecutivo";
                    DivRol1.Visible = true;
                    DivRol2.Visible = false;
                    DivRol3.Visible = false;
                    break;
                case 2:
                    r = "Cajero";
                    DivRol1.Visible = false;
                    DivRol2.Visible = true;
                    DivRol3.Visible = false;
                    break;
                case 3:
                    r = "Cliente";
                    DivRol1.Visible = false;
                    DivRol2.Visible = false;
                    DivRol3.Visible = true;
                    break;
            }
            return r;
        }
        /// <summary>
        /// Inserta transferencias,  utilizando Libreria de clases Negocio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtEnvuar_Click(object sender, EventArgs e)
        {
            if (txtidClient.Text != "" && txtAmount.Text != "" && txtDesc.Text != "") {
                user _us = (user)Session["user"];
                int id_client = int.Parse(txtidClient.Text);
                int id_user = int.Parse(_us.id_user.ToString());
                float amount = float.Parse(txtAmount.Text);
                string desc = txtDesc.Text;
                int idTran = 0;
                idTran = Negocio.transferenciaBs.NewTran(id_user, id_client, amount, desc);
                lblTrans.Text = "Se realizo la transferencia " + idTran.ToString();
            } else {
                lblTrans.Text = "Complete los datos";
            }
        }
    }
}