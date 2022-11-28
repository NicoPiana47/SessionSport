using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Productos
    {
        private String codProducto_Pr;
        private Marcas marca_Pr = new Marcas();
        private Categorias categoria_Pr = new Categorias();
        private String descripcion_Pr;
        private String nombre_Pr;
        private String urlImagen_Pr;
        private decimal precioUnitario_Pr;
        private bool estado_Pr;
        public Productos()
        {

        }

        public Productos(string codProducto_Pr, Marcas marca_Pr, Categorias categoria_Pr, string descripcion_Pr, string nombre_Pr, string urlImagen_Pr, decimal precioUnitario_Pr, bool estado_Pr)
        {
            this.CodProducto_Pr = codProducto_Pr;
            this.Marca_Pr = marca_Pr;
            this.Categoria_Pr = categoria_Pr;
            this.Descripcion_Pr = descripcion_Pr;
            this.Nombre_Pr = nombre_Pr;
            this.UrlImagen_Pr = urlImagen_Pr;
            this.PrecioUnitario_Pr = precioUnitario_Pr;
            this.Estado_Pr = estado_Pr;
        }

        public string CodProducto_Pr { get => codProducto_Pr; set => codProducto_Pr = value; }
        public Marcas Marca_Pr { get => marca_Pr; set => marca_Pr = value; }
        public Categorias Categoria_Pr { get => categoria_Pr; set => categoria_Pr = value; }
        public string Descripcion_Pr { get => descripcion_Pr; set => descripcion_Pr = value; }
        public string Nombre_Pr { get => nombre_Pr; set => nombre_Pr = value; }
        public string UrlImagen_Pr { get => urlImagen_Pr; set => urlImagen_Pr = value; }
        public decimal PrecioUnitario_Pr { get => precioUnitario_Pr; set => precioUnitario_Pr = value; }
        public bool Estado_Pr { get => estado_Pr; set => estado_Pr = value; }
    }
}
