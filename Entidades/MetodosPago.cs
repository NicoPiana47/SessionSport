using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class MetodosPago
    {
        private String codMetPago_Pa;
        private String descripcion_Pa;
        public MetodosPago()
        {

        }

        public MetodosPago(string codMetPago_Pa, string descripcion_Pa)
        {
            this.CodMetPago_Pa = codMetPago_Pa;
            this.Descripcion_Pa = descripcion_Pa;
        }

        public string CodMetPago_Pa { get => codMetPago_Pa; set => codMetPago_Pa = value; }
        public string Descripcion_Pa { get => descripcion_Pa; set => descripcion_Pa = value; }
    }
}
