<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="ProductoMás.aspx.cs" Inherits="Vistas.ProductoMás" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <strong>Producto<br />
        <asp:ListView ID="lvProductoMas" runat="server" DataKeyNames="CodProducto_Pr">
            <%--<AlternatingItemTemplate>
                <td runat="server" style="background-color: #FAFAD2;color: #284775;">CodProducto_Pr:
                    <asp:Label ID="CodProducto_PrLabel" runat="server" Text='<%# Eval("CodProducto_Pr") %>' />
                    <br />CodMarca_Pr:
                    <asp:Label ID="CodMarca_PrLabel" runat="server" Text='<%# Eval("CodMarca_Pr") %>' />
                    <br />CodCategoria_Pr:
                    <asp:Label ID="CodCategoria_PrLabel" runat="server" Text='<%# Eval("CodCategoria_Pr") %>' />
                    <br />Descripcion_Pr:
                    <asp:Label ID="Descripcion_PrLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>' />
                    <br />Nombre_Pr:
                    <asp:Label ID="Nombre_PrLabel" runat="server" Text='<%# Eval("Nombre_Pr") %>' />
                    <br />UrlImagen_Pr:
                    <asp:Label ID="UrlImagen_PrLabel" runat="server" Text='<%# Eval("UrlImagen_Pr") %>' />
                    <br />PrecioUnitario_Pr:
                    <asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>' />
                    <br />
                    <asp:CheckBox ID="Estado_PrCheckBox" runat="server" Checked='<%# Eval("Estado_Pr") %>' Enabled="false" Text="Estado_Pr" />
                    <br /></td>
            </AlternatingItemTemplate>--%>
            <EditItemTemplate>
                <td runat="server" style="background-color: #FFCC66;color: #000080;">CodProducto_Pr:
                    <asp:Label ID="CodProducto_PrLabel1" runat="server" Text='<%# Eval("CodProducto_Pr") %>' />
                    <br />CodMarca_Pr:
                    <asp:TextBox ID="CodMarca_PrTextBox" runat="server" Text='<%# Bind("CodMarca_Pr") %>' />
                    <br />CodCategoria_Pr:
                    <asp:TextBox ID="CodCategoria_PrTextBox" runat="server" Text='<%# Bind("CodCategoria_Pr") %>' />
                    <br />Descripcion_Pr:
                    <asp:TextBox ID="Descripcion_PrTextBox" runat="server" Text='<%# Bind("Descripcion_Pr") %>' />
                    <br />Nombre_Pr:
                    <asp:TextBox ID="Nombre_PrTextBox" runat="server" Text='<%# Bind("Nombre_Pr") %>' />
                    <br />UrlImagen_Pr:
                    <asp:TextBox ID="UrlImagen_PrTextBox" runat="server" Text='<%# Bind("UrlImagen_Pr") %>' />
                    <br />PrecioUnitario_Pr:
                    <asp:TextBox ID="PrecioUnitario_PrTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>' />
                    <br />
                    <asp:CheckBox ID="Estado_PrCheckBox" runat="server" Checked='<%# Bind("Estado_Pr") %>' Text="Estado_Pr" />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                    <br /></td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">CodProducto_Pr:
                    <asp:TextBox ID="CodProducto_PrTextBox" runat="server" Text='<%# Bind("CodProducto_Pr") %>' />
                    <br />CodMarca_Pr:
                    <asp:TextBox ID="CodMarca_PrTextBox" runat="server" Text='<%# Bind("CodMarca_Pr") %>' />
                    <br />CodCategoria_Pr:
                    <asp:TextBox ID="CodCategoria_PrTextBox" runat="server" Text='<%# Bind("CodCategoria_Pr") %>' />
                    <br />Descripcion_Pr:
                    <asp:TextBox ID="Descripcion_PrTextBox" runat="server" Text='<%# Bind("Descripcion_Pr") %>' />
                    <br />Nombre_Pr:
                    <asp:TextBox ID="Nombre_PrTextBox" runat="server" Text='<%# Bind("Nombre_Pr") %>' />
                    <br />UrlImagen_Pr:
                    <asp:TextBox ID="UrlImagen_PrTextBox" runat="server" Text='<%# Bind("UrlImagen_Pr") %>' />
                    <br />PrecioUnitario_Pr:
                    <asp:TextBox ID="PrecioUnitario_PrTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>' />
                    <br />
                    <asp:CheckBox ID="Estado_PrCheckBox" runat="server" Checked='<%# Bind("Estado_Pr") %>' Text="Estado_Pr" />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Borrar" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #FFFBD6;color: #333333;">&nbsp;<strong><asp:Label ID="Nombre_PrLabel" runat="server" Text='<%# Eval("Nombre_Pr") %>'></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Descripcion_PrLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>'></asp:Label>
                    <br />
                    &nbsp;&nbsp;
                    <asp:ImageButton ID="ibtnProducto" runat="server" CommandName="eventoVerMas" Height="200px" ImageUrl='<%# Eval("UrlImagen_Pr") %>' Width="200px" />
                    <br />
                    <br />
                    $<asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>' />
                    <br />
                    <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("Nombre_Pr") + "-" + Eval("PrecioUnitario_Pr") %>' CommandName="eventoAgregar" OnCommand="btnAgregar_Command" Text="Agregar" />
                    <br /></td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;"></td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #FFCC66;font-weight: bold;color: #000080;">CodProducto_Pr:
                    <asp:Label ID="CodProducto_PrLabel" runat="server" Text='<%# Eval("CodProducto_Pr") %>' />
                    <br />CodMarca_Pr:
                    <asp:Label ID="CodMarca_PrLabel" runat="server" Text='<%# Eval("CodMarca_Pr") %>' />
                    <br />CodCategoria_Pr:
                    <asp:Label ID="CodCategoria_PrLabel" runat="server" Text='<%# Eval("CodCategoria_Pr") %>' />
                    <br />Descripcion_Pr:
                    <asp:Label ID="Descripcion_PrLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>' />
                    <br />Nombre_Pr:
                    <asp:Label ID="Nombre_PrLabel" runat="server" Text='<%# Eval("Nombre_Pr") %>' />
                    <br />UrlImagen_Pr:
                    <asp:Label ID="UrlImagen_PrLabel" runat="server" Text='<%# Eval("UrlImagen_Pr") %>' />
                    <br />PrecioUnitario_Pr:
                    <asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>' />
                    <br />
                    <asp:CheckBox ID="Estado_PrCheckBox" runat="server" Checked='<%# Eval("Estado_Pr") %>' Enabled="false" Text="Estado_Pr" />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
    </strong>
</p>
<p>
    Talle<br __designer:mapid="4c" />
    <asp:DropDownList runat="server" ID="ddlTalle" AutoPostBack="True" OnSelectedIndexChanged="ddlTalle_SelectedIndexChanged" Width="90px" Height="17px">
    </asp:DropDownList>
    <br __designer:mapid="79" />Color<br __designer:mapid="74" />
    <asp:DropDownList runat="server" ID="ddlColor" AutoPostBack="True" OnSelectedIndexChanged="ddlColor_SelectedIndexChanged">
    </asp:DropDownList>
    <br __designer:mapid="7a" />Cantidad<br __designer:mapid="76" />
    <asp:DropDownList runat="server" ID="ddlCantidad" AutoPostBack="True" Height="18px" Width="91px">
    </asp:DropDownList>
</p>
<br />
<p>
    <asp:Label ID="lblMensaje" runat="server"></asp:Label>
</p>
</asp:Content>
