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

    public class NegocioUsuario
    {
        DAOUsuario du = new DAOUsuario();
    
        public DataTable getTabla(string consulta)
        {
            return du.getTabla(consulta);
        }

        public bool EliminarUsuario(Usuarios Us)
        {
            int FilasAfectadas = du.EliminarUsuario(Us);
            if (FilasAfectadas == 1) return true;
            else return false;
        }

        public bool ActualizarUsuario(Usuarios Us)
        {
            int cantFilas = 0;

            cantFilas = du.ActualizarUsuario(Us);
            if (cantFilas == 1) return true;
            else return false;
        }

        public bool AgregarUsuario(Usuarios Us)
        {
            int cantFilas = 0;

            cantFilas = du.AgregarUsuario(Us);
            if (cantFilas == 1) return true;
            else return false;
        }

        public bool existeMail(Usuarios Us)
        {
            bool existe=du.existeMail(Us);
            if (existe)
                return true;
            else
                return false;
        }

        public bool existeDNI(Usuarios Us)
        {
            bool existe = du.existeDNI(Us);
            if (existe)
                return true;
            else
                return false;
        }

        public bool existeUsuario(Usuarios Us)
        {
            bool existe = du.existeUsuario(Us);
            if (existe)
                return true;
            else
                return false;
        }

        public bool estadoActivo(Usuarios Us)
        {
            bool existe = du.estadoActivo(Us);
            if (existe)
                return true;
            else
                return false;
        }

        public bool contraseñaCorrecta(Usuarios Us)
        {
            bool existe = du.contraseñaCorrecta(Us);
            if (existe)
                return true;
            else
                return false;
        }

        public Usuarios getUsuarios(String usuario)
        {
            Usuarios usu = new Usuarios();
            usu.Usuario_Us = usuario;
            return du.getUsuarios(usu);
        }

        public bool esAdmin(Usuarios usuario)
        {
            bool esAdmin = du.esAdmin(usuario);
            if (esAdmin)
                return true;
            else
                return false;
        }

        public String getContraseña(String consulta)
        {
            DataTable tabla = du.getTabla(consulta);

            String contraseña = Convert.ToString(tabla.Rows[0]["Contraseña"] is DBNull ? 0 : tabla.Rows[0]["Contraseña"]);

            return contraseña;
        }
    }
}
