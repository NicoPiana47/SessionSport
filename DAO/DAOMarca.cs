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
    public class DAOMarca
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("Marcas", consulta);
            return tabla;
        }
    }
}
