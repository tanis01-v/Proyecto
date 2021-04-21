using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using UTTT.Ejemplo.Persona.Control.Ctrl;
using System.Data.OleDb;
using System.Data;

namespace UTTT.Ejemplo.Persona
{
    public partial class Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
    
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //DateTime fecha = Convert.ToDateTime(TextBox1.Text);
            //DateTime fechaNacimiento1 = fecha;
            //DateTime fechaHoy = DateTime.Today;
            //int edad = fechaHoy.Year - fechaNacimiento1.Year;
            //if (fechaHoy < fechaNacimiento1.AddYears(edad)) edad--;

            //if (edad < 18)
            //{
            //    this.showMessage("Eres menor de edad no puedes registrarte");

            //}
            //else
            //{
            //    this.showMessage("Eres mayor de edad puedes registrarte");
            //}
            
            this.showMessage("Eres menor de edad no puedes registrarte");
        }

        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl.DataBind();
        }

        //protected void TextBox2_TextChanged(object sender, EventArgs e)
        //{
        //    OleDbConnection conn = new OleDbConnection(@"Data Source=-TANIS-;Initial Catalog=Manual;Integrated Security=True");
        //    if (conn.State == ConnectionState.Closed)
        //    {
        //        conn.Open();
        //        OleDbCommand cmd1 = new OleDbCommand("select id,strClaveUnica,strNombre,strAPaterno,strAMaterno,idCatSexo,fechaNacimiento, correoElectronico,codigoPostal,rfc, idCatEstadoCivil from persona where strNombre like '%" + TextBox2 + "%'", conn);
        //        OleDbDataAdapter da = new OleDbDataAdapter();
        //        DataTable dt = new DataTable();
        //        da.SelectCommand = cmd1;
        //        dt.Clear();
        //        da.Fill(dt);
        //        this.dgvPersonas.DataSource = dt;
        //        conn.Close();
        //    }
        //}
    }
}