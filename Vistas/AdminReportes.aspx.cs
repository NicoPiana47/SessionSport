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
    public partial class AdminReportes : System.Web.UI.Page
    {
        NegocioFactura nsF = new NegocioFactura();
        NegocioDetallesFactura nDF = new NegocioDetallesFactura();
        private string consulta = "SELECT * FROM Facturas";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarTablaFacturasTODO(consulta);
            }
        }

        void cargarTablaFacturasTODO(String consulta)
        {
            DataTable tablaFacturas = nsF.getTabla(consulta);
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();
        }

        protected void btnBuscarReporte_Click(object sender, EventArgs e)
        {
            DataTable tablaFacturas = nsF.getTabla($"{consulta} WHERE NroFactura_Fa = '{txtReporteDeVenta.Text}'");
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();
            txtReporteDeVenta.Text = "";

            vaciarGridDetalleFacturas();
        }

        protected void btnFiltroFecha_Click(object sender, EventArgs e)
        {
            String consultaProductos=armarParametrosFecha(1);
                
            DataTable tablaFacturas = nsF.getTabla(consulta);
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();

            lblProductosVendidos.Text = Convert.ToString(nDF.getTotalProductosVendidos(consultaProductos));
            

            vaciarGridDetalleFacturas();
        }


        protected void btnFiltroTotal_Click(object sender, EventArgs e)
        {
            String consultaTotal = armarParametrosFecha(2);

            DataTable tablaFacturas = nsF.getTabla(consulta);
            grvFacturas.DataSource = tablaFacturas;
            grvFacturas.DataBind();

            lblReporteTotal.Text = "$ " + Convert.ToString(nsF.getTotalRecaudado(consultaTotal));

            vaciarGridDetalleFacturas();
        }
        protected void ddlFiltroFecha_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFiltroFecha.SelectedValue != "-1")
            {
                if (ddlFiltroFecha.SelectedValue == "entre")
                {
                    txtFecha2.Visible = true;
                    rfvFecha2.Visible = true;
                }
                else
                {
                    txtFecha2.Visible = false;
                    rfvFecha2.Visible = false;
                }

                txtFecha1.Visible = true;
                txtFecha2.Text = "";
                PanelFiltros.Visible = true;
                btnFiltroFecha.Visible = true;
                btnFiltroTotal.Visible = true;
            }
            else
            {
                txtFecha1.Text = "";
                txtFecha1.Visible = false;
                txtFecha2.Visible = false;
                btnFiltroFecha.Visible = false;
                PanelFiltros.Visible = false;
            }
        }

        protected void btnQuitarFiltros_Click(object sender, EventArgs e)
        {
            cargarTablaFacturasTODO(consulta);
            vaciarGridDetalleFacturas();
            limpiarCampos();
        }

        void limpiarCampos()
        {
            ddlFiltroFecha.SelectedValue = "-1";
            txtFecha1.Text = "";
            txtFecha2.Text = "";
            txtReporteDeVenta.Text = "";
            txtFecha1.Visible = false;
            txtFecha2.Visible = false;
            PanelFiltros.Visible = false;
            lblProductosVendidos.Text = "";
            lblReporteTotal.Text = "";
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("~/Inicio.aspx");
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
            grvDetalleFacturas.DataSource = nDF.getTabla("SELECT DISTINCT  NroFactura_Df, Nombre_Pr, CodTalle_Ta, Descripcion_Co, PrecioUnitario_Df, Cantidad_Df" +
                                                        " FROM DetalleFacturas INNER JOIN TallesXProductosXColores ON CodProducto_Df=CodProducto_TXPXC" +
                                                        " INNER JOIN Talles ON CodTalle_Df=CodTalle_Ta INNER JOIN Colores ON CodColor_Df = CodColor_Co" +
                                                        " INNER JOIN Productos ON CodProducto_TXPXC = CodProducto_Pr WHERE NroFactura_Df = '" + nroFactura + "'");

            grvDetalleFacturas.DataBind();
        }

        protected void grvDetalleFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            String s_NroFactura = ((Label)grvFacturas.Rows[e.NewPageIndex].FindControl("it_lbl_NFactura")).Text;
            grvDetalleFacturas.PageIndex = e.NewPageIndex;
            cargarTablaDetalleFacturas(s_NroFactura);
        }

        protected void grvFacturas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvFacturas.PageIndex = e.NewPageIndex;
            cargarTablaFacturasTODO(consulta);
        }

        public void vaciarGridDetalleFacturas()
        {
            grvDetalleFacturas.DataSource = null;
            grvDetalleFacturas.DataBind();
        }

        public String armarParametrosFecha(int filtro)
        {
            String consultaReporte = "SELECT SUM(Cantidad_Df) AS [Total Productos Vendidos] FROM DetalleFacturas INNER JOIN Facturas ON NroFactura_Df = NroFactura_Fa WHERE Fecha_Fa";
            String consultaTotal = "SELECT SUM(Total_Fa) AS [Total Recaudado] FROM Facturas WHERE Fecha_Fa";

            if (txtFecha1.Text != "" || txtFecha2.Text != "")
            {
                consulta += " WHERE Fecha_Fa";

                if (ddlFiltroFecha.SelectedValue == "=")
                {
                    consulta += $" = '{txtFecha1.Text}'";
                    consultaReporte += $" = '{txtFecha1.Text}'";
                    consultaTotal += $" = '{txtFecha1.Text}'";
                }
                if (ddlFiltroFecha.SelectedValue == ">=")
                {
                    consulta += $" >= '{txtFecha1.Text}'";
                    consultaReporte += $" >= '{txtFecha1.Text}'";
                    consultaTotal += $" >= '{txtFecha1.Text}'";

                }
                if (ddlFiltroFecha.SelectedValue == "<=")
                {
                    consulta += $" <= '{txtFecha1.Text}'";
                    consultaReporte += $" <= '{txtFecha1.Text}'";
                    consultaTotal += $" <= '{txtFecha1.Text}'";
                }
                if (ddlFiltroFecha.SelectedValue == "entre")
                {
                    consulta += $" >= '{txtFecha1.Text}' AND Fecha_Fa <= '{txtFecha2.Text}'";
                    consultaReporte += $" >= '{txtFecha1.Text}' AND Fecha_Fa <= '{txtFecha2.Text}'";
                    consultaTotal += $" >= '{txtFecha1.Text}' AND Fecha_Fa <= '{txtFecha2.Text}'";
                }
            }

            if (filtro == 1) return consultaReporte;
            else return consultaTotal;
        }


    }
}