using EASendMail;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Web.Mail;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioManager : System.Web.UI.Page
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
            if (Session["nombreUsuario"] == null)
                Response.Redirect("login.aspx");
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idUsuario = this.session.Parametros["idUsuario"] != null ?
                    int.Parse(this.session.Parametros["idUsuario"].ToString()) : 0;
                if (this.idUsuario == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Usuarioo();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Usuarioo>().First(c => c.id == this.idUsuario);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }

                    List<Estado> listaEstado = dcGlobal.GetTable<Estado>().ToList();
                    Estado catTempEstado = new Estado();
                    catTempEstado.id = 1;
                    catTempEstado.nombre = "Activo";
                    listaEstado.Insert(0, catTempEstado);
                    this.ddlEstado.DataTextField = "nombre";
                    this.ddlEstado.DataValueField = "id";
                    this.ddlEstado.DataSource = listaEstado;
                    this.ddlEstado.DataBind();
                    


                    this.ddlEstado.SelectedIndexChanged += new EventHandler(ddlEstado_SelectedIndexChanged);
                    this.ddlEstado.AutoPostBack = true;

                    //PERSONA
                    List<Linq.Data.Entity.Persona> listaPersona = dcGlobal.GetTable<Linq.Data.Entity.Persona>().ToList();
                    Linq.Data.Entity.Persona catTempPersona = new Linq.Data.Entity.Persona();
                    catTempPersona.id = -1;
                    catTempPersona.strNombre = "Seleccionar :D";
                    listaPersona.Insert(0, catTempPersona);
                    this.ddlPersonas.DataTextField = "strNombre";
                    this.ddlPersonas.DataValueField = "id";
                    this.ddlPersonas.DataSource = listaPersona;
                    this.ddlPersonas.DataBind();

                    this.ddlPersonas.SelectedIndexChanged += new EventHandler(ddlPersonas_SelectedIndexChanged);
                    this.ddlPersonas.AutoPostBack = true;

                    if (this.idUsuario == 0)
                    {
                        this.lblAccion.Text = "Agregar";

                        DateTime tiempo = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);

                        this.TextBox1.Text = tiempo.Date.ToString("MM/dd/yyyy");
                        this.ddlEstado.Enabled = false;

                    }
                    else
                    {

                        this.lblAccion.Text = "Editar";
                        this.txtNombreUsuario.Text = this.baseEntity.nombreUsuario;
                        this.txtContrasena.Text = this.baseEntity.contrasena;
                        this.txtContrasenaVerifi.Text = this.baseEntity.contrasena;

                        DateTime fechaNacimiento = (DateTime)this.baseEntity.fecha;
                        if (fechaNacimiento != null)
                        {

                            TextBox1.Text = fechaNacimiento.Date.ToString("MM/dd/yyyy");
                        }

                        this.setItemEdita(ref this.ddlEstado, baseEntity.Estado.nombre);
                        this.setItemEdita(ref this.ddlPersonas, baseEntity.Persona.strNombre);
                        this.ddlPersonas.Enabled= false;
                    }
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                this.showMessageException(_e.Message);
                Console.WriteLine(_e.Message);
            }

        }
        public void setItemEdita(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value != _value)
                {
                    item.Enabled = false;
                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idEstado = int.Parse(this.ddlEstado.Text);
                Expression<Func<Estado, bool>> predicateEstado = c => c.id == idEstado;
                predicateEstado.Compile();
                List<Estado> lista = dcGlobal.GetTable<Estado>().Where(predicateEstado).ToList();
                Estado catTempEstado = new Estado();
                this.ddlEstado.DataTextField = "nombre";
                this.ddlEstado.DataValueField = "id";
                this.ddlEstado.DataSource = lista;
                this.ddlEstado.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }
        protected void ddlPersonas_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idPersonas = int.Parse(this.ddlEstado.Text);
                Expression<Func<Linq.Data.Entity.Persona, bool>> predicatePersona = c => c.id == idPersonas;
                predicatePersona.Compile();
                List<Linq.Data.Entity.Persona> lista = dcGlobal.GetTable<Linq.Data.Entity.Persona>().Where(predicatePersona).ToList();
                Linq.Data.Entity.Persona catTempEstado = new Linq.Data.Entity.Persona();
                this.ddlEstado.DataTextField = "nombre";
                this.ddlEstado.DataValueField = "id";
                this.ddlEstado.DataSource = lista;
                this.ddlEstado.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                DataContext dcGuardar = new DcGeneralDataContext();
                Usuarioo usuario = new Usuarioo();
                Usuarioo nombreUsuario = new Usuarioo();

                if (this.idUsuario == 0)
                {
                    usuario.idEstado = int.Parse(this.ddlEstado.Text);
                    usuario.nombreUsuario = this.txtNombreUsuario.Text.Trim();
                    usuario.idPersona = int.Parse(this.ddlPersonas.Text);
                    usuario.contrasena = this.txtContrasena.Text.Trim();
                    DateTime fecha = Convert.ToDateTime(TextBox1.Text.Trim());
                    usuario.fecha = fecha;
                    
                    
                    String mensaje = String.Empty;

                    if (!this.validacion(usuario, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    //Validacion HTML
                    if (!this.validaHTML(ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    //Validacion SQL
                    if (!this.validaSql(ref mensaje))

                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }

                    dcGuardar.GetTable<Usuarioo>().InsertOnSubmit(usuario);
                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se agrego correctamente.");
                    this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                }
                if (this.idUsuario > 0)
                {
                    usuario = dcGuardar.GetTable<Usuarioo>().First(c => c.id == idUsuario);
                    usuario.idEstado = int.Parse(this.ddlEstado.Text);
                    usuario.nombreUsuario = this.txtNombreUsuario.Text.Trim();
                    //usuario.idPersona = int.Parse(this.ddlPersonas.Text);
                    usuario.contrasena = this.txtContrasena.Text.Trim();
                    DateTime fecha = Convert.ToDateTime(TextBox1.Text.Trim());
                    usuario.fecha = fecha;
                    String mensaje = String.Empty;
                    if (usuario.nombreUsuario == txtNombreUsuario.Text.Trim())
                    {

                    }
                    else { 
                    
                    if (!this.validacion(usuario, ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    }
                    //Validacion HTML
                    if (!this.validaHTML(ref mensaje))
                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }
                    //Validacion SQL
                    if (!this.validaSql(ref mensaje))

                    {
                        this.lblMensaje.Text = mensaje;
                        this.lblMensaje.Visible = true;
                        return;
                    }

                    dcGuardar.SubmitChanges();
                    this.showMessage("El registro se edito correctamente.");
                    this.Response.Redirect("~/UsuarioPrincipal.aspx", false);
                }




            }
            catch (Exception _e)
            {
                this.showMessageException(_e.Message);
                // Qué ha sucedido
                var mensaje = "Error message: " + _e.Message;
                // Información sobre la excepción interna
                if (_e.InnerException != null)
                {
                    mensaje = mensaje + " Inner exception: " + _e.InnerException.Message;
                }
                // Dónde ha sucedido
                mensaje = mensaje + " Stack trace: " + _e.StackTrace;


                //this.EnviarCorreo("18300143@uttt.edu.mx", "Exception", mensaje);
            }
        }

        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Usuarioo _usuario, ref String _mensaje)
        {
            //Validaciones de nombre de usuario 
            var nombreUsuario = dcGlobal.GetTable<Usuarioo>().Where(c => c.nombreUsuario == _usuario.nombreUsuario).FirstOrDefault();
            var persona = dcGlobal.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().Where(c => c.id == _usuario.idPersona).FirstOrDefault();

            if (nombreUsuario != null)
            {
                _mensaje = "Selecciona otro nombre de usuario";
                return false;
            }
            var personaRepetida = dcGlobal.GetTable<Usuarioo>().Where(c => c.idPersona == _usuario.idPersona).FirstOrDefault();
            if (personaRepetida != null)
            {
                _mensaje = "Selecciona otra Persona, la que escoges esta ocupada";
                return false;
            }
           
            return true;
            
        }

        private bool validaHTML(ref String _mensaje)
        {
            CtrValidaInyeccion valida = new CtrValidaInyeccion();
            string mensajeFuncion = string.Empty;

            if (valida.htmlInyectionValida(this.txtNombreUsuario.Text.Trim(), ref mensajeFuncion, "Nombre de Usuario", ref this.txtNombreUsuario))
            {
                _mensaje = mensajeFuncion;
                return false;
            }

            return true;
        }

        private bool validaSql(ref String _mensaje)
        {
            CtrValidaInyeccion valida = new CtrValidaInyeccion();
            string mensajeFuncion = string.Empty;

            if (valida.SqlInyectionValida(this.txtNombreUsuario.Text.Trim(), ref mensajeFuncion, "Clave unica", ref this.txtNombreUsuario))
            {
                _mensaje = mensajeFuncion;
                return false;
            }

            return true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
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

        protected void ddlPersonas_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        //public void EnviarCorreo(string correoDestino, string asunto, string mensajeCorreo)
        //{
        //    string mensaje = "Error al enviar correo.";

        //    try
        //    {
        //        SmtpMail smtpMail = new SmtpMail("TryIt");
        //        smtpMail.From = "18300143@uttt.edu.mx";
        //        smtpMail.To = correoDestino;
        //        smtpMail.Subject = asunto;
        //        smtpMail.TextBody = mensajeCorreo;

        //        SmtpServer smtpServer = new SmtpServer("smtp.gmail.com");//servidor proporcionado desde la configuracion de google

        //        smtpServer.User = "18300143@uttt.edu.mx";
        //        smtpServer.Password = "TVV3555T";
        //        smtpServer.Port = 587;
        //        smtpServer.ConnectType = SmtpConnectType.ConnectSSLAuto;

        //        SmtpClient objetoCliente = new SmtpClient();
        //        objetoCliente.SendMail(smtpServer, smtpMail);
        //        mensaje = "Correo Enviado Correctamente.";


        //    }
        //    catch (Exception ex)
        //    {
        //        mensaje = "Error al enviar correo." + ex.Message;
        //    }
        //}

    }
}