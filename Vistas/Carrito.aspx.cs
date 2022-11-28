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
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["carrito"] != null)
                {
                    grdCarrito.DataSource = Session["carrito"];
                    grdCarrito.DataBind();
                    decimal acumTotal = 0;

                    foreach (DataRow dr in ((DataTable)Session["carrito"]).Rows)
                    {
                        acumTotal += Convert.ToInt32(dr["Cantidad"]) * Convert.ToDecimal(dr["Precio Unitario"]);   
                    }

                    lblTotal.Text = Convert.ToString(acumTotal);
                }
                else
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Carrito vacio!";
                }

            }
        }

        protected void btnEliminarTodos_Click(object sender, EventArgs e)
        {
            Session["carrito"] = null;
            grdCarrito.DataSource = Session["carrito"];
            grdCarrito.DataBind();
            lblMensaje.ForeColor = System.Drawing.Color.Red;
            lblMensaje.Text = "Los elementos seleccionados han sido borrados!";
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            if (Session["carrito"] != null)
                Response.Redirect("~/FormasPago.aspx");
            else
                lblMensaje.Text = "No hay productos en el carrito!";
        }
    }
}