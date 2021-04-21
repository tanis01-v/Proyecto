using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class RecuperarContrasena : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idUsuario = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Usuarioo baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            this.txtCorreo.Enabled = false;
            DataContext dcGuardar = new DcGeneralDataContext();
            try
            {
                var correo = Request.QueryString["correo"];
                var persona = dcGuardar.GetTable<Linq.Data.Entity.Persona>().FirstOrDefault(c => c.correoElectronico == correo);
                var usuario = dcGuardar.GetTable<Usuarioo>().FirstOrDefault(c => c.idPersona == persona.id );
                this.txtCorreo.Text = usuario.nombreUsuario;
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DataContext dcGuardar = new DcGeneralDataContext();
            Usuarioo usuario = new Usuarioo();
            Usuarioo nombreUsuario = new Usuarioo(); 
            try
            {
                var correo = this.txtCorreo.Text;

                var persona = dcGlobal.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(c => c.correoElectronico == correo).FirstOrDefault();
                var correoExiste = dcGlobal.GetTable<Usuarioo>().Where(c => c.idPersona == persona.id).FirstOrDefault();
                
                if (correoExiste!=null)
                {
                    usuario = dcGuardar.GetTable<Usuarioo>().First(c => c.id == correoExiste.id);
                    usuario.contrasena = this.txtContrasena.Text.Trim();
                    dcGuardar.SubmitChanges();
                    this.showMessage("La contraseña se edito correctamente.");
                    this.Response.Redirect("~/Login.aspx", false);
                }
                else
                {
                    this.showMessage("No existe ese correo.");
                }
            }
            catch (Exception _e)
            {
                this.showMessage("Este correo no existe");
                this.Response.Redirect("~/Login.aspx", false);
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("~/Login.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }
        }
    }
}