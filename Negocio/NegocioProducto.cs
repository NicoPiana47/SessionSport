using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DAO;
using Entidades;

namespace Negocio
{
    public class NegocioProducto
    {
        DAOProducto dp = new DAOProducto();
        public DataTable getTabla(String consulta)
        {
            return dp.getTabla(consulta);
        }

        public bool existeProducto(String Codprod)
        {
            bool existe = dp.existeProducto(Codprod);
            if (existe)
                return true;
            else
                return false;
        }

        public bool agregarProducto(String codigoProd, String nombre, String descripcion, String codCategoria, String codMarca, String url, decimal precioUnitario)
        {
            int cantFilas = 0;

            Productos producto = new Productos();
            producto.CodProducto_Pr = codigoProd;
            producto.Nombre_Pr = nombre;
            producto.Descripcion_Pr = descripcion;
            producto.Categoria_Pr.CodCategoria_Ca = codCategoria;
            producto.Marca_Pr.CodMarca_Ma = codMarca;
            if (url == "")
                producto.UrlImagen_Pr = "Imagenes\\default.jpg";
            else
                producto.UrlImagen_Pr = url;
            producto.PrecioUnitario_Pr = precioUnitario;

            cantFilas = dp.agregarProducto(producto);


            if (cantFilas == 1)
                return true;
            else
                return false;
        }
        public bool eliminarProducto(Productos prod)
        {
            int cantFilas = 0;
            cantFilas = dp.eliminarProducto(prod);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool actualizarProducto(Productos prod)
        {
            int cantFilas = 0;
            cantFilas = dp.actualizarProducto(prod);

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public DataTable getFiltrosInicio(String categoria, String marca, String precioMin, String precioMax, String orden)
        {
            String consulta = "SELECT * FROM Productos WHERE Estado_Pr = 1";
            if (categoria != "")
            {
                consulta += " AND CodCategoria_Pr = '" + categoria + "'";

            }

            if (marca != "")
            {
                consulta += " AND CodMarca_Pr = '" + marca + "'";
            }

            if (precioMin != "")
            {

                consulta += " AND PrecioUnitario_Pr >= '" + precioMin + "'";

            }

            if (precioMax != "")
            {

                consulta += " AND PrecioUnitario_Pr <= '" + precioMax + "'";

            }

            if (orden != "0")
            {
                consulta += " ORDER BY " + orden;
            }

            return dp.getTabla(consulta);
        }
    }
}