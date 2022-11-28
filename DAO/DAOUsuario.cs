using System.Data;
using System.Data.SqlClient;
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace DAO
{
    public class DAOUsuario
    {
        AccesoDatos cn = new AccesoDatos();
        public Usuarios getUsuarios(Usuarios usu)
        {
            DataTable tabla = cn.ObtenerTabla("Usuarios", "SELECT DNI_Us, Usuario_Us, Contraseña_Us, Email_Us, Domicilio_Us, CodigoPostal_Us, Telefono_Us, Nombre_Us, Apellido_Us, FechaNac_Us, Estado_Us, Tipo_Us FROM USUARIOS  WHERE Usuario_Us = '" + usu.Usuario_Us + "'");

            usu.Dni_Us = tabla.Rows[0][0].ToString();
            usu.Usuario_Us = tabla.Rows[0][1].ToString();
            usu.Contraseña_Us = tabla.Rows[0][2].ToString();
            usu.Email_Us = tabla.Rows[0][3].ToString();
            usu.Domicilio_Us = tabla.Rows[0][4].ToString();
            usu.CodigoPostal_Us = tabla.Rows[0][5].ToString();
            usu.Telefono_Us = tabla.Rows[0][6].ToString();
            usu.Nombre_Us = tabla.Rows[0][7].ToString();
            usu.Apellido_Us = tabla.Rows[0][8].ToString();
            usu.FechaNac_Us = Convert.ToDateTime(tabla.Rows[0][9].ToString());
            usu.Estado_Us = Convert.ToBoolean(tabla.Rows[0][10].ToString());
            usu.Tipo_Us = Convert.ToInt32(tabla.Rows[0][11].ToString());
            return usu;
        }
        public Boolean esAdmin(Usuarios Us)
        {
            String consulta = "Select * from Usuarios where Usuario_Us='" + Us.Usuario_Us + "'AND Tipo_Us = '2'";
            return cn.existe(consulta);
        }

        public DataTable getTabla(string consulta)
        {
            DataTable Tabla = cn.ObtenerTabla("Usuarios", consulta);
            return Tabla;
        }

        public Boolean existeMail(Usuarios Us)
        {
            String consulta = "Select * from Usuarios where Email_Us='" + Us.Email_Us + "'AND NOT DNI_Us = '" + Us.Dni_Us + "'";
            return cn.existe(consulta);
        }

        public Boolean existeDNI(Usuarios Us)
        {
            String consulta = "Select * from Usuarios where DNI_Us='" + Us.Dni_Us + "'";
            return cn.existe(consulta);
        }

        public Boolean existeUsuario(Entidades.Usuarios Us)
        {
            String consulta = "Select * from Usuarios where Usuario_Us='" + Us.Usuario_Us + "' AND NOT DNI_Us='" + Us.Dni_Us + "'";
            return cn.existe(consulta);
        }

        public Boolean estadoActivo(Usuarios Us)
        {
            String consulta = "Select * from Usuarios where Usuario_Us='" + Us.Usuario_Us + "' AND Estado_Us = '1'";
            return cn.existe(consulta);
        }

        public Boolean contraseñaCorrecta(Usuarios Us)
        {
            String consulta = "Select * from usuarios where Usuario_Us='" + Us.Usuario_Us + "' AND Contraseña_Us='" + Us.Contraseña_Us + "'";
            return cn.existe(consulta);
        }

        public int EliminarUsuario(Usuarios Us)
        {
            int cantFilas = cn.ejecutarTransaccion("UPDATE Usuarios SET Estado_Us = 0 WHERE DNI_Us = '" + Us.Dni_Us + "'");
            return cantFilas;
        }

        public int ActualizarUsuario(Usuarios Us)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosActualizar(ref cmd, Us);
            AccesoDatos cn = new AccesoDatos();
            int filasAfectadas = cn.EjecutarProcedimientoAlmacenado(cmd, "SPActualizarUsuario");
            if (filasAfectadas == 1) return 1;
            return 0;
        }

        public void armarParametrosActualizar(ref SqlCommand cmd, Usuarios Us)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@DNI", SqlDbType.Char, 10);
            parametros.Value = Us.Dni_Us;

            parametros = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 30);
            parametros.Value = Us.Usuario_Us;

            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 30);
            parametros.Value = Us.Contraseña_Us;

            parametros = cmd.Parameters.Add("@Email", SqlDbType.VarChar, 60);
            parametros.Value = Us.Email_Us;

            parametros = cmd.Parameters.Add("@Domicilio", SqlDbType.VarChar, 40);
            parametros.Value = Us.Domicilio_Us;

            parametros = cmd.Parameters.Add("@CodigoPostal", SqlDbType.Char, 4);
            parametros.Value = Us.CodigoPostal_Us;

            parametros = cmd.Parameters.Add("@Telefono", SqlDbType.Char, 10);
            parametros.Value = Us.Telefono_Us;

            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 30);
            parametros.Value = Us.Nombre_Us;

            parametros = cmd.Parameters.Add("@Apellido", SqlDbType.VarChar, 30);
            parametros.Value = Us.Apellido_Us;

            parametros = cmd.Parameters.Add("@FechaNac", SqlDbType.Date);
            parametros.Value = Us.FechaNac_Us;

            parametros = cmd.Parameters.Add("@Tipo", SqlDbType.Int);
            parametros.Value = Us.Tipo_Us;

            parametros = cmd.Parameters.Add("@Estado", SqlDbType.Bit);
            parametros.Value = Us.Estado_Us;
        }

        public int AgregarUsuario(Usuarios Us)
        {
            SqlCommand cmd = new SqlCommand();
            armarParametrosAgregar(ref cmd, Us);
            AccesoDatos cn = new AccesoDatos();
            int filasAfectadas = cn.EjecutarProcedimientoAlmacenado(cmd, "SPInsertarUsuario");
            if (filasAfectadas == 1) return 1;
            return 0;
        }

        public void armarParametrosAgregar(ref SqlCommand cmd, Usuarios Us)
        {
            SqlParameter parametros = new SqlParameter();
            parametros = cmd.Parameters.Add("@DNI", SqlDbType.Char, 10);
            parametros.Value = Us.Dni_Us;

            parametros = cmd.Parameters.Add("@Usuario", SqlDbType.VarChar, 30);
            parametros.Value = Us.Usuario_Us;

            parametros = cmd.Parameters.Add("@Contraseña", SqlDbType.VarChar, 30);
            parametros.Value = Us.Contraseña_Us;

            parametros = cmd.Parameters.Add("@Email", SqlDbType.VarChar, 60);
            parametros.Value = Us.Email_Us;

            parametros = cmd.Parameters.Add("@Domicilio", SqlDbType.VarChar, 40);
            parametros.Value = Us.Domicilio_Us;

            parametros = cmd.Parameters.Add("@CodigoPostal", SqlDbType.Char, 4);
            parametros.Value = Us.CodigoPostal_Us;

            parametros = cmd.Parameters.Add("@Telefono", SqlDbType.Char, 10);
            parametros.Value = Us.Telefono_Us;

            parametros = cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 30);
            parametros.Value = Us.Nombre_Us;

            parametros = cmd.Parameters.Add("@Apellido", SqlDbType.VarChar, 30);
            parametros.Value = Us.Apellido_Us;

            parametros = cmd.Parameters.Add("@FechaNac", SqlDbType.Date);
            parametros.Value = Us.FechaNac_Us;
        }
    }
}