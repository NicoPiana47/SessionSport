<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Vistas.Inicio"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .auto-style8 {
            height: 155px;
        }
        .auto-style9 {
            width: 283px;
            height: 143px;
        }
        .auto-style10 {
            width: 402px;
        }
        .auto-style11 {
            width: 100%;
            height: 688px;
        }
        .auto-style12 {
            height: 223px;
            width: 571px;
        }
        .auto-style13 {
            height: 234px;
            width: 571px;
        }
        .auto-style14 {
            height: 63px;
            width: 571px;
        }
        .auto-style15 {
            width: 571px;
        }
        .Busqueda{
            display:flex;
            justify-content:center;
            align-items:center;
            }
        
        .Style_Input_Search {
    margin:5px;
    height: 40px;
    
    border: none;
        }
        .svg_Buscar{
            
    width: 25px;
    height: 25px;

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <p>

        <div class="Busqueda">
          
            <asp:TextBox ID="txtNombreProducto" class="Style_Input_Search I1" placeholder="Buscar productos, marcas etc" runat="server" Width="300px"></asp:TextBox>
            <asp:ImageButton ID="btnFiltrarBusqueda" runat="server" CssClass="svg_Buscar" OnClick="btnFiltrarBusqueda_Click" ImageUrl="~/Íconos/Buscar.svg" />
           
        </div>


        <table class="auto-style1">
            <tr>
                <td class="auto-style10">
                    <table class="auto-style11">
                        <tr>
                           
                                
                         
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12"><strong>--------------------------------------------------------------------------<br />
                                <br />
                                Categorías</strong><asp:RadioButtonList ID="rblCategorias" runat="server">
                                <asp:ListItem Value="1">Remeras</asp:ListItem>
                                <asp:ListItem Value="2">Calzado</asp:ListItem>
                                <asp:ListItem Value="3">Buzos</asp:ListItem>
                                <asp:ListItem Value="4">Pantalones</asp:ListItem>
                                <asp:ListItem Value="5">Gorras</asp:ListItem>
                                <asp:ListItem Value="6">Medias</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:Button ID="btnLimpiarCategorias" runat="server" OnClick="btnLimpiarCategorias_Click" Text="Limpiar" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13"><strong>Marcas</strong><asp:RadioButtonList ID="rblMarcas" runat="server">
                                <asp:ListItem Value="1">Adidas</asp:ListItem>
                                <asp:ListItem Value="2">Nike</asp:ListItem>
                                <asp:ListItem Value="3">Puma</asp:ListItem>
                                <asp:ListItem Value="4">Lacoste</asp:ListItem>
                                <asp:ListItem Value="5">Reebok</asp:ListItem>
                                <asp:ListItem Value="6">Topper</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />
                                <asp:Button ID="btnLimpiarMarcas" runat="server" OnClick="btnLimpiarMarcas_Click" Text="Limpiar" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15">&nbsp; <strong>Precio</strong><br />
                                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Min&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Max<br />
                                <asp:TextBox ID="txtPrecioMin" runat="server" Width="101px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtPrecioMax" runat="server" Width="101px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:DropDownList ID="ddlOrden" runat="server" Height="16px" Width="170px">
                                    <asp:ListItem Value="0">----Seleccionar Orden----</asp:ListItem>
                                    <asp:ListItem Value="PrecioUnitario_Pr ASC">Precio (menor a mayor)</asp:ListItem>
                                    <asp:ListItem Value="PrecioUnitario_Pr DESC">Precio (mayor a menor)</asp:ListItem>
                                </asp:DropDownList>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style15">
                                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" Width="56px" OnClick="btnFiltrar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnQuitarFiltro" runat="server" Text="Quitar Filtro" OnClick="btnQuitarFiltro_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
    <asp:ListView ID="lvProductos" runat="server" DataKeyNames="CodProducto_Pr" GroupItemCount="4" OnPagePropertiesChanging="lvProductos_PagePropertiesChanging1">
       <%-- <AlternatingItemTemplate>
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
                <br />PrecioUnitario_Pr:
                <asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>' />
                <br />UrlImagen_Pr:
                <asp:Label ID="UrlImagen_PrLabel" runat="server" Text='<%# Eval("UrlImagen_Pr") %>' />
                <br />
                <asp:CheckBox ID="Estado_PrCheckBox" runat="server" Checked='<%# Eval("Estado_Pr") %>' Enabled="False" Text="Estado_Pr" />
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
                <br />PrecioUnitario_Pr:
                <asp:TextBox ID="PrecioUnitario_PrTextBox" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>' />
                <br />UrlImagen_Pr:
                <asp:TextBox ID="UrlImagen_PrTextBox" runat="server" Text='<%# Bind("UrlImagen_Pr") %>' />
                <br />
                <asp:CheckBox ID="Estado_PrCheckBox" runat="server" Checked='<%# Bind("Estado_Pr") %>' Text="Estado_Pr" />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Actualizar" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancelar" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style: inset;border-width:5px;">
                <tr>
                    <td>No contamos con esos productos!</td>
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
                <asp:TextBox ID="CodMarca_PrTextBox0" runat="server" Text='<%# Bind("CodMarca_Pr") %>' />
                <br />CodCategoria_Pr:
                <asp:TextBox ID="CodCategoria_PrTextBox0" runat="server" Text='<%# Bind("CodCategoria_Pr") %>' />
                <br />Descripcion_Pr:
                <asp:TextBox ID="Descripcion_PrTextBox0" runat="server" Text='<%# Bind("Descripcion_Pr") %>' />
                <br />Nombre_Pr:
                <asp:TextBox ID="Nombre_PrTextBox0" runat="server" Text='<%# Bind("Nombre_Pr") %>' />
                <br />PrecioUnitario_Pr:
                <asp:TextBox ID="PrecioUnitario_PrTextBox0" runat="server" Text='<%# Bind("PrecioUnitario_Pr") %>' />
                <br />UrlImagen_Pr:
                <asp:TextBox ID="UrlImagen_PrTextBox0" runat="server" Text='<%# Bind("UrlImagen_Pr") %>' />
                <br />
                <asp:CheckBox ID="Estado_PrCheckBox0" runat="server" Checked='<%# Bind("Estado_Pr") %>' Text="Estado_Pr" />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insertar" />
                <br />
                <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" Text="Borrar" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" class="auto-style9" style="background-color: #FFFBD6; color: #333333;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>
                <asp:Label ID="Nombre_PrLabel" runat="server" Text='<%# Eval("Nombre_Pr") %>'></asp:Label>
                </strong>
                <br />
                <asp:Label ID="Descripcion_PrLabel" runat="server" Text='<%# Eval("Descripcion_Pr") %>'></asp:Label>
                <br />
                &nbsp;&nbsp;
                <asp:ImageButton ID="ibtnProducto" runat="server" Height="200px" ImageUrl='<%# Eval("UrlImagen_Pr") %>' Width="200px" CommandName="eventoVerMas" />
                <br />
                <br />
                $<asp:Label ID="PrecioUnitario_PrLabel" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>'></asp:Label>
                <br />
                <asp:Button ID="btnVerMas" style="margin:auto;" runat="server" Text="Ver más" Width="105px" CommandArgument='<%# Eval("CodProducto_Pr") %>' OnCommand="btnVerMas_Command" CommandName="eventoVerMas" />
                <br /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server" class="auto-style8">
                        <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        <asp:DataPager ID="dpProductos" runat="server" PageSize="8">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </td>
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
                <asp:Label ID="Descripcion_PrLabel0" runat="server" Text='<%# Eval("Descripcion_Pr") %>' />
                <br />Nombre_Pr:
                <asp:Label ID="Nombre_PrLabel0" runat="server" Text='<%# Eval("Nombre_Pr") %>' />
                <br />PrecioUnitario_Pr:
                <asp:Label ID="PrecioUnitario_PrLabel0" runat="server" Text='<%# Eval("PrecioUnitario_Pr") %>' />
                <br />UrlImagen_Pr:
                <asp:Label ID="UrlImagen_PrLabel" runat="server" Text='<%# Eval("UrlImagen_Pr") %>' />
                <br />
                <asp:CheckBox ID="Estado_PrCheckBox1" runat="server" Checked='<%# Eval("Estado_Pr") %>' Enabled="false" Text="Estado_Pr" />
                <br /></td>
        </SelectedItemTemplate>
    </asp:ListView>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblMensaje" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</p>
    <p>
        &nbsp;</p>
    </asp:Content>
