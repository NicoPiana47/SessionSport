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
    public partial class FormasPago : System.Web.UI.Page
    {
        NegocioFactura nFa = new NegocioFactura();
        NegocioDetallesFactura nDF = new NegocioDetallesFactura();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PanelTarjeta.Visible = false;
                PanelEfectivo.Visible = false;

                lbl_Nombre.Text = ((Usuarios)Session["usuario"]).Nombre_Us;
                lbl_Apellido.Text = ((Usuarios)Session["usuario"]).Apellido_Us;
                lbl_DNI.Text = ((Usuarios)Session["usuario"]).Dni_Us;
            }
        }

        protected void btnTarjeta_Click(object sender, EventArgs e)
        {
            PanelTarjeta.Visible = true;
            PanelEfectivo.Visible = false;
        }

        protected void btnEfectivo_Click(object sender, EventArgs e)
        {
            PanelEfectivo.Visible = true;
            PanelTarjeta.Visible = false;
        }  

        protected void ddl_FormasEnvio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_FormasEnvio.SelectedValue == "2")
            {
                PanelFormaEnvio.Visible = true;
                btnEfectivo.ValidationGroup = "Grupo1";
                btnTarjeta.ValidationGroup = "Grupo1";
            }
            else
            {
                PanelFormaEnvio.Visible = false;
                btnEfectivo.ValidationGroup = "Grupo0";
                btnTarjeta.ValidationGroup = "Grupo0";
            }
        }

        protected void btn_PagarTarj_Click(object sender, EventArgs e)
        {
            if (Session["carrito"]!=null)
            {
                String metodoPago = "2";
                String tarjeta = txt_Tarjeta.Text;

                bool agrego = agregarFactura(metodoPago, tarjeta);

                if (agrego)
                {
                    bool agregoDetalles = agregarDetalles();

                    if (agregoDetalles)
                    {
                        lblMensaje.Text = "Se realizó la compra con éxito!";
                        lblMensaje.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMensaje.Text = "No se pudo realizar la compra";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMensaje.Text = "No se pudo realizar la compra";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }

                Session["carrito"] = null;
            }
            else
            {
                lblMensaje.Text = "Ya se realizó esta compra!";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btn_PagarEfec_Click(object sender, EventArgs e)
        {
            if (Session["carrito"] != null)
            {
                String metodoPago = "1";
                String tarjeta = "S/T";

                bool agrego = agregarFactura(metodoPago, tarjeta);

                if (agrego)
                {
                    bool agregoDetalles = agregarDetalles();

                    if (agregoDetalles)
                    {
                        lblMensaje.Text = "Se realizó la compra con éxito!";
                        lblMensaje.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        lblMensaje.Text = "No se pudo realizar la compra";
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lblMensaje.Text = "No se pudo realizar la compra";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }

                Session["carrito"] = null;
            }
            else
            {
                lblMensaje.Text = "Ya se realizó esta compra!";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        public bool agregarFactura(String metodoPago, String tarjeta)
        {
            String dni = ((Usuarios)Session["usuario"]).Dni_Us;
            String metodoEnvio = ddl_FormasEnvio.SelectedValue;
            String direccionEntrega;
            if (txtDireccionEntrega.Text != "" && metodoEnvio == "2")
                 direccionEntrega = txtDireccionEntrega.Text;
            else
                 direccionEntrega = "Retiro en sucursal";

            return nFa.agregarFactura(dni, metodoPago, metodoEnvio, direccionEntrega, tarjeta);
        }

        public bool agregarDetalles()
        {
            bool agrego = true;
            foreach (DataRow dr in ((DataTable)Session["carrito"]).Rows)
            {
                String codProducto = Convert.ToString(dr["Id Producto"]);
                String codTalle = Convert.ToString(dr["Talle"]);
                String color = Convert.ToString(dr["Color"]);
                int cantitad = Convert.ToInt32(dr["Cantidad"]);
                decimal precioUn = Convert.ToDecimal(dr["Precio Unitario"]);
                String precioUnConPunto = Convert.ToString(precioUn).Replace(',', '.');

                if (nDF.insertarDetalles(codProducto, codTalle, color, precioUnConPunto, cantitad) == true && agrego != false)
                {
                    agrego = true;
                }
                else
                {
                    agrego = false;
                }
            }
            return agrego;
        }

    }
}