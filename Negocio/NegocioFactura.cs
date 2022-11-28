using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DAO;
using Entidades;
using System.Globalization;

namespace Negocio
{
    public class NegocioFactura
    {
        DAOFactura df = new DAOFactura();
        public DataTable getTabla(String consulta)
        {
            return df.getTabla(consulta);
        }

        public bool agregarFactura(String dni, String metodoPago, String metodoEnvio, String direccionEntrega, String tarjeta)
        {
            int cantFilas = 0;

            Facturas fac = new Facturas();
            fac.Usuario_Fa.Dni_Us = dni;
            fac.MetPago_Fa.CodMetPago_Pa = metodoPago;
            fac.MetEnvio_Fa.CodMetEnvio_En = metodoEnvio;
            fac.DireccionEntrega_Fa = direccionEntrega;
            fac.Tarjeta_Fa = tarjeta;
            if (metodoPago == "2")
            {
                fac.Pago_Fa = true;
            }
            else
                fac.Pago_Fa = false;
     
            cantFilas = df.agregarFactura(fac);
            

            if (cantFilas == 1)
                return true;
            else
                return false;
        }
        public decimal getTotalRecaudado(String consulta)
        {
            DataTable tabla = df.getTabla(consulta);
            decimal cantidad = 0;

            cantidad = Convert.ToDecimal(tabla.Rows[0]["Total Recaudado"] is DBNull ? 0 : tabla.Rows[0]["Total Recaudado"]);

            return cantidad;
        }

    }
}
