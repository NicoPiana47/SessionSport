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
    public class DAOTalle
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("Talles", consulta);
            return tabla;
        }
    }
}
