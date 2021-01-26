#region Using
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using System.Data.Linq;
using System.Linq.Expressions;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using EASendMail;


#endregion

namespace UTTT.Ejemplo.Persona
{
    public partial class PersonaManager : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private int idPersona = 0;
        private UTTT.Ejemplo.Linq.Data.Entity.Persona baseEntity;
        private DataContext dcGlobal = new DcGeneralDataContext();
        private int tipoAccion = 0;

        #endregion

        #region Eventos

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.Response.Buffer = true;
                this.session = (SessionManager)this.Session["SessionManager"];
                this.idPersona = this.session.Parametros["idPersona"] != null ?
                    int.Parse(this.session.Parametros["idPersona"].ToString()) : 0;
                if (this.idPersona == 0)
                {
                    this.baseEntity = new Linq.Data.Entity.Persona();
                    this.tipoAccion = 1;
                }
                else
                {
                    this.baseEntity = dcGlobal.GetTable<Linq.Data.Entity.Persona>().First(c => c.id == this.idPersona);
                    this.tipoAccion = 2;
                }

                if (!this.IsPostBack)
                {
                    if (this.session.Parametros["baseEntity"] == null)
                    {
                        this.session.Parametros.Add("baseEntity", this.baseEntity);
                    }
                    List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().ToList();
                    CatSexo catTemp = new CatSexo();
                    catTemp.id = -1;
                    catTemp.strValor = "Seleccionar";
                    lista.Insert(0, catTemp);
                    this.ddlSexo.DataTextField = "strValor";
                    this.ddlSexo.DataValueField = "id";
                    this.ddlSexo.DataSource = lista;
                    this.ddlSexo.DataBind();

                    this.ddlSexo.SelectedIndexChanged += new EventHandler(ddlSexo_SelectedIndexChanged);
                    this.ddlSexo.AutoPostBack = true;
                    if (this.idPersona == 0)
                    {
                        this.lblAccion.Text = "Agregar";
                        DateTime tiempo = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                        this.dteCalendar.TodaysDate = tiempo;
                        this.dteCalendar.SelectedDate = tiempo;
                    }
                    else
                    {
                        this.lblAccion.Text = "Editar";
                        this.txtNombre.Text = this.baseEntity.strNombre;
                        this.txtAPaterno.Text = this.baseEntity.strAPaterno;
                        this.txtAMaterno.Text = this.baseEntity.strAMaterno;
                        this.txtClaveUnica.Text = this.baseEntity.strClaveUnica;
                        this.txtCorreo.Text = this.baseEntity.correoElectronico;
                        this.txtRFC.Text = this.baseEntity.rfc;
                        this.txtCodigoPostal.Text = this.baseEntity.codigoPostal;

                        DateTime? fechaNacimiento = this.baseEntity.fechaNacimiento;
                        if (fechaNacimiento != null)
                        {
                            this.dteCalendar.TodaysDate = (DateTime)fechaNacimiento;
                            this.dteCalendar.SelectedDate = (DateTime)fechaNacimiento;
                        }

                        this.setItem(ref this.ddlSexo, baseEntity.CatSexo.strValor);
                    }                
                }

            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                this.showMessageException(_e.Message);
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
          

