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
    public partial class Usuario2 : System.Web.UI.Page
    {
        NegocioFactura nFa = new NegocioFactura();
        NegocioDetallesFactura nDF = new NegocioDetallesFactura();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Panel2.Visible = false;
                lbl_Nombre.Text = ((Usuarios)Session["usuario"]).Nombre_Us;
                lbl_Apellido.Text = ((Usuarios)Session["usuario"]).Apellido_Us;
                lbl_FechaNac.Text = ((Usuarios)Session["usuario"]).FechaNac_Us.ToString("dd-MM-yyyy");
                lbl_DNI.Text = ((Usuarios)Session["usuario"]).Dni_Us;
                lbl_Telefono.Text = ((Usuarios)Session["usuario"]).Telefono_Us;
                lbl_Email.Text = ((Usuarios)Session["usuario"]).Email_Us;
                lbl_Domicilio.Text = ((Usuarios)Session["usuario"]).Domicilio_Us;
                lbl_CodigoPostal.Text = ((Usuarios)Session["usuario"]).CodigoPostal_Us;
                lbl_Usuario.Text = ((Usuarios)Session["usuario"]).Usuario_Us;
                lbl_Contraseña.Text= "********";

                cargarTablaFacturas();
            }
        }

        protected void btnVerContraseña_Click(object sender, EventArgs e)
        {
            if (lbl_Contraseña.Text == "********")
            {
                lbl_Contraseña.Text=((Usuarios)Session["usuario"]).Contraseña_Us;
                btnVerContraseña.Text = "Ocultar";
            }
            else
            {
                lbl_Contraseña.Text = "********";
                btnVerContraseña.Text = "Mostrar";

            } 
        }


        protected void grvFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvFacturas.PageIndex = e.NewPageIndex;
            cargarTablaFacturas();
        }
        protected void grvDetalleFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            String s_NroFactura = ((Label)grvFacturas.Rows[e.NewPageIndex].FindControl("it_lbl_NFactura")).Text;
            grvDetalleFacturas.PageIndex = e.NewPageIndex;
            cargarTablaDetalleFacturas(s_NroFactura);
        }

        protected void grvFacturas_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "eventoVerMas")
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                string s_nroFactura = ((Label)grvFacturas.Rows[fila].FindControl("it_lbl_NFactura")).Text;
                cargarTablaDetalleFacturas(s_nroFactura);
            }
        }

        public void cargarTablaDetalleFacturas(String nroFactura)
        {
            Panel2.Visible = true;
            grvDetalleFacturas.DataSource = nDF.getTabla("SELECT DISTINCT  NroFactura_Df, Nombre_Pr, CodTalle_Ta, Descripcion_Co, PrecioUnitario_Df, Cantidad_Df" +
                                                        " FROM DetalleFacturas INNER JOIN TallesXProductosXColores ON CodProducto_Df=CodProducto_TXPXC" +
                                                        " INNER JOIN Talles ON CodTalle_Df=CodTalle_Ta INNER JOIN Colores ON CodColor_Df = CodColor_Co" +
                                                        " INNER JOIN Productos ON CodProducto_TXPXC = CodProducto_Pr WHERE NroFactura_Df = '" + nroFactura + "'");

            grvDetalleFacturas.DataBind();

            grvFacturas.DataSource = nFa.getTabla("SELECT NroFactura_Fa, DNI_Fa, Descripcion_En, Descripcion_Pa, Fecha_Fa, DireccionEntrega_Fa, Tarjeta_Fa, Total_Fa"
                                                 + " FROM Facturas INNER JOIN MetodosPago ON CodMetPago_Fa = CodMetPago_Pa"
                                                 + " INNER JOIN MetodosEnvio ON CodMetEnvio_Fa = CodMetEnvio_En WHERE DNI_Fa = '" + lbl_DNI.Text + "' AND NroFactura_Fa= '" + nroFactura +"'");
            grvFacturas.DataBind();
        }

        public void cargarTablaFacturas()
        {
            
            DataTable tablaFacturas = nFa.getTabla("SELECT NroFactura_Fa, DNI_Fa, Descripcion_En, Descripcion_Pa, Fecha_Fa, DireccionEntrega_Fa, Tarjeta_Fa, Total_Fa"
                                                  + " FROM Facturas INNER JOIN MetodosPago ON CodMetPago_Fa = CodMetPago_Pa"
                                                  + " INNER JOIN MetodosEnvio ON CodMetEnvio_Fa = CodMetEnvio_En WHERE DNI_Fa = '" + lbl_DNI.Text + "'");
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();
        }
        protected void btnMostrarFacturas_Click(object sender, EventArgs e)
        {
            cargarTablaFacturas();
            Panel2.Visible = false;
        }
    }
}