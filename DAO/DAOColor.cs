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
    public class DAOColor
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("Colores", consulta);
            return tabla;
        }

    }
}
