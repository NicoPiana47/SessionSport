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
    public partial class PaginaMaestra : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null) 
            {
                Estado_Cuenta.ImageUrl = "~/Íconos/CuentaActiva.svg";
                Registrado.ImageUrl = "~/Íconos/CerrarSesion.svg";

                PanelCarrito.Visible = true;
                Estado_Cuenta.ImageUrl = "~/Íconos/CuentaActiva.svg";
                Registrado.ImageUrl = "~/Íconos/CerrarSesion.svg";
                

                lbIniciarSesion0.Text = "Bienvendo/a " + ((Usuarios)Session["usuario"]).Usuario_Us + "!";
                lbIniciarSesion0.PostBackUrl = "~/Usuario.aspx";

                lbRegistrarse.Text = "Cerrar Sesión";
                lbRegistrarse.PostBackUrl = "";  
            }
            else 
            {
                Estado_Cuenta.ImageUrl = "~/Íconos/IniciarSesion.svg";
                Registrado.ImageUrl = "~/Íconos/Registrarse.svg";
                PanelCarrito.Visible = false;


                lbIniciarSesion0.Text = "Iniciar Sesión";
                lbIniciarSesion0.PostBackUrl = "~/Login.aspx";

                lbRegistrarse.Text = "Registrarse";
                lbRegistrarse.PostBackUrl = "~/Register.aspx";
            }
        }

        protected void lbRegistrarse_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Session["usuario"] = null;

                lbIniciarSesion0.Text = "Iniciar Sesión";
                lbIniciarSesion0.PostBackUrl = "~/Login.aspx";

                lbRegistrarse.Text = "Registrarse";
                lbRegistrarse.PostBackUrl = "~/Register.aspx";

                Response.Redirect("~/Inicio.aspx");
            }
        }
    }
}