            try
            {
                DateTime fechaNacimiento1 = this.dteCalendar.SelectedDate.Date;
                DateTime fechaHoy = DateTime.Today;
                int edad = fechaHoy.Year - fechaNacimiento1.Year;
                if (fechaHoy < fechaNacimiento1.AddYears(edad)) edad--;

                if (edad < 18)
                {
                    this.showMessage("Eres menor de edad no puedes registrarte");
                }
                else
                {
                    if (!Page.IsValid)
                    {
                        return;
                    }
                    DataContext dcGuardar = new DcGeneralDataContext();
                    UTTT.Ejemplo.Linq.Data.Entity.Persona persona = new Linq.Data.Entity.Persona();
                    if (this.idPersona == 0)
                    {
                        persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                        persona.strNombre = this.txtNombre.Text.Trim();
                        persona.strAMaterno = this.txtAMaterno.Text.Trim();
                        persona.strAPaterno = this.txtAPaterno.Text.Trim();
                        persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                        DateTime fechaNacimiento = this.dteCalendar.SelectedDate.Date;
                        persona.fechaNacimiento = fechaNacimiento;
                        persona.correoElectronico = this.txtCorreo.Text.Trim();
                        persona.codigoPostal = this.txtCodigoPostal.Text.Trim();
                        persona.rfc = this.txtRFC.Text.Trim();

                        String mensaje = String.Empty;
                        //Validacion de datos correctos
                        if (!this.validacion(persona, ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        //Validacion SQL
                        if(!this.validaHTML(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        //Validacion HTML
                        if (!this.validaSql(ref mensaje))

                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }


                        dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().InsertOnSubmit(persona);
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se agrego correctamente.");
                        this.Response.Redirect("~/PersonaPrincipal.aspx", false);

                        

                    }
                    if (this.idPersona > 0)
                    {
                        persona = dcGuardar.GetTable<UTTT.Ejemplo.Linq.Data.Entity.Persona>().First(c => c.id == idPersona);
                        persona.strClaveUnica = this.txtClaveUnica.Text.Trim();
                        persona.strNombre = this.txtNombre.Text.Trim();
                        persona.strAMaterno = this.txtAMaterno.Text.Trim();
                        persona.strAPaterno = this.txtAPaterno.Text.Trim();
                        persona.idCatSexo = int.Parse(this.ddlSexo.Text);
                        DateTime fechaNacimiento = this.dteCalendar.SelectedDate.Date;
                        persona.fechaNacimiento = fechaNacimiento;
                        persona.correoElectronico = this.txtCorreo.Text.Trim();
                        persona.codigoPostal = this.txtCodigoPostal.Text.Trim();
                        persona.rfc = this.txtRFC.Text.Trim();
                        String mensaje = String.Empty;
                        //Validacion de datos correctos
                        if (!this.validacion(persona, ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        //Validacion SQL
                        if (!this.validaHTML(ref mensaje))
                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        //Validacion HTML
                        if (!this.validaSql(ref mensaje))

                        {
                            this.lblMensaje.Text = mensaje;
                            this.lblMensaje.Visible = true;
                            return;
                        }
                        dcGuardar.SubmitChanges();
                        this.showMessage("El registro se edito correctamente.");
                        this.Response.Redirect("~/PersonaPrincipal.aspx", false);
                    }
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


                this.EnviarCorreo("18300143@uttt.edu.mx", "Exception", mensaje);
            }

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {              
                this.Response.Redirect("~/PersonaPrincipal.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }
        }

        protected void ddlSexo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int idSexo = int.Parse(this.ddlSexo.Text);
                Expression<Func<CatSexo, bool>> predicateSexo = c => c.id == idSexo;
                predicateSexo.Compile();
                List<CatSexo> lista = dcGlobal.GetTable<CatSexo>().Where(predicateSexo).ToList();
                CatSexo catTemp = new CatSexo();            
                this.ddlSexo.DataTextField = "strValor";
                this.ddlSexo.DataValueField = "id";
                this.ddlSexo.DataSource = lista;
                this.ddlSexo.DataBind();
            }
            catch (Exception)
            {
                this.showMessage("Ha ocurrido un error inesperado");
            }
        }

        #endregion

        #region Metodos

        

        public bool validacion(UTTT.Ejemplo.Linq.Data.Entity.Persona _persona, ref String _mensaje)
        {
            if (_persona.idCatSexo == -1)
            {
                _mensaje = "Selecciona Masculino o Femenino";
                return false;
            }
            if (_persona.strClaveUnica.Equals(String.Empty))
            {
                _mensaje = "La clave unica esta vacia";
                return false;
            }
            if (_persona.strClaveUnica.Length != 3)
            {
                _mensaje = "La clave unica solo acepta 3 valores";
                return false;
            }
            if (_persona.strNombre.Equals(String.Empty))
            {
                _mensaje = "Nombre esta vacio, revisar campo";
                return false;
            }
            if (_persona.strNombre.Length <3 || _persona.strNombre.Length>15)
            {
                _mensaje = "Los caracteres permitidos para nombre son de 3 a 15 ";
                return false;
            }
            if (_persona.strAPaterno.Equals(String.Empty))
            {
                _mensaje = "Apellido Paterno esta vacio, revisar campo";
                return false;
            }
            if (_persona.strAPaterno.Length <3 || _persona.strAPaterno.Length>15)
            {
                _mensaje = "Los caracteres permitidos para Apellido Paterno son de 3 a 15 ";
                return false;
            }
            if (_persona.strAMaterno.Equals(String.Empty))
            {
                _mensaje = "Apellido Materno esta vacio, revisar campo";
                return false;
            }
            if (_persona.strAMaterno.Length<3 || _persona.strAMaterno.Length>15)
            {
                _mensaje = "Los caracteres permitidos par Apellido Materno rebasan los caracteres permitidos ";
                return false;
            }
            if (_persona.correoElectronico.Equals(String.Empty))
            {
                _mensaje = "Correo esta vacio, revisar campo";
                return false;
            }
            if (_persona.codigoPostal.Equals(String.Empty))
            {
                _mensaje = "Codigo postal esta vacio, revisar campo";
                return false;
            }
            if (_persona.rfc.Equals(String.Empty))
            {
                _mensaje = "RFC esta vacio, revisar campo";
                return false;
            }

            return true;

        }

        private bool validaHTML(ref String _mensaje)
        {
            CtrValidaInyeccion valida = new CtrValidaInyeccion();
            string mensajeFuncion = string.Empty;

            if (valida.htmlInyectionValida(this.txtClaveUnica.Text.Trim(), ref mensajeFuncion, "Clave unica", ref this.txtClaveUnica))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtNombre.Text.Trim(), ref mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAPaterno.Text.Trim(), ref mensajeFuncion, "Apellido paterno", ref this.txtAPaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensajeFuncion, "Apellido Materno", ref this.txtAMaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtCorreo.Text.Trim(), ref mensajeFuncion, "Correo Electronico", ref this.txtCorreo))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtCodigoPostal.Text.Trim(), ref mensajeFuncion, "Codigo Postal", ref this.txtCodigoPostal))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.htmlInyectionValida(this.txtRFC.Text.Trim(), ref mensajeFuncion, "RFC", ref this.txtRFC))
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

            if (valida.SqlInyectionValida(this.txtClaveUnica.Text.Trim(), ref mensajeFuncion, "Clave unica", ref this.txtClaveUnica))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.SqlInyectionValida(this.txtNombre.Text.Trim(), ref mensajeFuncion, "Nombre", ref this.txtNombre))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.SqlInyectionValida(this.txtAPaterno.Text.Trim(), ref mensajeFuncion, "Apellido Paterno", ref this.txtAPaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.SqlInyectionValida(this.txtAMaterno.Text.Trim(), ref mensajeFuncion, "Apellido Materno", ref this.txtAMaterno))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.SqlInyectionValida(this.txtCorreo.Text.Trim(), ref mensajeFuncion, "Correo electronico", ref this.txtCorreo))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.SqlInyectionValida(this.txtCodigoPostal.Text.Trim(), ref mensajeFuncion, "Codigo postal", ref this.txtCodigoPostal))
            {
                _mensaje = mensajeFuncion;
                return false;
            }
            if (valida.SqlInyectionValida(this.txtRFC.Text.Trim(), ref mensajeFuncion, "RFC", ref this.txtRFC))
            {
                _mensaje = mensajeFuncion;
                return false;
            }

            return true;
        }

        public void setItem(ref DropDownList _control, String _value)
        {
            foreach (ListItem item in _control.Items)
            {
                if (item.Value == _value)
                {
                    item.Selected = true;
                    break;
                }
            }
            _control.Items.FindByText(_value).Selected = true;
        }



        public void mayor(DateTime fechaNacimiento)
        {
            //DateTime fechaNacimiento = this.dteCalendar.SelectedDate.Date;
            //this.showMessage("La fecha de nacimiento es " + fechaNacimiento);
            DateTime fechaHoy = DateTime.Today;
            int edad = fechaHoy.Year - fechaNacimiento.Year;
            if (fechaHoy < fechaNacimiento.AddYears(edad)) edad--;

            if (edad < 18)
            {
                this.showMessage("Eres menor de edad no puedes registrarte");
            }

            //DateTime fechaNacimiento = this.dteCalendar.SelectedDate.Date;
            //mayor(fechaNacimiento);
        }
        #endregion

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

    }
}