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
    public partial class AdminProducto : System.Web.UI.Page
    {
        NegocioProducto nsP = new NegocioProducto();
        NegocioCategoria nsC = new NegocioCategoria();
        NegocioMarca nsM = new NegocioMarca();
        NegocioTalle nsT = new NegocioTalle();
        NegocioColor nsCo = new NegocioColor();
        NegocioTallesXProductosXColores nsTXPXC = new NegocioTallesXProductosXColores();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarTablaProductosTODO();
                cargarCategorias();
                cargarMarcas();
                cargarDDLStock();
            }
        }

        void cargarTablaProductosTODO()
        {
            DataTable tablaProductos = nsP.getTabla("SELECT * FROM Productos");
            grvProductos.DataSource = tablaProductos;
            grvProductos.DataBind();
        }

        void cargarCategorias()
        {
            DataTable tablaCategorias = nsC.getTabla("SELECT * FROM Categorias");
            ddlCategorias.DataSource = tablaCategorias;
            ddlCategorias.DataTextField = "Descripcion_Ca";
            ddlCategorias.DataValueField = "CodCategoria_Ca";
            ddlCategorias.DataBind();
        }

        void cargarMarcas()
        {
            DataTable tablaMarcas = nsM.getTabla("SELECT * FROM Marcas");
            ddlMarcas.DataSource = tablaMarcas;
            ddlMarcas.DataTextField = "Descripcion_Ma";
            ddlMarcas.DataValueField = "CodMarca_Ma";
            ddlMarcas.DataBind();
        }
        void cargarDDLStock()
        {

            DataTable tablaProductos = nsP.getTabla("SELECT * FROM Productos WHERE Estado_Pr = 1");
            ddlCodigoProducto.DataSource = tablaProductos;
            ddlCodigoProducto.DataTextField = "CodProducto_Pr";
            ddlCodigoProducto.DataValueField = "CodProducto_Pr";
            ddlCodigoProducto.DataBind();


            DataTable tablaTalles = nsT.getTabla("SELECT * FROM Talles");
            ddlTalleProducto.DataSource = tablaTalles;
            ddlTalleProducto.DataTextField = "Descripcion_Ta";
            ddlTalleProducto.DataValueField = "CodTalle_Ta";
            ddlTalleProducto.DataBind();

            DataTable tablaColores = nsCo.getTabla("SELECT * FROM Colores");
            ddlColorProducto.DataSource = tablaColores;
            ddlColorProducto.DataTextField = "Descripcion_Co";
            ddlColorProducto.DataValueField = "CodColor_Co";
            ddlColorProducto.DataBind();
        }

        protected void btnIngresarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                if (nsP.existeProducto(txtCodProd.Text))
                {
                    throw new Exception("Ya existe este producto!");
                }
                bool agrego = nsP.agregarProducto(txtCodProd.Text,txtNombre.Text, txtDescripcion.Text, ddlCategorias.SelectedValue, ddlMarcas.SelectedValue, txtUrl.Text, Convert.ToDecimal(txtPrecioUnitario.Text));
                if (agrego)
                {
                    lblMensajeProd.ForeColor = System.Drawing.Color.Green;
                    lblMensajeProd.Text = "Producto agregado con éxito!";
                }
                else
                {
                    lblMensajeProd.ForeColor = System.Drawing.Color.Red;
                    lblMensajeProd.Text = "No se pudo agregar el producto";
                }
            }
            catch(Exception ex)
            {
                lblMensajeProd.ForeColor = System.Drawing.Color.Red;
                lblMensajeProd.Text = ex.Message;
            }

            limpiarCampos();
            cargarTablaProductosTODO();
            cargarDDLStock();
        }

        protected void btnIngresarStock_Click(object sender, EventArgs e)
        {
            bool agrego = nsTXPXC.agregarStock(ddlCodigoProducto.SelectedValue, ddlTalleProducto.SelectedValue, ddlColorProducto.SelectedValue, Convert.ToInt32(txtStockProducto.Text));
            if (agrego)
            {
                lblMensajeStock.ForeColor = System.Drawing.Color.Green;
                lblMensajeStock.Text = "Stock agregado con éxito!";
            }
            else
            {
                lblMensajeStock.ForeColor= System.Drawing.Color.Red;
                lblMensajeStock.Text = "No se pudo agregar el stock";
            }

            limpiarCampos();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            DataTable tablaProductos = nsP.getTabla($"SELECT * FROM Productos WHERE {ddlFiltro.SelectedValue} LIKE '%{txtFiltro.Text}%'");
            grvProductos.DataSource = tablaProductos;
            grvProductos.DataBind();
        }

        protected void btnFiltro_Click(object sender, EventArgs e)
        {
            cargarTablaProductosTODO();
            limpiarCampos();
        }

        protected void grvProductos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            String s_CodProducto = ((Label)grvProductos.Rows[e.RowIndex].FindControl("eit_lbl_CodProducto")).Text;
            String s_CodMarca = ((Label)grvProductos.Rows[e.RowIndex].FindControl("eit_lbl_CodMarca")).Text;
            String s_CodCategoria = ((Label)grvProductos.Rows[e.RowIndex].FindControl("eit_lbl_CodCategoria")).Text;
            String s_Nombre = ((TextBox)grvProductos.Rows[e.RowIndex].FindControl("eit_txt_Nombre")).Text;
            String s_Descripcion = ((TextBox)grvProductos.Rows[e.RowIndex].FindControl("eit_txt_Descripcion")).Text;
            String s_UrlImagen = ((TextBox)grvProductos.Rows[e.RowIndex].FindControl("eit_txt_UrlImagen")).Text;
            String s_PrecioUnidad = ((TextBox)grvProductos.Rows[e.RowIndex].FindControl("eit_txt_Precio")).Text;
            String s_Estado = ((CheckBox)grvProductos.Rows[e.RowIndex].FindControl("eit_chk_Estado")).Checked.ToString();

            try
            {
                Productos producto = new Productos();
                producto.CodProducto_Pr = s_CodProducto;
                producto.Marca_Pr.CodMarca_Ma = s_CodMarca;
                producto.Categoria_Pr.CodCategoria_Ca = s_CodCategoria;
                producto.Nombre_Pr = s_Nombre;
                producto.Descripcion_Pr = s_Descripcion;
                if(s_UrlImagen=="")
                    producto.UrlImagen_Pr= "Imagenes\\default.jpg";
                else
                    producto.UrlImagen_Pr = s_UrlImagen;
                producto.PrecioUnitario_Pr = Convert.ToDecimal(s_PrecioUnidad);
                producto.Estado_Pr = Convert.ToBoolean(s_Estado);

                if (s_Nombre == "" || s_Descripcion == "" || s_PrecioUnidad == "")
                    throw new Exception("Completar Campos");

                bool actualizo = nsP.actualizarProducto(producto);

                grvProductos.EditIndex = -1;

                cargarTablaProductosTODO();

                if (actualizo == true)
                {
                    lblMensajeGrid.ForeColor = System.Drawing.Color.Green;
                    lblMensajeGrid.Text = "El producto se actualizó con éxito!";
                }
                else
                {
                    lblMensajeGrid.ForeColor=System.Drawing.Color.Red;
                    lblMensajeGrid.Text = "No se pudo actualizar el producto";
                }
            }
            catch (Exception ex)
            {
                lblMensajeGrid.ForeColor = System.Drawing.Color.Red;
                lblMensajeGrid.Text = ex.Message;
            }
            cargarTablaProductosTODO();
            cargarDDLStock();
        }

        protected void grvProductos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            lblMensajeGrid.Text = "";
            grvProductos.EditIndex = -1;
            cargarTablaProductosTODO();
        }

        protected void grvProductos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            String s_CodProducto = ((Label)grvProductos.Rows[e.RowIndex].FindControl("it_lbl_CodProducto")).Text;

            Productos producto = new Productos();
            producto.CodProducto_Pr = s_CodProducto;

            bool elimino=nsP.eliminarProducto(producto);

            cargarTablaProductosTODO();

            if(elimino == true)
            {
                lblMensajeGrid.ForeColor = System.Drawing.Color.Green;
                lblMensajeGrid.Text = "El producto se eliminó con éxito";
            }
            else
            {
                lblMensajeGrid.ForeColor = System.Drawing.Color.Red;
                lblMensajeGrid.Text = "No se pudo eliminar el producto";
            }
            cargarTablaProductosTODO();
            cargarDDLStock();
        }

        protected void grvProductos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            lblMensajeGrid.Text = "";
            grvProductos.EditIndex = e.NewEditIndex;
            cargarTablaProductosTODO();
        }

        protected void grvProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            lblMensajeGrid.Text = "";
            grvProductos.PageIndex = e.NewPageIndex;
            cargarTablaProductosTODO();
        }

        void limpiarCampos()
        {
            txtCodProd.Text = "";
            txtDescripcion.Text = "";
            txtFiltro.Text = "";
            txtNombre.Text = "";
            txtPrecioUnitario.Text = "";
            txtStockProducto.Text = "";
            txtUrl.Text = "";
            lblMensajeGrid.Text = "";
        }

        protected void lbCerrarSesión_Click(object sender, EventArgs e)
        {
            Session["usuario"] = null;
            Response.Redirect("~/Inicio.aspx");
        }
    }
}