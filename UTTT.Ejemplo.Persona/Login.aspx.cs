using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class Login : System.Web.UI.Page
    {
        private int idUsuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                Usuarioo usuario = new Usuarioo();
                Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                string correoUsuario;
                correoUsuario = this.txtCorreo.Text.Trim();
                string contrasenaUsuario;
                contrasenaUsuario = this.txtContrasena.Text.Trim();
                //persona = dcGuardar.GetTable<Linq.Data.Entity.Persona>().FirstOrDefault(c => c.correoElectronico == correoUsuario);
                //usuario = dcGuardar.GetTable<Usuarioo>().FirstOrDefault(c => c.idPersona == persona.id );
                var usuarioLogin = dcGuardar.GetTable<Usuarioo>().FirstOrDefault(c => c.nombreUsuario == correoUsuario);


                if (usuarioLogin != null)
                {
                    if (correoUsuario == usuarioLogin.nombreUsuario && contrasenaUsuario == usuarioLogin.contrasena)
                    {
                        if (usuarioLogin.idEstado == 1)
                        {
                            this.showMessage("Usuario Valido");
                            Session["nombreUsuario"] = txtCorreo.Text.Trim();
                            this.Response.Redirect("~/inicio.aspx", false);
                        } else
                        {
                            this.showMessage("Tu usuario no esta activo");
                        }
                        
                    }
                    else
                    {
                        this.showMessage("Datos no validos");
                    }
                }
                else
                {
                    this.showMessage("Ingresa los datos correctos");
                }
               
            }
            catch (Exception)
            {
                this.showMessage("Ingresa los datos correctos");
                this.Response.Redirect("~/Login.aspx", false);
            }
            
        }
    }
}