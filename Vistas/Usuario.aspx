<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="Vistas.Usuario2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            text-align: left;
            height: 31px;
            width: 689px;
        }
        .auto-style10 {
            text-align: right;
            width: 715px;
        }
        .auto-style11 {
            text-align: right;
            height: 31px;
            width: 715px;
        }
        .auto-style12 {
            text-align: left;
            width: 689px;
        }
        .auto-style13 {
            text-align: right;
            height: 30px;
            width: 715px;
        }
        .auto-style14 {
            text-align: left;
            height: 30px;
            width: 689px;
        }
        .auto-style15 {
            width: 528px;
        }
        .auto-style16 {
            text-align: right;
            width: 715px;
            height: 23px;
        }
        .auto-style17 {
            text-align: left;
            height: 23px;
            width: 689px;
        }
        .auto-style18 {
            width: 236px;
        }
        .auto-style19 {
            width: 253%;
        }
        .auto-style20 {
            width: 381px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style16">Nombre:</td>
            <td class="auto-style17">
                <asp:Label ID="lbl_Nombre" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Apellido:</td>
            <td class="auto-style9">
                <asp:Label ID="lbl_Apellido" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Fecha de Nacimiento:</td>
            <td class="auto-style9">
                <asp:Label ID="lbl_FechaNac" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">DNI:</td>
            <td class="auto-style9">
                <asp:Label ID="lbl_DNI" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Telefono:</td>
            <td class="auto-style9">
                <asp:Label ID="lbl_Telefono" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Email:</td>
            <td class="auto-style12">
                <asp:Label ID="lbl_Email" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Domicilio:</td>
            <td class="auto-style12">
                <asp:Label ID="lbl_Domicilio" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Codigo Postal:</td>
            <td class="auto-style14">
                <asp:Label ID="lbl_CodigoPostal" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style10">Usuario:</td>
            <td class="auto-style12">
                <asp:Label ID="lbl_Usuario" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style11">Contraseña:</td>
            <td class="auto-style9">
                <asp:Label ID="lbl_Contraseña" runat="server"></asp:Label>
            &nbsp;
                <asp:Button ID="btnVerContraseña" runat="server" OnClick="btnVerContraseña_Click" Text="Mostrar" Width="57px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="2">
                <asp:Button ID="btnEditar" runat="server" Text="Editar Usuario" PostBackUrl="~/EditarUsuario.aspx" />
                <table class="auto-style1">
                    <tr>
                        <td><strong>Historial De Compras</strong><table class="auto-style1">
                            <tr>
                                <td class="auto-style15">&nbsp;</td>
                                <td class="auto-style18">
                        <asp:GridView ID="grvFacturas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" EmptyDataText="No hay resultados." AllowPaging="True" Height="16px" OnPageIndexChanging="grvFacturas_PageIndexChanging" Width="16px" PageSize="6" OnRowCommand="grvFacturas_RowCommand">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
                            <Columns>
                                <asp:TemplateField HeaderText="N° Factura">
                                    <EditItemTemplate>
                                        <asp:Label ID="eit_lbl_DNI" runat="server" Text='<%# Bind("DNI_Us") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_NFactura" runat="server" Text='<%# Bind("NroFactura_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DNI">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtUsuario" runat="server" Text='<%# Bind("Usuario_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_DNI" runat="server" Text='<%# Bind("DNI_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Metodo Envio">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtMail" runat="server" Text='<%# Bind("Email_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_CodMetEnvio" runat="server" Text='<%# Bind("Descripcion_En") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Metodo Pago">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtDomicilio" runat="server" Text='<%# Bind("Domicilio_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_CodMetPago_Fa" runat="server" Text='<%# Bind("Descripcion_Pa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtCodPostal" runat="server" Text='<%# Bind("CodigoPostal_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lblFecha" runat="server" Text='<%# Bind("Fecha_Fa", "{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Dirección Entrega">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtTelefono" runat="server" Text='<%# Bind("Telefono_Us") %>' Width="129px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_DireccionEntrega" runat="server" Text='<%# Bind("DireccionEntrega_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tarjeta">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtNombre" runat="server" Text='<%# Bind("Nombre_Us") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Tarjeta_Fa" runat="server" Text='<%# Bind("Tarjeta_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="eit_txtFechaNac" runat="server" Text='<%# Bind("FechaNac_Us") %>' TextMode="Date"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="it_lbl_Total" runat="server" Text='<%# Bind("Total_Fa") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:ButtonField ButtonType="Button" CommandName="eventoVerMas" HeaderText="Detalle Venta" Text="Ver detalle " />
                            </Columns>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style: inset;border-width:5px;">
                                    <tr>
                                        <td>No ha realizado compras!</td>
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
                                    <br />
                                    <br />
                                    <asp:Panel ID="Panel2" runat="server">
                                        <table class="auto-style19">
                                            <tr>
                                                <td class="auto-style20">
                                                    <asp:GridView ID="grvDetalleFacturas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AllowPaging="True" OnPageIndexChanging="grvDetalleFacturas_PageIndexChanging">
                                                        <AlternatingRowStyle BackColor="#DCDCDC" />
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="N°Factura">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblNFactura" runat="server" Text='<%# Bind("NroFactura_Df") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Producto">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblNombreProd" runat="server" Text='<%# Bind("Nombre_Pr") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Talle">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblTalle" runat="server" Text='<%# Bind("CodTalle_Ta") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Color">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblColor" runat="server" Text='<%# Bind("Descripcion_Co") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Precio Un.">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblPrecioUn" runat="server" Text='<%# Bind("PrecioUnitario_Df") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Cantidad">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="it_lblCantidad" runat="server" Text='<%# Bind("Cantidad_Df") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
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
                                                    <br />
                                                    <asp:Button ID="btnMostrarFacturas" runat="server" OnClick="btnMostrarFacturas_Click" Text="Mostrar Facturas" />
                                                </td>
                                                <td>
                                                    &nbsp;</td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                    <br />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
