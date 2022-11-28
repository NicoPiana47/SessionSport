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
    public partial class ProductoMás : System.Web.UI.Page
    {
        NegocioProducto nPr = new NegocioProducto();
        NegocioTallesXProductosXColores nTXPXC = new NegocioTallesXProductosXColores();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (!IsPostBack)
            {
                cargarProductosporId("SELECT * FROM Productos WHERE CodProducto_Pr = '" + id + "'");
                cargarTalles(id);
                cargarColores(id);
                cargarCantidad(id);
            }
        }
        protected void ddlTalle_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            cargarColores(id);
            ddlCantidad.Items.Clear();
            cargarCantidad(id);
        }

        protected void ddlColor_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            ddlCantidad.Items.Clear();
            cargarCantidad(id);
        }



        public void cargarTalles(String id)
        {
            DataTable tablaTalles = nTXPXC.getTabla("SELECT DISTINCT CodTalle_TXPXC FROM TallesXProductosXColores WHERE CodProducto_TXPXC = '" + id + "'");
            ddlTalle.DataSource = tablaTalles;
            ddlTalle.DataTextField = "CodTalle_TXPXC";
            ddlTalle.DataValueField = "CodTalle_TXPXC";
            ddlTalle.DataBind();
        }

        public void cargarColores (String id)
        {
            DataTable tablaColores = nTXPXC.getTabla("SELECT Descripcion_Co, CodColor_TXPXC FROM TallesXProductosXColores INNER JOIN Colores ON CodColor_TXPXC = CodColor_Co WHERE CodProducto_TXPXC = '" + id + "' AND CodTalle_TXPXC = '" + ddlTalle.SelectedValue + "'");
            ddlColor.DataSource = tablaColores;
            ddlColor.DataTextField = "Descripcion_Co";
            ddlColor.DataValueField = "CodColor_TXPXC";
            ddlColor.DataBind();
        }

        public void cargarCantidad(String id)
        {
            int cantidad = nTXPXC.getCantidad(id, ddlTalle.SelectedValue, ddlColor.SelectedValue);

            if (cantidad == 0)
            {
                ddlCantidad.Items.Add("Sin Stock");
            }
            else
            {
                for (int i = 1; i <= cantidad; i++)
                {
                    ddlCantidad.Items.Insert(i - 1, new ListItem { Value = i.ToString(), Text = i.ToString() });
                }
            }
        }
        void cargarProductosporId(String consulta)
        {
            lvProductoMas.DataSource = nPr.getTabla(consulta);
            lvProductoMas.DataBind();
        }

        protected void btnAgregar_Command(object sender, CommandEventArgs e)
        {
            if (e.CommandName == "eventoAgregar")
            {
                Tabla tb = new Tabla();

                String[] argumentos = e.CommandArgument.ToString().Split('-');

                String nombre = argumentos[0];
                String precioUnitario = argumentos[1];

                if (Session["usuario"] != null)
                {
                    string id = Request.QueryString["id"];
                    if (Session["carrito"] == null) Session["carrito"] = tb.crearTabla();

                    if(!tb.noRepetir(id,Convert.ToString(ddlColor.SelectedItem),ddlTalle.SelectedValue,(DataTable)Session["carrito"]))
                    {
                        if(Convert.ToString(ddlCantidad.SelectedItem)!="Sin Stock")
                        {
                            tb.agregarFila((DataTable)Session["carrito"], id, nombre, ddlTalle.SelectedValue, Convert.ToString(ddlColor.SelectedItem), Convert.ToString(ddlCantidad.SelectedValue), precioUnitario);
                            lblMensaje.Text = "Producto agregado al carrito!";
                            lblMensaje.ForeColor = System.Drawing.Color.Green;
                        }
                        else
                        {
                            lblMensaje.Text = "Este producto no tiene Stock!";
                            lblMensaje.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    else
                    {
                        lblMensaje.Text = "Este producto ya está en el carrito!";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMensaje.Text = "No ha iniciado sesión!";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}