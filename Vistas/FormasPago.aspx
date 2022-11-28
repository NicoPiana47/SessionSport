<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="FormasPago.aspx.cs" Inherits="Vistas.FormasPago" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style9 {
            text-decoration: underline;
        }
        .auto-style8 {
            margin-right: 18px;
        }
        .auto-style10 {
            width: 339px;
        }
        .auto-style11 {
            width: 82px;
        }
        .auto-style12 {
            width: 100%;
            height: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <strong>Formas de Envio</strong></p>
    <p>
        <asp:DropDownList ID="ddl_FormasEnvio" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_FormasEnvio_SelectedIndexChanged" ValidationGroup="Grupo0">
            <asp:ListItem>---Forma de Envio---</asp:ListItem>
            <asp:ListItem Value="1">Retiro en Sucursal</asp:ListItem>
            <asp:ListItem Value="2">A Domicilio</asp:ListItem>
        </asp:DropDownList>
        &nbsp;<asp:RequiredFieldValidator ID="rfv_FormaEnvio" runat="server" ControlToValidate="ddl_FormasEnvio" ForeColor="Red" InitialValue="---Forma de Envio---" ValidationGroup="Grupo0">Seleccionar Forma de Envio</asp:RequiredFieldValidator>
    </p>
    <asp:Panel ID="PanelFormaEnvio" runat="server">
        Direccion de Entrega:&nbsp;&nbsp;
        <asp:TextBox ID="txtDireccionEntrega" runat="server" MaxLength="40" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="rfvDireccionEntrega" runat="server" ControlToValidate="txtDireccionEntrega" ForeColor="Red" ValidationGroup="Grupo1">Ingresar Dirección</asp:RequiredFieldValidator>
        <br />
        Ciudad:&nbsp;&nbsp;
        <asp:TextBox ID="txtCiudad" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfvCiudad" runat="server" ControlToValidate="txtCiudad" ForeColor="Red" ValidationGroup="Grupo1">Ingresar Ciudad</asp:RequiredFieldValidator>
        <br />
        Provincia:&nbsp;&nbsp;
        <asp:TextBox ID="txtProvincia" runat="server" ValidationGroup="Grupo1"></asp:TextBox>
        &nbsp;
        <asp:RequiredFieldValidator ID="rfvProvincia" runat="server" ControlToValidate="txtProvincia" ForeColor="Red" ValidationGroup="Grupo1">Ingresar Provincia</asp:RequiredFieldValidator>
    </asp:Panel>
    <br />
    <table class="auto-style12">
        <tr>
            <td class="auto-style10">
                <br />
                <br />
        <strong __designer:mapid="77">Formas de Pago</strong><br __designer:mapid="78" />
        <asp:Button ID="btnTarjeta" runat="server" Text="Tarjeta" CssClass="auto-style8" OnClick="btnTarjeta_Click" Width="109px" ValidationGroup="Grupo0" />
        <br __designer:mapid="7a" />
        <asp:Button ID="btnEfectivo" runat="server" Text="Efectivo" Width="114px" OnClick="btnEfectivo_Click" ValidationGroup="Grupo0" />
            </td>
            <td class="auto-style11">
                <br />
                <br />
                <br />
                <br />
                <br />
                DNI:<br />
            </td>
            <td>
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Label ID="lbl_DNI" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10"></td>
            <td class="auto-style11">Nombre:
                <br />
            </td>
            <td>
                <asp:Label ID="lbl_Nombre" runat="server"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style11">Apellido:&nbsp; </td>
            <td>
                <asp:Label ID="lbl_Apellido" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Panel ID="PanelTarjeta" runat="server">
        <br />
        <span class="auto-style9"><strong>Tarjeta de Credito</strong></span><br />
        <br />
        Numero de Tarjeta:<asp:TextBox ID="txt_Tarjeta" runat="server" MaxLength="16" ValidationGroup="Grupo2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_Tarjeta" runat="server" ControlToValidate="txt_Tarjeta" ErrorMessage="Ingresar Numero de Tarjeta" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RegularExpressionValidator ID="rev_Tarjeta" runat="server" ControlToValidate="txt_Tarjeta" ErrorMessage="Numero de Tarjeta No Valido" ValidationExpression="^\d*$" ForeColor="Red" ValidationGroup="Grupo2"></asp:RegularExpressionValidator>
        <br />
        Titular Tarjeta:<asp:TextBox ID="txt_Titular" runat="server" ValidationGroup="Grupo2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_Titular" runat="server" ControlToValidate="txt_Titular" ErrorMessage="Ingresar Nombre del Titular" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RegularExpressionValidator ID="rev_Titular" runat="server" ControlToValidate="txt_Titular" ErrorMessage="Ingresar Nombre Valido" ForeColor="Red" ValidationExpression="^[a-zA-ZÀ-ÿ\u00f1\u00d1]+(\s*[a-zA-ZÀ-ÿ\u00f1\u00d1]*)*[a-zA-ZÀ-ÿ\u00f1\u00d1]+$" ValidationGroup="Grupo2"></asp:RegularExpressionValidator>
        <br />
        Fecha de Vencimiento(MM/AA):<asp:TextBox ID="txt_Vencimiento" runat="server" Width="151px" TextMode="Month" ValidationGroup="Grupo2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_Vencimiento" runat="server" ControlToValidate="txt_Vencimiento" ErrorMessage="Ingresar Fecha de Vencimiento" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        &nbsp;
        <br />
        Codigo de Seguridad:<asp:TextBox ID="txt_CodigoSeg" runat="server" Width="83px" ValidationGroup="Grupo2"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_CodigoSeg" runat="server" ControlToValidate="txt_CodigoSeg" ErrorMessage="Ingresar Codigo de Seguridad" ForeColor="Red" ValidationGroup="Grupo2"></asp:RequiredFieldValidator>
        &nbsp;
        <asp:RegularExpressionValidator ID="rev_CodigoSeg" runat="server" ControlToValidate="txt_CodigoSeg" ErrorMessage="Codigo de Seguridad Erroneo" ValidationExpression="^\d*$" ForeColor="Red" ValidationGroup="Grupo2"></asp:RegularExpressionValidator>
        <br />
        Cuotas:
        <asp:DropDownList ID="ddl_Cuotas" runat="server" ValidationGroup="Grupo2">
            <asp:ListItem Value="--Seleccionar Cuotas--">--Seleccionar Cuotas--</asp:ListItem>
            <asp:ListItem>1 Cuota</asp:ListItem>
            <asp:ListItem>3 Cuota</asp:ListItem>
            <asp:ListItem>6 Cuota</asp:ListItem>
            <asp:ListItem>9 Cuota</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="--Seleccionar Cuotas--" ControlToValidate="ddl_Cuotas" ForeColor="Red" ValidationGroup="Grupo2">Seleccionar Cuotas</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btn_PagarTarj" runat="server" Text="Pagar" ValidationGroup="Grupo2" OnClientClick="return validate();" OnClick="btn_PagarTarj_Click" Width="80px" />
        <script type="text/javascript" language="javascript" >
            function validate() {
                if (Page_ClientValidate())
                    return confirm('¿Está seguro de que quiere editar la cuenta?');
            }
        </script>
        <br />
        <br />
    </asp:Panel>
    <asp:Panel ID="PanelEfectivo" runat="server">
        <br />
        <span class="auto-style9"><strong>Efectivo</strong></span><br />
        <br />
        <asp:DropDownList ID="ddl_Efectivo" runat="server" ValidationGroup="Grupo3">
            <asp:ListItem>--Seleccionar Opcion--</asp:ListItem>
            <asp:ListItem Value="1">Pago Facil</asp:ListItem>
            <asp:ListItem Value="2">Rapi Pago</asp:ListItem>
            <asp:ListItem Value="3">Sucursal</asp:ListItem>
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfv_Efectivo" runat="server" ControlToValidate="ddl_Efectivo" InitialValue="--Seleccionar Opcion--" ForeColor="Red" ValidationGroup="Grupo3">Seleccionar Opcion</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="btn_PagarEfec" runat="server" Text="Pagar" ValidationGroup="Grupo3" OnClientClick="return validate();" OnClick="btn_PagarEfec_Click" Width="77px" />
        <script type="text/javascript" language="javascript" >
            function validate() {
                if (Page_ClientValidate())
                    return confirm('¿Está seguro de que quiere editar la cuenta?');
            }
        </script>
    </asp:Panel>
    <p>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </p>
</asp:Content>
