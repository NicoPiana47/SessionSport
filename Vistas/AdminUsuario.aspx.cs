using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using Negocio;
using Entidades;
using System.Text.RegularExpressions;
using System.Windows;

namespace Vistas
{
    public partial class AdminUsuario : System.Web.UI.Page
    {

        NegocioUsuario nsU = new NegocioUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // CARGAR TABLA
                cargarTablaUsuario("SELECT * FROM Usuarios");
            }
        }

        void cargarTablaUsuario(string consulta)
        {
            DataTable tablaUsuarios = nsU.getTabla(consulta);
            grvUsuarios.DataSource = tablaUsuarios;
            grvUsuarios.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            DataTable tablaProductos = nsU.getTabla($"SELECT * FROM Usuarios WHERE {ddlFiltro.SelectedValue} LIKE '%{txtFiltro.Text}%'");
            grvUsuarios.DataSource = tablaProductos;
            grvUsuarios.DataBind();
            limpiarCampos();
        }

        protected void grvUsuarios_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvUsuarios.EditIndex = -1;
            cargarTablaUsuario("SELECT * FROM Usuarios");
            limpiarCampos();
        }

        protected void grvUsuarios_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string DNI_Us = ((Label)grvUsuarios.Rows[e.RowIndex].FindControl("it_lbl_DNI")).Text;
            Usuarios Us = new Usuarios();
            Us.Dni_Us = DNI_Us;
            NegocioUsuario NU = new NegocioUsuario();
            bool elimino = NU.EliminarUsuario(Us);

            cargarTablaUsuario("SELECT * FROM Usuarios");

            if (elimino)
            {
                lblLeyenda.ForeColor = System.Drawing.Color.Green;
                lblLeyenda.Text = "Usuario eliminado con éxito!";
            }
            else
            {
                lblLeyenda.ForeColor = System.Drawing.Color.Red;
                lblLeyenda.Text = "No se pudo eliminar el usuario";
            }
        }

        
        protected void grvUsuarios_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvUsuarios.EditIndex = e.NewEditIndex;
            cargarTablaUsuario("SELECT * FROM Usuarios");
            limpiarCampos();
        }
       
        protected void grvUsuarios_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string DNI_Us = ((Label)grvUsuarios.Rows[e.RowIndex].FindControl("eit_lbl_DNI")).Text;
            string Usuario_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtUsuario")).Text;
            string Email_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtMail")).Text;
            string Domicilio_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtDomicilio")).Text;
            string CodigoPostal_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtCodPostal")).Text;
            string Telefono_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtTelefono")).Text;
            string Nombre_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtNombre")).Text;
            string Apellido_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtApellido")).Text;
            string FechaNac_Us = ((TextBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_txtFechaNac")).Text;
            string Tipo_Us = ((DropDownList)grvUsuarios.Rows[e.RowIndex].FindControl("eit_ddl_Tipo")).SelectedValue;
            string Estado_Us = ((CheckBox)grvUsuarios.Rows[e.RowIndex].FindControl("eit_chk_Estado")).Checked.ToString();
            
            try
            {
                Usuarios Us = new Usuarios();
                Us.Dni_Us = DNI_Us;
                Us.Usuario_Us = Usuario_Us;
                Us.Email_Us = Email_Us;
                Us.Domicilio_Us = Domicilio_Us;
                Us.CodigoPostal_Us = CodigoPostal_Us;
                Us.Telefono_Us = Telefono_Us;
                Us.Nombre_Us = Nombre_Us;
                Us.Apellido_Us = Apellido_Us;
                Us.Tipo_Us = Convert.ToInt32(Tipo_Us);
                Us.Estado_Us = Convert.ToBoolean(Estado_Us);
                Us.Contraseña_Us = nsU.getContraseña("SELECT Contraseña_Us AS [Contraseña] FROM Usuarios WHERE DNI_Us= '" + DNI_Us + "'");

                if (FechaNac_Us != "")
                    Us.FechaNac_Us = DateTime.Parse(FechaNac_Us);

                Regex exp = new Regex(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*");
                Regex codp = new Regex(@"^\d{4}$");
                Regex soloNumeros = new Regex(@"^\d+$");
                Regex soloLetras = new Regex(@"^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$");

                if (!exp.IsMatch(Email_Us))
                    throw new Exception("Mail Inválido"); 
                if (Usuario_Us == "" || Domicilio_Us == "" || CodigoPostal_Us == "" || Telefono_Us == "" || Nombre_Us == "" || Apellido_Us == "" || FechaNac_Us == "")
                    throw new Exception("Completar Campos");
                if(!codp.IsMatch(CodigoPostal_Us))
                    throw new Exception("Código postal Inválido");
                if(!soloNumeros.IsMatch(Telefono_Us))
                    throw new Exception("Teléfono Inválido");
                if(!soloLetras.IsMatch(Nombre_Us))
                    throw new Exception("Nombre Inválido");
                if (!soloLetras.IsMatch(Apellido_Us))
                    throw new Exception("Apellido Inválido");
                if (nsU.existeUsuario(Us))
                    throw new Exception("Este usuario ya existe");
                if (nsU.existeMail(Us))
                    throw new Exception("Este Email ya existe");

                bool edito=nsU.ActualizarUsuario(Us);

                if (edito == true)
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Green;
                    lblLeyenda.Text = "Edición realizada con éxito!";
                }
                else
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Red;
                    lblLeyenda.Text = "No se pudo editar el usuario";
                }

                grvUsuarios.EditIndex = -1;

                cargarTablaUsuario("SELECT * FROM Usuarios");
            }
            catch (Exception ex)
            {
                lblLeyenda.ForeColor = System.Drawing.Color.Red;
                lblLeyenda.Text = ex.Message;
            }
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            cargarTablaUsuario("SELECT * FROM Usuarios");
            limpiarCampos();
        }

        protected void grvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
           grvUsuarios.PageIndex = e.NewPageIndex;
           cargarTablaUsuario("SELECT * FROM Usuarios");
           limpiarCampos();
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("~/Inicio.aspx");
        }

        public void limpiarCampos()
        {
            lblLeyenda.Text = "";
            txtFiltro.Text = "";
        }

        protected void ddlFiltro_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFiltro.SelectedIndex == 5)
            {
                txtFiltro.TextMode = TextBoxMode.Date;
            }
            else
                txtFiltro.TextMode = TextBoxMode.SingleLine;
        }
    }
}