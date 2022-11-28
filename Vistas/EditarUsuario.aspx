<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="Vistas.EditarUsuario2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .auto-style10 {
            text-align: right;
            width: 725px;
        }
        .auto-style11 {
            text-align: right;
            height: 31px;
            width: 725px;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style15 {
            text-align: left;
            width: 763px;
        }
        .auto-style16 {
            text-align: left;
            height: 31px;
            width: 763px;
        }
        .auto-style17 {
            text-align: left;
            width: 202px;
        }
        .auto-style18 {
            text-align: left;
            height: 31px;
            width: 202px;
        }
        .auto-style19 {
            text-align: right;
            width: 725px;
            height: 33px;
        }
        .auto-style20 {
            text-align: left;
            width: 763px;
            height: 33px;
        }
        .auto-style21 {
            text-align: left;
            width: 202px;
            height: 33px;
        }
        .auto-style22 {
            text-align: right;
            width: 725px;
            height: 26px;
        }
        .auto-style23 {
            text-align: left;
            width: 763px;
            height: 26px;
        }
        .auto-style24 {
            text-align: left;
            width: 202px;
            height: 26px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style10">Nombre:</td>
            <td class="auto-style15"><asp:TextBox ID="txt_Nombre" runat="server" Width="250px" MaxLength="30"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txt_Nombre" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su Nombre</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="revNombre" runat="server" ControlToValidate="txt_Nombre" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="1">Solo se Permiten Letras</asp:RegularExpressionValidator>
                
            </td>
            <td class="auto-style17">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">Apellido:</td>
            <td class="auto-style16"><asp:TextBox ID="txt_Apellido" runat="server" Width="250px" MaxLength="30"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txt_Apellido" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su Apellido</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="revApellido" runat="server" ControlToValidate="txt_Apellido" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="1">Solo se Permiten Letras</asp:RegularExpressionValidator>
                
                </td>
            <td class="auto-style18">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">Fecha de Nacimiento:</td>
            <td class="auto-style16"><asp:TextBox ID="txt_FechaNac"  runat="server" type="date" Width="250px" TextMode="Date"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvFechaNac" runat="server" ControlToValidate="txt_FechaNac" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su Fecha de Nacimiento</asp:RequiredFieldValidator>
                
            &nbsp;</td>
            <td class="auto-style18">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">DNI:</td>
            <td class="auto-style16">&nbsp;&nbsp;
                <asp:Label ID="lblDni" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Solicitar cambio de DNI:&nbsp;&nbsp;
                <asp:Button ID="btnSolicitarCambio" runat="server" Text="Solicitar cambio" OnClick="btnSolicitarCambio_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMensajeDni" runat="server"></asp:Label>
                
                </td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td class="auto-style11">Telefono:</td>
            <td class="auto-style16"><asp:TextBox ID="txt_Telefono" runat="server" Width="250px" MaxLength="10"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txt_Telefono" ForeColor="Red" ValidationGroup="1">Debe Ingresar Su N° de Telefono</asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txt_Telefono" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="1">Solo se Permiten Números</asp:RegularExpressionValidator>
                
                </td>
            <td class="auto-style18">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style19">Email:</td>
            <td class="auto-style20"><asp:TextBox ID="txt_Email" runat="server" Width="250px" MaxLength="60"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txt_Email" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe ingresar Su Email</asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txt_Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="1" ValidationGroup="1">Formato Incorrecto</asp:RegularExpressionValidator>
                
                </td>
            <td class="auto-style21"></td>
        </tr>
        <tr>
            <td class="auto-style22">Domicilio:</td>
            <td class="auto-style23"><asp:TextBox ID="txt_Domicilio" runat="server" Width="250px" MaxLength="40"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDomicilio" runat="server" ControlToValidate="txt_Domicilio" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe Ingresar Su Domicilio</asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style24"></td>
        </tr>
        <tr>
            <td class="auto-style11">Codigo Postal:</td>
            <td class="auto-style16"><asp:TextBox ID="txt_CodigoPostal" runat="server" Width="250px" MaxLength="4"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCodigoPostal" runat="server" ControlToValidate="txt_CodigoPostal" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe ingresar su Codigo Postal</asp:RequiredFieldValidator>
                    &nbsp;
                    <asp:RegularExpressionValidator ID="reCodigoPostal" runat="server" ControlToValidate="txt_CodigoPostal" ForeColor="Red" ValidationExpression="^\d{4}$" ErrorMessage="1" ValidationGroup="1">Código postal inválido!</asp:RegularExpressionValidator>
                    </td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td class="auto-style11">Usuario:</td>
            <td class="auto-style16"><asp:TextBox ID="txt_Usuario" runat="server" Width="250px" MaxLength="30"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txt_Usuario" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe ingresar su Nombre de usuario</asp:RequiredFieldValidator>
                
                    </td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td class="auto-style11">Contraseña:</td>
            <td class="auto-style16"><asp:TextBox ID="txt_Contraseña" runat="server" Width="250px" MaxLength="30" TextMode="Password"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvContraseña" runat="server" ControlToValidate="txt_Contraseña" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe Ingresar una Contraseña</asp:RequiredFieldValidator>
                    </td>
            <td class="auto-style18">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style11">Repetir Contraseña:</td>
            <td class="auto-style16"><asp:TextBox ID="txt_RepetirContraseña" runat="server" Width="250px" MaxLength="30" TextMode="Password"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="rfvRepetir" runat="server" ControlToValidate="txt_RepetirContraseña" ForeColor="Red" ErrorMessage="1" ValidationGroup="1">Debe Ingresar una Contraseña</asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;
                <asp:CompareValidator ID="cvRepetir" runat="server" ControlToCompare="txt_Contraseña" ControlToValidate="txt_RepetirContraseña" ForeColor="Red" ValidationGroup="1">Las Contraseñas No Coinciden</asp:CompareValidator>
                
                    </td>
            <td class="auto-style18"></td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="3">
                <asp:Button ID="btnEditar" runat="server" Text="Editar Usuario" PostBackUrl="~/EditarUsuario.aspx" OnClientClick="return validate();" OnClick="btnEditar_Click" ValidationGroup="1" />
                <script type="text/javascript" language="javascript" >
                     function validate() {
                        if (Page_ClientValidate())
                            return confirm('¿Está seguro de que quiere editar la cuenta?');
                     }
                </script>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblLeyenda" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
