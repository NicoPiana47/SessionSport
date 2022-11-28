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
    public class NegocioMarca
    {
        DAOMarca dm = new DAOMarca();
        public DataTable getTabla(String consulta)
        {
            return dm.getTabla(consulta);
        }
    }
}

