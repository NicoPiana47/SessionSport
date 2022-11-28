using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;


namespace DAO
{
    public class DAOTallesXProductosXColores
    {
        AccesoDatos cn = new AccesoDatos();

        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("TallesXProductosXColores", consulta);
            return tabla;
        }

        public DataTable getCantidad(String id, String talle, String color)
        {
            return cn.ObtenerTabla("TallesXProductosXColores", "SELECT Stock_TXPXC FROM TallesXProductosXColores where CodProducto_TXPXC='" + id + "' AND CodTalle_TXPXC='" + talle + "' AND CodColor_TXPXC='" + color + "'");
        }
        public Boolean existeTalleXProductoXColor(TallesXProductosXColores txpxc)
        {
            String consulta = "Select * from TallesXProductosXColores where CodProducto_TXPXC='" + txpxc.Producto_TXPXC.CodProducto_Pr + "' AND CodTalle_TXPXC='" + txpxc.Talle_TXPXC.CodTalle_Ta + "' AND CodColor_TXPXC='" + txpxc.Color_TXPXC.CodColor_Co + "'";
            return cn.existe(consulta);
        }

        public Boolean existeStock(TallesXProductosXColores txpxc)
        {
            String consulta = "Select * from TallesXProductosXColores where CodProducto_TXPXC='" + txpxc.Producto_TXPXC.CodProducto_Pr + "'";
            return cn.existe(consulta);
        }

        public int agregarStock(TallesXProductosXColores txpxc)
        {
            int cantFilas=cn.ejecutarTransaccion("INSERT INTO TallesXProductosXColores VALUES ('" + txpxc.Producto_TXPXC.CodProducto_Pr + "','" + txpxc.Talle_TXPXC.CodTalle_Ta + "','" + txpxc.Color_TXPXC.CodColor_Co + "'," + txpxc.Stock_TXPXC + ")");
            return cantFilas;
        }

        public int actualizarStock(TallesXProductosXColores txpxc)
        {
            int cantFilas = cn.ejecutarTransaccion("UPDATE TallesXProductosXColores SET Stock_TXPXC = " + txpxc.Stock_TXPXC + " WHERE CodProducto_TXPXC='" + txpxc.Producto_TXPXC.CodProducto_Pr + "' AND CodTalle_TXPXC = '" + txpxc.Talle_TXPXC.CodTalle_Ta + "' AND CodColor_TXPXC = '" + txpxc.Color_TXPXC.CodColor_Co + "'");
            return cantFilas;
        }
    }
}
