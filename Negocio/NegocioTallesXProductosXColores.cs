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
    public class NegocioTallesXProductosXColores
    {
        DAOTallesXProductosXColores dtxpxc = new DAOTallesXProductosXColores();

        public DataTable getTabla(String consulta)
        {
            return dtxpxc.getTabla(consulta);
        }

        public int getCantidad(String id, String talle, String color)
        {
            DataTable tabla = dtxpxc.getCantidad(id, talle, color);
            return Convert.ToInt32(tabla.Rows[0][0]);
            
        }
        public bool agregarStock(String codProducto, String codTalle, String codColor, int cantidad)
        {
            int cantFilas = 0;

            TallesXProductosXColores TXPCX = new TallesXProductosXColores();
            TXPCX.Producto_TXPXC.CodProducto_Pr = codProducto;
            TXPCX.Talle_TXPXC.CodTalle_Ta = codTalle;
            TXPCX.Color_TXPXC.CodColor_Co = codColor;
            TXPCX.Stock_TXPXC = cantidad;
            
            if (dtxpxc.existeTalleXProductoXColor(TXPCX) == false)
            {
                cantFilas = dtxpxc.agregarStock(TXPCX);
            }
            else
            {
                cantFilas = dtxpxc.actualizarStock(TXPCX);

            }

            if (cantFilas == 1)
                return true;
            else
                return false;
        }

        public bool existeStock(TallesXProductosXColores p)
        {
            bool existe = dtxpxc.existeStock(p);

            if (existe)
                return true;
            else
                return false;
        }
    }
}

