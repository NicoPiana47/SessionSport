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

namespace Vistas.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        NegocioUsuario nsU = new NegocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_InicioSesion_Click(object sender, EventArgs e)
        {   

            Usuarios usu = new Usuarios();

            
            usu.Usuario_Us = txt_Usuario.Text;
            usu.Contraseña_Us = txt_Contraseña.Text;
            if (nsU.existeUsuario(usu) && nsU.estadoActivo(usu))
            {
                if (nsU.contraseñaCorrecta(usu))
                {
                    Session["usuario"] = nsU.getUsuarios(txt_Usuario.Text);
                    if (nsU.esAdmin(usu))
                        Response.Redirect("~/AdminReportes.aspx");
                    else
                        Session["carrito"] = null;
                        Response.Redirect("~/Usuario.aspx");
                }
                else
                {
                    lblMensaje.Text = "Contraseña incorrecta!";
                }
            }
            else
            {
                lblMensaje.Text = "Este usuario no existe!";
            }
        }
    }
}