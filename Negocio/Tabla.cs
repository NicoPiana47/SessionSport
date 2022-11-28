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
    public class Tabla
    {
        public DataTable crearTabla()
        {
            DataTable dt = new DataTable();
            DataColumn columna = new DataColumn("Id Producto", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Producto", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Talle", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            //columna = new DataColumn("Codigo Color", System.Type.GetType("System.String"));
            //dt.Columns.Add();

            columna = new DataColumn("Color", System.Type.GetType("System.String"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Cantidad", System.Type.GetType("System.Int32"));
            dt.Columns.Add(columna);

            columna = new DataColumn("Precio Unitario", System.Type.GetType("System.Decimal"));
            dt.Columns.Add(columna);

            return dt;
        }

        public void agregarFila(DataTable dt, String id, String nombre, String talle, String color, String cantidad, String precioUnitario)
        {
            DataRow dr = dt.NewRow();
            dr["Id Producto"] = id;
            dr["Producto"] = nombre;
            dr["Talle"] = talle;
            dr["Color"] = color;
            //dr["Codigo Color"] = codColor;
            dr["Cantidad"] = cantidad;
            dr["Precio Unitario"] = precioUnitario;
            dt.Rows.Add(dr);
        }

        public bool noRepetir(String CodProducto, String CodColor, String CodTalle, DataTable tabla)
        {
            foreach (DataRow dr in tabla.Rows)
            {
                if (Convert.ToString(dr["Id Producto"]) == CodProducto && Convert.ToString(dr["Color"]) == CodColor && Convert.ToString(dr["Talle"]) == CodTalle)
                {
                    return true;
                }
            }
            return false;
        }
    }
}
