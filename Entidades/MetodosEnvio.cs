using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{

    public class MetodosEnvio
    { 
        private String codMetEnvio_En;
        private String descripcion_En;

        public MetodosEnvio()
        {

        }
        public MetodosEnvio(string codMetEnvio_En, string descripcion_En)
        {
            this.CodMetEnvio_En = codMetEnvio_En;
            this.Descripcion_En = descripcion_En;
        }

        public string CodMetEnvio_En { get => codMetEnvio_En; set => codMetEnvio_En = value; }
        public string Descripcion_En { get => descripcion_En; set => descripcion_En = value; }
    }

}
