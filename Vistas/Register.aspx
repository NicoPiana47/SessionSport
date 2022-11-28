<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Vistas.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style type="text/css">
          .auto-style8{
               width: 62%;
            margin:auto;
          }
           .auto-style10 {
              height: 30px;
          }
          .auto-style11 {
        width: 42%;
        margin: auto;
              height: 105px;
          }
          .auto-style12 {
              width: 42%;
              margin: auto;
          }

          .Style_Input_Register{
              height:20px;
              border:none;
          }
          
          .Validator_Center{
              margin-left:40%;
}
          .center{
              margin-left:37%;
          }
          .Tittle_Form_Register{
              text-align:center;
           
          }
          .Bar{
              height:3px;
              background-color:lightgrey;
              width:40%;
              margin:auto;
          }
          </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="text-align:center">REGISTRARSE</h3>

    <div class="Form Register">
        <h3 class="Tittle_Form_Register">
            Datos Personales

        </h3>
        <div class="Bar"> </div>
        <div class="Inputs">
            <asp:TextBox ID="txt_Nombre" class="Style_Input_Register I1" runat="server" MaxLength="30" placeholder="Nombre"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvNombre" class="Validator_Center" runat="server" ControlToValidate="txt_Nombre" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su Nombre</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txt_Nombre" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="1">Solo se Permiten Letras</asp:RegularExpressionValidator>
        
        <div class="Inputs">
            <asp:TextBox ID="txt_Apellido" class="Style_Input_Register I1" runat="server" MaxLength="30" placeholder="Apellido"></asp:TextBox>
         </div>
        <asp:RequiredFieldValidator ID="rfvApellido" class="Validator_Center" runat="server" ControlToValidate="txt_Apellido" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su Apellido</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txt_Apellido" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="1">Solo se Permiten Letras</asp:RegularExpressionValidator>


        <div class="Inputs ">
            Fecha de nacimiento:<asp:TextBox ID="txt_FechaNac" runat="server" type="date"></asp:TextBox>
         </div>
        <asp:RequiredFieldValidator ID="rfvFechaNac" class="Validator_Center" runat="server" ControlToValidate="txt_FechaNac" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su Fecha de Nacimiento</asp:RequiredFieldValidator>
                

        <div class="Inputs">
        <asp:TextBox ID="txt_DNI" class="Style_Input_Register I1" runat="server" MaxLength="8" placeholder="DNI"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvDNI" runat="server"  class="Validator_Center" ControlToValidate="txt_DNI" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su DNI</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revDni" runat="server" ControlToValidate="txt_DNI" ForeColor="Red" ValidationExpression="^[\d]{1,3}\.?[\d]{3,3}\.?[\d]{3,3}$" ValidationGroup="1">DNI Inválido</asp:RegularExpressionValidator>
          
        <div class="Inputs ">
            <asp:TextBox ID="txt_Telefono" class="Style_Input_Register I1" runat="server" MaxLength="10" placeholder="Teléfono"></asp:TextBox>
        </div>
         <asp:RequiredFieldValidator ID="rfvTelefono"  class="Validator_Center" runat="server" ControlToValidate="txt_Telefono" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su N° de Telefono</asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txt_Telefono" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="1">Solo se Permiten Números</asp:RegularExpressionValidator>
                
        <div class="Inputs ">
        <asp:TextBox ID="txt_Email" runat="server" MaxLength="60" class="Style_Input_Register I1" placeholder="Email"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvEmail" class="Validator_Center" runat="server" ControlToValidate="txt_Email" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe ingresar Su Email</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txt_Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="1">Formato Incorrecto</asp:RegularExpressionValidator>

        
            
                <div class="Inputs ">
            <asp:TextBox ID="txt_Domicilio" runat="server" MaxLength="40" class="Style_Input_Register I1" placeholder="Domicilio"></asp:TextBox>
            </div>
         <asp:RequiredFieldValidator ID="rfvDomicilio" class="Validator_Center" runat="server" ControlToValidate="txt_Domicilio" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe Ingresar Su Domicilio</asp:RequiredFieldValidator>

            
                <div class="Inputs ">
       <asp:TextBox ID="txt_CodigoPostal" class="Style_Input_Register I1" runat="server" placeholder="Código Postal"></asp:TextBox>
         </div>
              
<asp:RequiredFieldValidator ID="rfvCodigoPostal"  class="Validator_Center" runat="server" ControlToValidate="txt_CodigoPostal" ForeColor="Red" ErrorMessage="1" ValidationGroup="1" Font-Size="Medium">Debe ingresar su Codigo Postal</asp:RequiredFieldValidator>
        <br />
         <asp:RegularExpressionValidator ID="reCodigoPostal"  class="Validator_Center"  runat="server" ControlToValidate="txt_CodigoPostal" ForeColor="Red" ValidationExpression="^\d{4}$" ErrorMessage="1" ValidationGroup="1" Font-Size="Medium">Código postal inválido!</asp:RegularExpressionValidator>
    

        <h3 class="Tittle_Form_Register">
            Datos de conexión
        </h3>
        <div class="Bar"> </div>
        <div class="Inputs">
            <asp:TextBox ID="txt_NombreUsuario" runat="server"  MaxLength="30" class="Style_Input_Register I1" placeholder="Usuario"></asp:TextBox>         
        </div>
     <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" class="Validator_Center"  ControlToValidate="txt_NombreUsuario" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe ingresar su Nombre de usuario</asp:RequiredFieldValidator>
    
    
        <div class="Inputs">
            <asp:TextBox ID="txt_Contraseña" runat="server" MaxLength="30" class="Style_Input_Register I1" TextMode="Password" placeholder="Contraseña"></asp:TextBox>
        </div>
         <asp:RequiredFieldValidator ID="rfvContraseña" class="Validator_Center" runat="server" ControlToValidate="txt_Contraseña" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe Ingresar una Contraseña</asp:RequiredFieldValidator>
    

        <div class="Inputs">
        <asp:TextBox ID="txt_Repetir" runat="server" MaxLength="30" class="Style_Input_Register I1" TextMode="Password" placeholder="Repetir Contraseña"></asp:TextBox>
            </div>
        <asp:RequiredFieldValidator ID="rfvRepetir" runat="server"  class="Validator_Center" ControlToValidate="txt_Repetir" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe Ingresar una Contraseña</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvRepetir" runat="server" ControlToCompare="txt_Contraseña" ControlToValidate="txt_Repetir" ForeColor="Red" ValidationGroup="1">Las Contraseñas No Coinciden</asp:CompareValidator>
             
        <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                 <div>
                     <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="5000" OnTick="Timer1_Tick">
                     </asp:Timer>
                 </div>
   
    <asp:Button ID="btn_CrearCuenta" runat="server" Text="Crear cuenta" class="Style_Input I2 center" OnClientClick="return validate();" OnClick="btn_CrearCuenta_Click" ValidationGroup="1" />
         <script type="text/javascript" language="javascript" >
             function validate() {
                 if (Page_ClientValidate())
                     return confirm('¿Está seguro de que quiere crear la cuenta?');
             }
        </script>
        <br /> 
        <asp:Label ID="lblLeyenda" class="Validator_Center" runat="server" ForeColor="Red"></asp:Label>

    </div>
    
</asp:Content>