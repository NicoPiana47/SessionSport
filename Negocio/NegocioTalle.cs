﻿using System;
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
    public class NegocioTalle
    {
        DAOTalle dt = new DAOTalle();
        public DataTable getTabla(String consulta)
        {
            return dt.getTabla(consulta);
        }
    }
}
