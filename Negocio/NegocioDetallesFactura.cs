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
    public class NegocioDetallesFactura
    {
        DAODetallesFactura dDF = new DAODetallesFactura(); 
        public DataTable getTabla(String consulta)
        {
            return dDF.getTabla(consulta);
        }

        public bool insertarDetalles (String codProducto, String codTalle, String color, String precioUn, int cantidad)
        {
            DetalleFacturas df = new DetalleFacturas();

            df.Producto_Df.CodProducto_Pr = codProducto;
            df.Talle_Df.CodTalle_Ta = codTalle;
            df.Color_Df.Descripcion_Co = color;
            df.Cantidad_Df = cantidad;

            int cantfilas=dDF.insertarDetalles(df, precioUn);

            if (cantfilas >= 1)
                return true;
            else
                return false;
        }

        public int getTotalProductosVendidos(String consulta)
        {
            DataTable tabla=dDF.getTabla(consulta);
            int cantidad = 0;

            cantidad=Convert.ToInt32(tabla.Rows[0]["Total Productos Vendidos"] is DBNull ? 0 : tabla.Rows[0]["Total Productos Vendidos"]);

            return cantidad;
        }
    }
}
