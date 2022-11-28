using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Talles
    {
        private String codTalle_Ta;
        private String descripcion_Ta;
        public Talles()
        {
        }

        public Talles(string codTalle_Ta, string descripcion_Ta)
        {
            this.CodTalle_Ta = codTalle_Ta;
            this.Descripcion_Ta = descripcion_Ta;
        }

        public string CodTalle_Ta { get => codTalle_Ta; set => codTalle_Ta = value; }
        public string Descripcion_Ta { get => descripcion_Ta; set => descripcion_Ta = value; }
    }
}
