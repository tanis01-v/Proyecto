using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] == null)
                Response.Redirect("login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/UsuarioPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }
        }

        //protected void btnCerrar_Click(object sender, EventArgs e)
        //{
        //        try
        //        {
        //            Session.Abandon();
        //            Response.Redirect("~/UsuarioPrincipal.aspx", false);
        //        }
        //        catch (Exception _e)
        //        {
        //            this.showMessage("Ha ocurrido un error inesperado");
        //            this.showMessageException(_e.Message);
        //        }
        //}
    }
}