 using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuarios
    {
        
        private String dni_Us;
        private String usuario_Us;
        private String contraseña_Us;
        private String email_Us;
        private String domicilio_Us;
        private String codigoPostal_Us;
        private String telefono_Us;
        private String nombre_Us;
        private String apellido_Us;
        private DateTime fechaNac_Us;
        private bool estado_Us;
        private int tipo_Us;
        public Usuarios()
        {
        }

        public Usuarios(string dni_Us, string usuario_Us, string contraseña_Us, string email_Us, string domicilio_Us, string codigoPostal_Us, string telefono_Us, string nombre_Us, string apellido_Us, DateTime fechaNac_Us, bool estado_Us, int tipo_Us)
        {
            this.Dni_Us = dni_Us;
            this.Usuario_Us = usuario_Us;
            this.Contraseña_Us = contraseña_Us;
            this.Email_Us = email_Us;
            this.Domicilio_Us = domicilio_Us;
            this.CodigoPostal_Us = codigoPostal_Us;
            this.Telefono_Us = telefono_Us;
            this.Nombre_Us = nombre_Us;
            this.Apellido_Us = apellido_Us;
            this.FechaNac_Us = fechaNac_Us;
            this.Estado_Us = estado_Us;
            this.Tipo_Us = tipo_Us;
        }

        public string Dni_Us { get => dni_Us; set => dni_Us = value; }
        public string Usuario_Us { get => usuario_Us; set => usuario_Us = value; }
        public string Contraseña_Us { get => contraseña_Us; set => contraseña_Us = value; }
        public string Email_Us { get => email_Us; set => email_Us = value; }
        public string Domicilio_Us { get => domicilio_Us; set => domicilio_Us = value; }
        public string CodigoPostal_Us { get => codigoPostal_Us; set => codigoPostal_Us = value; }
        public string Telefono_Us { get => telefono_Us; set => telefono_Us = value; }
        public string Nombre_Us { get => nombre_Us; set => nombre_Us = value; }
        public string Apellido_Us { get => apellido_Us; set => apellido_Us = value; }
        public DateTime FechaNac_Us { get => fechaNac_Us; set => fechaNac_Us = value; }
        public bool Estado_Us { get => estado_Us; set => estado_Us = value; }
        public int Tipo_Us { get => tipo_Us; set => tipo_Us = value; }
    }
}
