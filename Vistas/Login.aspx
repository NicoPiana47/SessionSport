<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Vistas.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 50%;
            margin:auto;
            
        }
        .auto-style9 {
            margin:auto;
            text-align: center;
            width: 415px;
        }
        .auto-style10 {
            width: 415px;
            text-align: center;
            height: 26px;
        }
        .auto-style11 {
            height: 26px;
        }
      
    </style>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:5%;">
        <div class="Form Login">
            <h3 style="text-align:center;">
                LOGIN
            </h3>
            <div class="Inputs">
                <asp:TextBox   class="Style_Input I1" ID="txt_Usuario" placeholder="Usuario" runat="server"></asp:TextBox>
                


            </div>
                <asp:RequiredFieldValidator  style="margin-left:40%;" ID="revUsuario" runat="server" ControlToValidate="txt_Usuario" ForeColor="Red" ValidationGroup="1">Ingrese su Usuario </asp:RequiredFieldValidator>
             <div class="Inputs">
                <asp:TextBox class="Style_Input I1" ID="txt_Contraseña" placeholder="Contraseña" runat="server" TextMode="Password"></asp:TextBox>
                

            </div>
    <asp:RequiredFieldValidator ID="RFV_Contraseña" style="margin-left:40%;" runat="server" ControlToValidate="txt_Contraseña" CssClass="auto-style12" ForeColor="Red" ValidationGroup="1">Ingrese su Contraseña</asp:RequiredFieldValidator>
                
             <div class="Inputs">
            <asp:Button runat="server"  class="Style_Input I2" Text="Iniciar Sesión" ID="btn_InicioSesion" ValidationGroup="1" OnClick="btn_InicioSesion_Click" />

    </div>
    <div style="text-align:center;margin-top:10px;" >
        <asp:LinkButton runat="server">Reestablecer Contraseña</asp:LinkButton>
    </div>
             
            </div>
    </div>

            
   
            
    
  
    <table  class="auto-style8">
        <tr>
            <td style="text-align:center;" class="auto-style4">
               
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center;">
                
            </td>
        </tr>
    </table>
</asp:Content>
