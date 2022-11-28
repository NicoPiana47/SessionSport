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
    public class DAOFactura
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("Facturas", consulta);
            return tabla;
        }

        public int agregarFactura(Facturas fac)
        {            
            int cantFilas = cn.ejecutarTransaccion("INSERT INTO Facturas (DNI_Fa, CodMetEnvio_Fa, CodMetPago_Fa, Fecha_Fa, DireccionEntrega_Fa, Tarjeta_Fa, Pago_Fa)" +
                " SELECT '" + fac.Usuario_Fa.Dni_Us+ "','" +fac.MetEnvio_Fa.CodMetEnvio_En+ "','" +fac.MetPago_Fa.CodMetPago_Pa+ "',GETDATE(),'" +fac.DireccionEntrega_Fa + "','"+fac.Tarjeta_Fa+"','"+fac.Pago_Fa+"'");
            return cantFilas;
        }
    }
}
