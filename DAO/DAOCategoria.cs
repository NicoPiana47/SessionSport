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
    public class DAOCategoria
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("Categorias", consulta);
            return tabla;
        }
    }
}
