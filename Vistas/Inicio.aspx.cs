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
    public partial class Inicio : System.Web.UI.Page
    {
        NegocioProducto nPr = new NegocioProducto();
        NegocioTallesXProductosXColores nTXPXC = new NegocioTallesXProductosXColores();
        static DataTable tabla;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
              cargarProductosTodo("SELECT * FROM Productos WHERE Estado_Pr = 1");
        }

        protected void lvProductos_PagePropertiesChanging1(object sender, PagePropertiesChangingEventArgs e)
        {
            (lvProductos.FindControl("dpProductos") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            this.cargarList();
        }

        protected void btnFiltrarBusqueda_Click(object sender, EventArgs e)
        {
            if(btnFiltrar.Text.Trim() != "")
            {
                cargarProductosTodo($"SELECT * FROM Productos WHERE Estado_Pr = 1 AND Nombre_Pr LIKE '%{txtNombreProducto.Text}%'");
                quitarFiltro();
            }
        }

        protected void btnVerMas_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoVerMas")
            {
                String id = e.CommandArgument.ToString();
                TallesXProductosXColores p = new TallesXProductosXColores();
                p.Producto_TXPXC.CodProducto_Pr = id;
                if(nTXPXC.existeStock(p))
                    Response.Redirect("ProductoMás.aspx?id=" + id);
                else
                {
                    lblMensaje.Text = "Este producto no tiene stock!";
                    return;
                }
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            String categoria = rblCategorias.SelectedValue;
            String marca = rblMarcas.SelectedValue;
            String precioMin = txtPrecioMin.Text;
            String precioMax = txtPrecioMax.Text;
            String orden = ddlOrden.SelectedValue;

            tabla=nPr.getFiltrosInicio(categoria, marca, precioMin, precioMax, orden);
            lvProductos.DataSource = tabla;
            lvProductos.DataBind();

            quitarFiltro();
        }

        public void quitarFiltro()
        {
            txtNombreProducto.Text = "";
            txtPrecioMax.Text = "";
            txtPrecioMin.Text = "";
            lblMensaje.Text = "";
            rblCategorias.ClearSelection();
            rblMarcas.ClearSelection();
            ddlOrden.SelectedIndex = 0;
        }

        protected void btnLimpiarCategorias_Click(object sender, EventArgs e)
        {
            rblCategorias.ClearSelection();
        }

        protected void btnLimpiarMarcas_Click(object sender, EventArgs e)
        {
            rblMarcas.ClearSelection();
        }

        protected void btnQuitarFiltro_Click(object sender, EventArgs e)
        {
            cargarProductosTodo("SELECT * FROM Productos WHERE Estado_Pr = 1");
            quitarFiltro();
        }
        void cargarProductosTodo(String consulta)
        {
            tabla = nPr.getTabla(consulta);
            lvProductos.DataSource = tabla;
            lvProductos.DataBind();
        }

        void cargarList()
        {
            lvProductos.DataSource = tabla;
            lvProductos.DataBind();
        }
    }
}