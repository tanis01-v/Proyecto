<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonaPrincipal.aspx.cs" Inherits="UTTT.Ejemplo.Persona.PersonaPrincipal"  debug=false%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body bgcolor="#F6D7D0">
    <form id="form1" runat="server">
    
    <div style="color: #000000; font-size: medium; font-family: Arial; font-weight: bold">    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    Persona</div>
    <div>


    <p>
        Nombre:&nbsp;&nbsp;&nbsp;

        <asp:TextBox ID="txtNombre" runat="server" Width="174px" 
            ViewStateMode="Disabled"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
            onclick="btnBuscar_Click" ViewStateMode="Disabled" />
        &nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
            onclick="btnAgregar_Click" ViewStateMode="Disabled" />
    </p>
    </div>
    <div>
    
        Sexo:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlSexo" runat="server" Height="22px" Width="177px">
        </asp:DropDownList>
    
    </div>
    <div style="font-weight: bold">
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Detalle</div>

        <div>
        
        </div>
       
        <div>
        
             <asp:GridView ID="dgvPersonas" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="DataSourcePersona" GridLines="Horizontal" onrowcommand="dgvPersonas_RowCommand" OnSelectedIndexChanged="dgvPersonas_SelectedIndexChanged" ViewStateMode="Disabled" Width="1409px">
                 <AlternatingRowStyle BackColor="#F7F7F7" />
                 <Columns>
                     <asp:BoundField DataField="strClaveUnica" HeaderText="Clave Unica" ReadOnly="True" SortExpression="strClaveUnica" />
                     <asp:BoundField DataField="strNombre" HeaderText="Nombre" ReadOnly="True" SortExpression="strNombre" />
                     <asp:BoundField DataField="strAPaterno" HeaderText="APaterno" ReadOnly="True" SortExpression="strAPaterno" />
                     <asp:BoundField DataField="strAMaterno" HeaderText="AMaterno" ReadOnly="True" SortExpression="strAMaterno" />
                     <asp:BoundField DataField="CatSexo" HeaderText="Sexo" SortExpression="CatSexo" />
                     <asp:BoundField DataField="fechaNacimiento" HeaderText="Fecha Nacimiento" ReadOnly="True" SortExpression="fechaNacimiento" />
                     <asp:BoundField DataField="correoElectronico" HeaderText="Correo Electronico" ReadOnly="True" SortExpression="correoElectronico" />
                     <asp:BoundField DataField="codigoPostal" HeaderText="Codigo Postal" ReadOnly="True" SortExpression="codigoPostal" />
                     <asp:BoundField DataField="rfc" HeaderText="RFC" ReadOnly="True" SortExpression="rfc" />
                     <asp:TemplateField HeaderText="Editar">
                         <ItemTemplate>
                             <asp:ImageButton ID="imgEditar" runat="server" CommandArgument='<%#Bind("id") %>' CommandName="Editar" ImageUrl="~/Images/editrecord_16x16.png" />
                         </ItemTemplate>
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" Width="50px" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Eliminar" Visible="True">
                         <ItemTemplate>
                             <asp:ImageButton ID="imgEliminar" runat="server" CommandArgument='<%#Bind("id") %>' CommandName="Eliminar" ImageUrl="~/Images/delrecord_16x16.png" OnClientClick="javascript:return confirm('¿Está seguro de querer eliminar el registro seleccionado?', 'Mensaje de sistema')" />
                         </ItemTemplate>
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" Width="50px" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="Direccion">
                         <ItemTemplate>
                             <asp:ImageButton ID="imgDireccion" runat="server" CommandArgument='<%#Bind("id") %>' CommandName="Direccion" ImageUrl="~/Images/editrecord_16x16.png" />
                         </ItemTemplate>
                         <HeaderStyle HorizontalAlign="Center" />
                         <ItemStyle HorizontalAlign="Center" Width="50px" />
                     </asp:TemplateField>
                 </Columns>
                 <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                 <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                 <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                 <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                 <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                 <SortedAscendingCellStyle BackColor="#F4F4FD" />
                 <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                 <SortedDescendingCellStyle BackColor="#D8D8F0" />
                 <SortedDescendingHeaderStyle BackColor="#3E3277" />
             </asp:GridView>
        
        </div>
        <asp:LinqDataSource ID="DataSourcePersona" runat="server" ContextTypeName="UTTT.Ejemplo.Linq.Data.Entity.DcGeneralDataContext" EntityTypeName="" onselecting="DataSourcePersona_Selecting" Select="new (strNombre, strAPaterno, strAMaterno, CatSexo, strClaveUnica,id, fechaNacimiento, correoElectronico, codigoPostal, rfc)" TableName="Persona">
        </asp:LinqDataSource>
    </form>
</body>
</html>
