using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace DAO
{
    public class DAODetallesFactura
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("DetalleFacturas", consulta);
            return tabla;
        }

        public int insertarDetalles(DetalleFacturas df, String precioUn)
        {
            int cantFilas = cn.ejecutarTransaccion("INSERT INTO DetalleFacturas VALUES ((SELECT MAX(NroFactura_Fa) FROM Facturas), '" + df.Producto_Df.CodProducto_Pr + "','" + df.Talle_Df.CodTalle_Ta + "',(SELECT CodColor_Co FROM Colores WHERE Descripcion_Co='" + df.Color_Df.Descripcion_Co + "')," + precioUn + "," + df.Cantidad_Df + ")");
            return cantFilas;
        }
    }
}
