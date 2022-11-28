<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProducto.aspx.cs" Inherits="Vistas.AdminProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 318px;
        }
        .auto-style3 {
            margin-right: 1px;
        }
        .auto-style4 {
            font-size: x-large;
        }
        .auto-style5 {
            width: 800px;
        }
        .auto-style6 {
            width: 300px;
        }
        .auto-style7 {
            font-size: x-large;
            text-decoration: underline;
        }
        .auto-style8 {
            text-decoration: underline;
        }
        .auto-style9 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbCerrarSesión" runat="server" OnClick="lbCerrarSesión_Click">Cerrar sesión</asp:LinkButton>
            <br />
            <asp:LinkButton ID="lbProcudctos" runat="server" PostBackUrl="~/AdminProducto.aspx">Productos</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbUsuarios" runat="server" PostBackUrl="~/AdminUsuario.aspx">Usuarios</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lbReportes" runat="server" PostBackUrl="~/AdminReportes.aspx">Reportes</asp:LinkButton>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style8"><strong>&nbsp;</strong></span><span class="auto-style7"><strong>Productos</strong></span><br />
            <br />
            <br />
            <strong>Filtros</strong><br />
            <asp:DropDownList ID="ddlFiltro" runat="server" CssClass="auto-style12">
                <asp:ListItem Value="CodProducto_Pr">Codigo Producto</asp:ListItem>
                <asp:ListItem Value="CodMarca_Pr">Codigo Marca</asp:ListItem>
                <asp:ListItem Value="CodCategoria_Pr">Codigo Categoría</asp:ListItem>
                <asp:ListItem Value="Nombre_Pr">Nombre</asp:ListItem>
                <asp:ListItem Value="Descripcion_Pr">Descripcion</asp:ListItem>
                <asp:ListItem Value="Estado_Pr">Estado de Producto</asp:ListItem>
                <asp:ListItem Value="PrecioUnitario_Pr">Precio Unitario</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="txtFiltro" runat="server" CssClass="auto-style2"></asp:TextBox>
            <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" OnClick="btnFiltro_Click" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <table class="auto-style1">
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td>
                        <asp:GridView ID="grvProductos" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="auto-style3" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="grvProductos_PageIndexChanging" OnRowCancelingEdit="grvProductos_RowCancelingEdit" OnRowDeleting="grvProductos_RowDeleting" OnRowEditing="grvProductos_RowEditing" OnRowUpdating="grvProductos_RowUpdating">
                            <AlternatingRowStyle BackColor="Gainsboro" />
                            <Columns>
                                <asp:TemplateField HeaderText="Codigo Producto">
                                    <EditItemTemplate>
                                        <asp:Label ID="eit_lbl_CodProducto" runat="server" Text='<%# Bind("CodProducto_Pr") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_CodProducto" runat="server" Text='<%# Bind("CodProducto_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Marca">
                                    <EditItemTemplate>
                                        <asp:Label ID="eit_lbl_CodMarca" runat="server" Text='<%# Bind("CodMarca_Pr") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_CodMarca" runat="server" Text='<%# Bind("CodMarca_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codigo Categoria">
                                    <EditItemTemplate>
                                        <asp:Label ID="eit_lbl_CodCategoria" runat="server" Text='<%# Bind("CodCategoria_Pr") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_CodCategoria" runat="server" Text='<%# Bind("CodCategoria_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombre">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txt_Nombre" runat="server" Text='<%# Bind("Nombre_Pr") %>' MaxLength="20"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Nombre" runat="server" Text='<%# Bind("Nombre_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Descripcion">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txt_Descripcion" runat="server" Text='<%# Bind("Descripcion_Pr") %>' MaxLength="100"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Descripcion" runat="server" Text='<%# Bind("Descripcion_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Url Imagen">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txt_UrlImagen" runat="server" Text='<%# Bind("UrlImagen_Pr") %>' MaxLength="60"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_UrlImagen" runat="server" Text='<%# Bind("UrlImagen_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Precio Unitario">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txt_Precio" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_PrecioUnitario" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Estado">
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="eit_chk_Estado" runat="server" Checked='<%# Bind("Estado_Pr") %>' />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="it_chk_Estado" runat="server" Checked='<%# Bind("Estado_Pr") %>' Enabled="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                             <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style: inset;border-width:5px;">
                                    <tr>
                                        <td>No se encontraron productos!</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#0000A9" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#000065" />
                        </asp:GridView>
                        <asp:Label ID="lblMensajeGrid" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <strong>
            <br class="auto-style4" />
            <span class="auto-style4">Ingresar Producto:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ingresar Stock del Producto<br />
            <br />
            </span>
            <span class="auto-style9">Código de Producto<br />
            </span>
            <asp:TextBox ID="txtCodProd" runat="server" MaxLength="6"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="rfvCodProducto" runat="server" ControlToValidate="txtCodProd" ForeColor="Red" ValidationGroup="1">Ingresar Código de producto</asp:RequiredFieldValidator>
            </strong>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style5"><strong>Nombre del Producto<br />
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="auto-style2" MaxLength="20"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ForeColor="Red" ValidationGroup="1">Ingresar Nombre</asp:RequiredFieldValidator>
                        </strong></td>
                    <td>C<strong>odigo del Producto<br />
                        <asp:DropDownList ID="ddlCodigoProducto" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Descripcion del Producto<br />
                        <asp:TextBox ID="txtDescripcion" runat="server" Height="21px" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcion" ForeColor="Red" ValidationGroup="1">Ingresar Descripcion</asp:RequiredFieldValidator>
                        </strong></td>
                    <td><strong>Talle del Producto<br />
                        <asp:DropDownList ID="ddlTalleProducto" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Categoría del Producto<br />
                        <asp:DropDownList ID="ddlCategorias" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                    <td><strong>Color del Producto<br />
                        <asp:DropDownList ID="ddlColorProducto" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Marca del Producto<br />
                        <asp:DropDownList ID="ddlMarcas" runat="server">
                        </asp:DropDownList>
                        </strong></td>
                    <td><strong>Stock<br />
                        <asp:TextBox ID="txtStockProducto" runat="server" CssClass="auto-style16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre0" runat="server" ControlToValidate="txtStockProducto" ForeColor="Red" ValidationGroup="2">Ingresar Stock</asp:RequiredFieldValidator>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Url de la Imagen del Producto<br />
                        <asp:TextBox ID="txtUrl" runat="server" CssClass="auto-style16" MaxLength="60"></asp:TextBox>
                        </strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>
                        <asp:Label ID="Label27" runat="server" Text="Precio Unitario"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtPrecioUnitario" runat="server" CssClass="auto-style16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrecioUnitario" runat="server" ControlToValidate="txtPrecioUnitario" ForeColor="Red" ValidationGroup="1">Ingresar Precio Unitario</asp:RequiredFieldValidator>
                        </strong></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Button ID="btnIngresarProducto" runat="server" Text="Ingresar Producto" ValidationGroup="1" OnClick="btnIngresarProducto_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnIngresarStock" runat="server" Text="Ingresar Stock" ValidationGroup="2" OnClick="btnIngresarStock_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:Label ID="lblMensajeProd" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblMensajeStock" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
