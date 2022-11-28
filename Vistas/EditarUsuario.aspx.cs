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

namespace Vistas
{
    public partial class EditarUsuario2 : System.Web.UI.Page
    {
        NegocioUsuario nsU = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txt_Nombre.Text = ((Usuarios)Session["usuario"]).Nombre_Us;
                txt_Apellido.Text = ((Usuarios)Session["usuario"]).Apellido_Us;
                txt_FechaNac.Text = ((Usuarios)Session["usuario"]).FechaNac_Us.ToString("yyyy-MM-dd");
                lblDni.Text = ((Usuarios)Session["usuario"]).Dni_Us;
                txt_Telefono.Text = ((Usuarios)Session["usuario"]).Telefono_Us;
                txt_Email.Text = ((Usuarios)Session["usuario"]).Email_Us;
                txt_Domicilio.Text = ((Usuarios)Session["usuario"]).Domicilio_Us;
                txt_CodigoPostal.Text = ((Usuarios)Session["usuario"]).CodigoPostal_Us;
                txt_Usuario.Text = ((Usuarios)Session["usuario"]).Usuario_Us;
                txt_Contraseña.Text = ((Usuarios)Session["usuario"]).Contraseña_Us;
            }
        }


        protected void btnEditar_Click(object sender, EventArgs e)
        {
            try
            {
                Usuarios Us = new Usuarios();
                Us.Dni_Us = lblDni.Text;
                Us.Usuario_Us = txt_Usuario.Text;
                Us.Email_Us = txt_Email.Text;
                Us.Domicilio_Us = txt_Domicilio.Text;
                Us.CodigoPostal_Us = txt_CodigoPostal.Text;
                Us.Telefono_Us = txt_Telefono.Text;
                Us.Nombre_Us = txt_Nombre.Text;
                Us.Apellido_Us = txt_Apellido.Text;
                Us.FechaNac_Us = Convert.ToDateTime(txt_FechaNac.Text);
                Us.Contraseña_Us = txt_Contraseña.Text;
                Us.Tipo_Us = ((Usuarios)Session["usuario"]).Tipo_Us;
                Us.Estado_Us = ((Usuarios)Session["usuario"]).Estado_Us;

                if (nsU.existeUsuario(Us))
                    throw new Exception("Este usuario ya existe");
                if (nsU.existeMail(Us))
                    throw new Exception("Este Email ya existe");

                bool edito=nsU.ActualizarUsuario(Us);

                if (edito == true)
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Green;
                    lblLeyenda.Text = "Edición realizada con éxito!";

                    ((Usuarios)Session["usuario"]).Nombre_Us = Us.Nombre_Us;
                    ((Usuarios)Session["usuario"]).Apellido_Us = Us.Apellido_Us;
                    ((Usuarios)Session["usuario"]).FechaNac_Us = Convert.ToDateTime(Us.FechaNac_Us);
                    ((Usuarios)Session["usuario"]).Dni_Us = Us.Dni_Us;
                    ((Usuarios)Session["usuario"]).Telefono_Us = Us.Telefono_Us;
                    ((Usuarios)Session["usuario"]).Email_Us = Us.Email_Us;
                    ((Usuarios)Session["usuario"]).Domicilio_Us = Us.Domicilio_Us;
                    ((Usuarios)Session["usuario"]).CodigoPostal_Us = Us.CodigoPostal_Us;
                    ((Usuarios)Session["usuario"]).Usuario_Us = Us.Usuario_Us;
                    ((Usuarios)Session["usuario"]).Contraseña_Us = Us.Contraseña_Us;
                }
                else
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Red;
                    lblLeyenda.Text = "No se pudo editar";
                }
            }
            catch(Exception ex)
            {
                lblLeyenda.Text = ex.Message;
            }

        }
        protected void btnSolicitarCambio_Click(object sender, EventArgs e)
        {
            lblMensajeDni.Text = "Cambio de DNI solicitado!";
        }
    }
}