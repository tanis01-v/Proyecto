using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EASendMail;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class EnviarRecuperacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            DataContext dcGuardar = new DcGeneralDataContext();
            Usuarioo usuario = new Usuarioo();
            Usuarioo nombreUsuario = new Usuarioo();
            try
            {
                var correo = this.txtCorreo.Text;
                var persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(c => c.correoElectronico == correo).FirstOrDefault();
                var correoExiste = dcGuardar.GetTable<Usuarioo>().Where(c => c.idPersona == persona.id).FirstOrDefault();

                if (correoExiste != null)
                {
                    var url = "http://tania.somee.com/Recuperar.aspx?correo=" + correo;
                    //var url = "http://localhost:36683/Recuperar.aspx?correo=" + correo;

                    var message = "Selecciona la url para cambiar tu contraseña:  " + url;
                    EnviarCorreo(correo, "Recuperacion de contraseña", message);
                    Response.Redirect("~/Login.aspx", false);
                }
                else
                {
                    this.showMessage("No existe ese correo.");
                    Response.Redirect("~/EnviarRecuperacion.aspx", false);
                }

            }
            catch (Exception _e)
            {
                this.showMessage("No existe ese correo." + _e.Message);
                Response.Redirect("~/EnviarRecuperacion.aspx", false);
            }
            
        }

        public void EnviarCorreo(string correoDestino, string asunto, string mensajeCorreo)
        {
            string mensaje = "Error al enviar correo.";

            try
            {
                SmtpMail smtpMail = new SmtpMail("TryIt");
                smtpMail.From = "18300143@uttt.edu.mx";
                smtpMail.To = correoDestino;
                smtpMail.Subject = asunto;
                smtpMail.TextBody = mensajeCorreo;

                SmtpServer smtpServer = new SmtpServer("smtp.gmail.com");//servidor proporcionado desde la configuracion de google

                smtpServer.User = "18300143@uttt.edu.mx";
                smtpServer.Password = "TVV3555T";
                smtpServer.Port = 587;
                smtpServer.ConnectType = SmtpConnectType.ConnectSSLAuto;

                SmtpClient objetoCliente = new SmtpClient();
                objetoCliente.SendMail(smtpServer, smtpMail);
                mensaje = "Correo Enviado Correctamente.";


            }
            catch (Exception ex)
            {
                mensaje = "Error al enviar correo." + ex.Message;
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