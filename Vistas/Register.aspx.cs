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
using System.Threading.Tasks;

namespace Vistas.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        NegocioUsuario nsU = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_CrearCuenta_Click(object sender, EventArgs e)
        {
            try
            {
                Usuarios Us = new Usuarios();
                Us.Nombre_Us = txt_Nombre.Text;
                Us.Apellido_Us = txt_Apellido.Text;
                Us.FechaNac_Us = DateTime.Parse(txt_FechaNac.Text);
                Us.Dni_Us = txt_DNI.Text;
                Us.Contraseña_Us = txt_Contraseña.Text;
                Us.Usuario_Us = txt_NombreUsuario.Text;
                Us.Email_Us = txt_Email.Text;
                Us.Domicilio_Us = txt_Domicilio.Text;
                Us.CodigoPostal_Us = txt_CodigoPostal.Text;
                Us.Telefono_Us = txt_Telefono.Text;

                if (nsU.existeUsuario(Us))
                    throw new Exception("Este usuario ya existe");
                if (nsU.existeMail(Us))
                    throw new Exception("Este Email ya existe");
                if (nsU.existeDNI(Us))
                    throw new Exception("Este DNI ya existe");

                bool agrego = nsU.AgregarUsuario(Us);

                if (!agrego)
                    lblLeyenda.Text = "No se pudo registrar al usuario";
                else
                {
                    lblLeyenda.ForeColor = System.Drawing.Color.Green;
                    lblLeyenda.Text = "Usuario registrado con éxito!";
                    Timer1.Enabled = true;
                }
            }
            catch (Exception ex)
            {
                lblLeyenda.Text = ex.Message;
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}