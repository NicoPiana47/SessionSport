using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Facturas
    {
        private int nroFactura_Fa;
        private Usuarios usuario_Fa = new Usuarios();
        private MetodosEnvio metEnvio_Fa = new MetodosEnvio();
        private MetodosPago metPago_Fa = new MetodosPago();
        private DateTime fecha_Fa;
        private String direccionEntrega_Fa;
        private String tarjeta_Fa;
        private bool pago_Fa;
        private decimal total_Fa;
        public Facturas()
        {

        }

        public Facturas(int nroFactura_Fa, Usuarios usuario_Fa, MetodosEnvio metEnvio_Fa, MetodosPago metPago_Fa, DateTime fecha_Fa, string direccionEntrega_Fa, string tarjeta_Fa, bool pago_Fa, decimal total_Fa)
        {
            this.NroFactura_Fa = nroFactura_Fa;
            this.Usuario_Fa = usuario_Fa;
            this.MetEnvio_Fa = metEnvio_Fa;
            this.MetPago_Fa = metPago_Fa;
            this.Fecha_Fa = fecha_Fa;
            this.DireccionEntrega_Fa = direccionEntrega_Fa;
            this.Tarjeta_Fa = tarjeta_Fa;
            this.Pago_Fa = pago_Fa;
            this.Total_Fa = total_Fa;
        }

        public int NroFactura_Fa { get => nroFactura_Fa; set => nroFactura_Fa = value; }
        public Usuarios Usuario_Fa { get => usuario_Fa; set => usuario_Fa = value; }
        public MetodosEnvio MetEnvio_Fa { get => metEnvio_Fa; set => metEnvio_Fa = value; }
        public MetodosPago MetPago_Fa { get => metPago_Fa; set => metPago_Fa = value; }
        public DateTime Fecha_Fa { get => fecha_Fa; set => fecha_Fa = value; }
        public string DireccionEntrega_Fa { get => direccionEntrega_Fa; set => direccionEntrega_Fa = value; }
        public string Tarjeta_Fa { get => tarjeta_Fa; set => tarjeta_Fa = value; }
        public bool Pago_Fa { get => pago_Fa; set => pago_Fa = value; }
        public decimal Total_Fa { get => total_Fa; set => total_Fa = value; }
    }
}
