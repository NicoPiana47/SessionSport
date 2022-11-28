using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class TallesXProductosXColores
    {
        private Productos producto_TXPXC = new Productos();
        private Talles talle_TXPXC = new Talles();
        private Colores color_TXPXC = new Colores();
        private int stock_TXPXC;
        public TallesXProductosXColores()
        {

        }

        public TallesXProductosXColores(Productos producto_TXPXC, Talles talle_TXPXC, Colores color_TXPXC, int stock_TXPXC)
        {
            this.Producto_TXPXC = producto_TXPXC;
            this.Talle_TXPXC = talle_TXPXC;
            this.Color_TXPXC = color_TXPXC;
            this.Stock_TXPXC = stock_TXPXC;
        }

        public Productos Producto_TXPXC { get => producto_TXPXC; set => producto_TXPXC = value; }
        public Talles Talle_TXPXC { get => talle_TXPXC; set => talle_TXPXC = value; }
        public Colores Color_TXPXC { get => color_TXPXC; set => color_TXPXC = value; }
        public int Stock_TXPXC { get => stock_TXPXC; set => stock_TXPXC = value; }
    }
}
