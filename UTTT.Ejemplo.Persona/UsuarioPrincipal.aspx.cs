using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Linq.Data.Entity;
using UTTT.Ejemplo.Persona.Control;
using UTTT.Ejemplo.Persona.Control.Ctrl;

namespace UTTT.Ejemplo.Persona
{
    public partial class UsuarioPrincipal : System.Web.UI.Page
    {
        #region Variables

        private SessionManager session = new SessionManager();
        private DataContext dcGlobal = new DcGeneralDataContext();

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["nombreUsuario"] == null)
                Response.Redirect("login.aspx");
            try
            {
                Response.Buffer = true;
                DataContext dcTemp = new DcGeneralDataContext();
                if (!this.IsPostBack)
                {
                    List<Estado> lista = dcTemp.GetTable<Estado>().ToList();
                    Estado catTemp = new Estado();
                    catTemp.id = -1;
                    catTemp.nombre = "Todos";
                    lista.Insert(0, catTemp);
                    this.ddlEstado.DataTextField = "nombre";
                    this.ddlEstado.DataValueField = "id";
                    this.ddlEstado.DataSource = lista;
                    this.ddlEstado.DataBind();

                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al cargar la página");
                this.showMessageException(_e.Message);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

            try
            {
                this.session.Pantalla = "~/UsuarioManager.aspx";
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idUsuario", "0");
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.Response.Redirect(this.session.Pantalla, false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al agregar");
                this.showMessageException(_e.Message);
            }
        }

        protected void dgvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int idUsuario = int.Parse(e.CommandArgument.ToString());
                switch (e.CommandName)
                {
                    case "Editar":
                        this.editar(idUsuario);
                        break;
                    case "Eliminar":
                        this.eliminar(idUsuario);
                        break;
                }
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un problema al seleccionar");
                this.showMessageException(_e.Message);
            }
        }
        private void editar(int _idUsuario)
        {
            try
            {
                Hashtable parametrosRagion = new Hashtable();
                parametrosRagion.Add("idUsuario", _idUsuario.ToString());
                this.session.Parametros = parametrosRagion;
                this.Session["SessionManager"] = this.session;
                this.session.Pantalla = String.Empty;
                this.session.Pantalla = "~/UsuarioManager.aspx";
                this.Response.Redirect(this.session.Pantalla, false);

            }
            catch (Exception _e)
            {
                throw _e;
            }
        }
        private void eliminar(int _idUsuario)
        {
            try
            {
                DataContext dcDelete = new DcGeneralDataContext();
                Usuarioo usuario = dcDelete.GetTable<Usuarioo>().First(
                    c => c.id == _idUsuario);
                dcDelete.GetTable<Usuarioo>().DeleteOnSubmit(usuario);
                dcDelete.SubmitChanges();
                this.showMessage("El registro se agrego correctamente.");
                this.DataSourceUsuario.RaiseViewChanged();
            }
            catch (Exception _e)
            {
                throw _e;
            }
        }

        protected void dgvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataSourceUsuario_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            try
            {
                DataContext dcConsulta = new DcGeneralDataContext();
                bool nombreBool = false;
                bool estado = false;
                if (!this.txtNombre.Text.Equals(String.Empty))
                {
                    nombreBool = true;
                }
                Expression<Func<Usuarioo, bool>>
                    predicate =
                    (c =>
                    ((estado) ? c.idEstado == int.Parse(this.ddlEstado.Text) : true) &&
                    ((nombreBool) ? (((nombreBool) ? c.nombreUsuario.Contains(this.txtNombre.Text.Trim()) : false)) : true)
                    );

                predicate.Compile();

                List<Usuarioo> listaPersona =
                    dcConsulta.GetTable<Usuarioo>().Where(predicate).ToList();
                e.Result = listaPersona;
            }
            catch (Exception)
            {

                throw;
            }
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
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Abandon();
                Response.Redirect("~/UsuarioPrincipal.aspx", false);
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
                Response.Redirect("~/inicio.aspx", false);
            }
            catch (Exception _e)
            {
                this.showMessage("Ha ocurrido un error inesperado");
                this.showMessageException(_e.Message);
            }
        }
    }
}