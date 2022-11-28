using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Entidades;

namespace DAO
{
    public class DAOProducto
    {
        AccesoDatos cn = new AccesoDatos();
        public DataTable getTabla(String consulta)
        {
            DataTable tabla = cn.ObtenerTabla("Productos", consulta);
            return tabla;
        }

        public bool existeProducto(String Codprod)
        {
            String consulta = "Select * from Productos where CodProducto_Pr='" + Codprod + "'";
            return cn.existe(consulta);
        }



        public int agregarProducto(Productos producto)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosAgregar(ref comando, producto);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPInsertarProducto");
        }

        public int eliminarProducto(Productos prod)
        {
            int cantFilas = cn.ejecutarTransaccion("UPDATE Productos SET Estado_Pr = 0 WHERE CodProducto_Pr = '" + prod.CodProducto_Pr + "'");
            return cantFilas;
        }

        public int actualizarProducto(Productos prod)
        {
            SqlCommand comando = new SqlCommand();
            armarParametrosActualizar(ref comando, prod);
            return cn.EjecutarProcedimientoAlmacenado(comando, "SPActualizarProducto");
        }

        private void armarParametrosAgregar(ref SqlCommand cmd, Productos prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto", SqlDbType.Char);
            SqlParametros.Value = prod.CodProducto_Pr;
            SqlParametros = cmd.Parameters.Add("@CodMarca", SqlDbType.Char);
            SqlParametros.Value = prod.Marca_Pr.CodMarca_Ma;
            SqlParametros = cmd.Parameters.Add("@CodCategoria", SqlDbType.Char);
            SqlParametros.Value = prod.Categoria_Pr.CodCategoria_Ca;
            SqlParametros = cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = prod.Descripcion_Pr;
            SqlParametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = prod.Nombre_Pr;
            SqlParametros = cmd.Parameters.Add("@UrlImagen", SqlDbType.VarChar);
            SqlParametros.Value = prod.UrlImagen_Pr;
            SqlParametros = cmd.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = prod.PrecioUnitario_Pr;
        }

        private void armarParametrosActualizar(ref SqlCommand cmd, Productos prod)
        {
            SqlParameter SqlParametros = new SqlParameter();
            SqlParametros = cmd.Parameters.Add("@CodProducto", SqlDbType.Char);
            SqlParametros.Value = prod.CodProducto_Pr;
            SqlParametros = cmd.Parameters.Add("@CodMarca", SqlDbType.Char);
            SqlParametros.Value = prod.Marca_Pr.CodMarca_Ma;
            SqlParametros = cmd.Parameters.Add("@CodCategoria", SqlDbType.Char);
            SqlParametros.Value = prod.Categoria_Pr.CodCategoria_Ca;
            SqlParametros = cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar);
            SqlParametros.Value = prod.Descripcion_Pr;
            SqlParametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar);
            SqlParametros.Value = prod.Nombre_Pr;
            SqlParametros = cmd.Parameters.Add("@UrlImagen", SqlDbType.VarChar);
            SqlParametros.Value = prod.UrlImagen_Pr;
            SqlParametros = cmd.Parameters.Add("@PrecioUnitario", SqlDbType.Decimal);
            SqlParametros.Value = prod.PrecioUnitario_Pr;
            SqlParametros = cmd.Parameters.Add("@Estado", SqlDbType.Bit);
            SqlParametros.Value = prod.Estado_Pr;

        }
    }
}