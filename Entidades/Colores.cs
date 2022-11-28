using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Colores
    {
        private String codColor_Co;
        private String descripcion_Co;
        public Colores()
        {

        }
        public Colores(string codColor_Co, string descripcion_Co)
        {
            this.CodColor_Co = codColor_Co;
            this.Descripcion_Co = descripcion_Co;
        }

        public string CodColor_Co { get => codColor_Co; set => codColor_Co = value; }
        public string Descripcion_Co { get => descripcion_Co; set => descripcion_Co = value; }
    }

}
