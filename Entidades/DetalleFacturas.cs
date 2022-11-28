using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class DetalleFacturas
    {
        private Facturas factura_Df = new Facturas();
        private Productos producto_Df = new Productos();
        private Talles talle_Df = new Talles();
        private Colores color_Df = new Colores();
        private decimal precioUnitario_Df;
        private int cantidad_Df;

        public DetalleFacturas()
        {

        }

        public DetalleFacturas(Facturas factura_Df, Productos producto_Df, Talles talle_Df, Colores color_Df, decimal precioUnitario_Df, int cantidad_Df)
        {
            this.Factura_Df = factura_Df;
            this.Producto_Df = producto_Df;
            this.Talle_Df = talle_Df;
            this.Color_Df = color_Df;
            this.PrecioUnitario_Df = precioUnitario_Df;
            this.Cantidad_Df = cantidad_Df;
        }

        public Facturas Factura_Df { get => factura_Df; set => factura_Df = value; }
        public Productos Producto_Df { get => producto_Df; set => producto_Df = value; }
        public Talles Talle_Df { get => talle_Df; set => talle_Df = value; }
        public Colores Color_Df { get => color_Df; set => color_Df = value; }
        public decimal PrecioUnitario_Df { get => precioUnitario_Df; set => precioUnitario_Df = value; }
        public int Cantidad_Df { get => cantidad_Df; set => cantidad_Df = value; }
    }
}
